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

/--
  The Brute Force Indifference Theorem:
  If a hash function is chosen uniformly at random from all functions X → Y,
  any two sequences of distinct nonces of the same length have the exact same
  probability of finding a valid hash. There are no "smart" guessing strategies.
-/
--tester inserted
#check successfulFunctions
#check successfulFunctions [2,3,5,2,4,5] (Finset.insert 3 Finset.empty)
--end tester
lemma equiv_of_list_card_eq (L₁ L₂ : List X) (h₁ : L₁.Nodup) (h₂ : L₂.Nodup)
    (h_len : L₁.length = L₂.length) :
    ∃ e : Equiv.Perm X, ∀ x, x ∈ L₁ ↔ e x ∈ L₂ := by
  sorry

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
