import Mathlib

open Finset
open Fintype

variable {X Y : Type*} [Fintype X] [Fintype Y] [DecidableEq X] [DecidableEq Y]
variable (S : Finset Y)

/--
  Given a list of inputs `L : List X`, what is the set of functions `f`
  that map at least one element of `L` into the target set `S`?
-/
def successfulFunctions (L : List X) (S : Finset Y) : Finset (X → Y) :=
  univ.filter (fun f => ∃ x ∈ L, f x ∈ S)

/-
  The Brute Force Indifference Theorem:
  If a hash function is chosen uniformly at random from all functions X → Y,
  any two sequences of distinct nonces of the same length have the exact same
  probability of finding a valid hash. There are no "smart" guessing strategies.
-/
--tester inserted
#check successfulFunctions
#check successfulFunctions ([(2 : Fin 6), 3, 5, 2, 4, 5] : List (Fin 6)) ({3} : Finset (Fin 6))
--end tester
set_option linter.unusedDecidableInType false
set_option linter.unusedFintypeInType false
lemma equiv_of_list_card_eq (L₁ L₂ : List X) (h₁ : L₁.Nodup) (h₂ : L₂.Nodup)
    (h_len : L₁.length = L₂.length) :
    ∃ e : Equiv.Perm X, ∀ x, x ∈ L₁ ↔ e x ∈ L₂ := by
  have h_card : Fintype.card ↥L₁.toFinset = Fintype.card ↥L₂.toFinset := by
    rw [Fintype.card_coe, Fintype.card_coe]
    rw [List.toFinset_card_of_nodup h₁, List.toFinset_card_of_nodup h₂, h_len]
  have h_card_compl : Fintype.card ↥(L₁.toFinsetᶜ) = Fintype.card ↥(L₂.toFinsetᶜ) := by
    rw [Fintype.card_coe, Fintype.card_coe]
    rw [card_compl, card_compl]
    have h_card_finset : L₁.toFinset.card = L₂.toFinset.card := by
      rw [List.toFinset_card_of_nodup h₁, List.toFinset_card_of_nodup h₂, h_len]
    rw [h_card_finset]
  have e1 : ↥L₁.toFinset ≃ ↥L₂.toFinset := Fintype.equivOfCardEq h_card
  have e2 : ↥(L₁.toFinsetᶜ) ≃ ↥(L₂.toFinsetᶜ) := Fintype.equivOfCardEq h_card_compl
  let f : X → X := fun x =>
    if h : x ∈ L₁.toFinset then e1 ⟨x, h⟩
    else e2 ⟨x, mem_compl.mpr h⟩
  let g : X → X := fun y =>
    if h : y ∈ L₂.toFinset then e1.symm ⟨y, h⟩
    else e2.symm ⟨y, mem_compl.mpr h⟩
  have hgf : ∀ x, g (f x) = x := by
    intro x
    dsimp [f, g]
    split
    · next h =>
      have h2 : ↑(e1 ⟨x, h⟩) ∈ L₂.toFinset := (e1 ⟨x, h⟩).prop
      simp [h2]
    · next h =>
      have h2 : ↑(e2 ⟨x, mem_compl.mpr h⟩) ∉ L₂.toFinset := by
        have := (e2 ⟨x, mem_compl.mpr h⟩).prop
        rwa [mem_compl] at this
      simp [h2]
  have hfg : ∀ y, f (g y) = y := by
    intro y
    dsimp [f, g]
    split
    · next h =>
      have h2 : ↑(e1.symm ⟨y, h⟩) ∈ L₁.toFinset := (e1.symm ⟨y, h⟩).prop
      simp [h2]
    · next h =>
      have h2 : ↑(e2.symm ⟨y, mem_compl.mpr h⟩) ∉ L₁.toFinset := by
        have := (e2.symm ⟨y, mem_compl.mpr h⟩).prop
        rwa [mem_compl] at this
      simp [h2]
  use { toFun := f, invFun := g, left_inv := hgf, right_inv := hfg }
  intro x
  dsimp [f]
  split
  · next h =>
    have h2 : ↑(e1 ⟨x, h⟩) ∈ L₂.toFinset := (e1 ⟨x, h⟩).prop
    rw [List.mem_toFinset] at h h2
    tauto
  · next h =>
    have h2 : ↑(e2 ⟨x, mem_compl.mpr h⟩) ∉ L₂.toFinset := by
      have := (e2 ⟨x, mem_compl.mpr h⟩).prop
      rwa [mem_compl] at this
    rw [List.mem_toFinset] at h h2
    tauto

def equivFun (e : Equiv.Perm X) : Equiv.Perm (X → Y) where
  toFun f := f ∘ e.symm
  invFun f := f ∘ e
  left_inv f := by ext x; simp
  right_inv f := by ext x; simp

theorem random_oracle_brute_force_indifference
    (L₁ L₂ : List X)
    (h_nodup₁ : L₁.Nodup)
    (h_nodup₂ : L₂.Nodup)
    (h_len : L₁.length = L₂.length) :
    (successfulFunctions L₁ S).card = (successfulFunctions L₂ S).card := by
  obtain ⟨e, he⟩ := equiv_of_list_card_eq L₁ L₂ h_nodup₁ h_nodup₂ h_len
  let F : (X → Y) ↪ (X → Y) := (equivFun e).toEmbedding
  have H : (successfulFunctions L₁ S).map F = successfulFunctions L₂ S := by
    ext f
    simp only [successfulFunctions, mem_map, mem_filter, mem_univ, true_and]
    constructor
    · rintro ⟨g, hg, rfl⟩
      obtain ⟨x, hx_in, hx_S⟩ := hg
      use e x
      constructor
      · rw [← he]
        exact hx_in
      · change (g ∘ e.symm) (e x) ∈ S
        simp [hx_S]
    · intro hf
      obtain ⟨x, hx_in, hx_S⟩ := hf
      use f ∘ e
      constructor
      · use e.symm x
        constructor
        · rw [he]
          rwa [Equiv.apply_symm_apply]
        · change (f ∘ e) (e.symm x) ∈ S
          simp [hx_S]
      · ext z
        change (f ∘ e) (e.symm z) = f z
        simp
  rw [← H]
  rw [Finset.card_map]
