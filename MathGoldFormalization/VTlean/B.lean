/- Copyright Manabu Hagiwara 2022, 2026 -/
import Mathlib
import Mathlib.Data.Finset.Basic

open scoped Classical

inductive B : Type
| O : B
| I : B
deriving Repr, DecidableEq, Inhabited, Fintype

namespace B

@[simp] lemma card_B : Fintype.card B = 2 := rfl

def toNat : B → Nat
| O => 0
| I => 1

def flip : B → B
| O => I
| I => O

lemma eq_of_flip_eq (x y : B) (H : flip x = flip y) : x = y := by
  cases x <;> cases y <;> first | rfl | contradiction

lemma flip_eq_flip_iff (x y : B) : flip x = flip y ↔ x = y :=
  ⟨eq_of_flip_eq x y, fun h => by rw [h]⟩

lemma flip_flip (x : B) : flip (flip x) = x := by
  cases x <;> rfl

lemma flip_eq_iff (x y : B) : flip x = y ↔ x = flip y := by
  constructor
  · intro h; rw [← h, flip_flip]
  · intro h; rw [h, flip_flip]

lemma flip_ne_self (x : B) : x ≠ flip x := by
  cases x <;> intro h <;> contradiction

lemma flip_of_ne {x x' : B} (Hne : x ≠ x') : flip x = x' := by
  cases x <;> cases x' <;> first | rfl | contradiction

namespace List
variable (X Y : List B) (i : Nat)

def toNat : List B → Nat
| [] => 0
| x :: X => 2 * toNat X + B.toNat x

def flip : List B → List B
| [] => []
| x :: X => B.flip x :: flip X

lemma flip_nil : flip ([] : List B) = [] := rfl

lemma eq_of_flip_eq_list {X Y : List B} (H : flip X = flip Y) : X = Y := by
  induction X generalizing Y with
  | nil =>
    cases Y with
    | nil => rfl
    | cons y Y' => contradiction
  | cons x X' ih =>
    cases Y with
    | nil => contradiction
    | cons y Y' =>
      injection H with h1 h2
      have hx_eq_y := B.eq_of_flip_eq x y h1
      have hX_eq_Y := ih h2
      rw [hx_eq_y, hX_eq_Y]

lemma flip_eq_flip_iff_list {X Y : List B} : flip X = flip Y ↔ X = Y :=
  ⟨eq_of_flip_eq_list, fun h => by rw [h]⟩

lemma flip_flip_list (X : List B) : flip (flip X) = X := by
  induction X with
  | nil => rfl
  | cons x X' ih =>
    change B.flip (B.flip x) :: flip (flip X') = x :: X'
    rw [B.flip_flip, ih]

lemma flip_eq_iff_list {X Y : List B} : flip X = Y ↔ X = flip Y := by
  constructor
  · intro h; rw [← h, flip_flip_list]
  · intro h; rw [h, flip_flip_list]

lemma length_flip (X : List B) : (flip X).length = X.length := by
  induction X with
  | nil => rfl
  | cons x X' ih =>
    change (B.flip x :: flip X').length = (x :: X').length
    simp [ih]

end List

namespace Vector
variable {n : Nat}

def flip (X : List.Vector B n) : List.Vector B n :=
  ⟨List.flip X.val, by {
    have h_len : X.val.length = n := X.2
    rw [List.length_flip]
    exact h_len
  }⟩

lemma flip_flip (X : List.Vector B n) : flip (flip X) = X := by
  apply Subtype.ext
  change List.flip (List.flip X.val) = X.val
  exact List.flip_flip_list X.val

end Vector

namespace Finset

variable {n : Nat}

open B.Vector

lemma flip_injective : Function.Injective (@B.Vector.flip n) :=
by {
  intro X Y h
  have h2 := congrArg B.Vector.flip h
  rw [B.Vector.flip_flip, B.Vector.flip_flip] at h2
  exact h2
}

def flipCode (C : Finset (List.Vector B n)) : Finset (List.Vector B n) :=
  C.image B.Vector.flip

lemma mem_flipCode (C : Finset (List.Vector B n)) (x : List.Vector B n):
  x ∈ flipCode C ↔ ∃ y ∈ C, B.Vector.flip y = x :=
by {
  unfold flipCode
  rw [Finset.mem_image]
}

lemma flipCode_mem (C : Finset (List.Vector B n)) (x : List.Vector B n):
  B.Vector.flip x ∈ C ↔ x ∈ flipCode C :=
by {
  apply Iff.intro
  · intro h
    rw [mem_flipCode]
    use B.Vector.flip x
    exact ⟨h, B.Vector.flip_flip x⟩
  · intro h
    rw [mem_flipCode] at h
    rcases h with ⟨y, hy, hxy⟩
    rw [← hxy, B.Vector.flip_flip y]
    exact hy
}

lemma flipCode_empty :
  flipCode (∅ : Finset (List.Vector B n)) = ∅ :=
by {
  unfold flipCode
  rw [Finset.image_empty]
}

lemma flipCode_univ :
  flipCode (Finset.univ : Finset (List.Vector B n)) = Finset.univ :=
by {
  apply Finset.Subset.antisymm
  · exact Finset.subset_univ _
  · intro x _
    rw [mem_flipCode]
    use B.Vector.flip x
    exact ⟨Finset.mem_univ _, B.Vector.flip_flip x⟩
}

lemma flipCode_flipCode (C : Finset (List.Vector B n)) :
  flipCode (flipCode C) = C :=
by {
  apply Finset.Subset.antisymm
  · intro X hX
    rw [mem_flipCode] at hX
    rcases hX with ⟨Y, hY, hYX⟩
    rw [mem_flipCode] at hY
    rcases hY with ⟨Z, hZ, hZY⟩
    rw [← hYX, ← hZY, B.Vector.flip_flip]
    exact hZ
  · intro X hX
    rw [mem_flipCode]
    use B.Vector.flip X
    have h1 : B.Vector.flip (B.Vector.flip X) = X := B.Vector.flip_flip X
    have h2 : B.Vector.flip (B.Vector.flip X) ∈ C := by rwa [h1]
    have h3 : B.Vector.flip X ∈ flipCode C := (flipCode_mem C (B.Vector.flip X)).mp h2
    exact ⟨h3, h1⟩
}

lemma flipCode_subset (C C' : Finset (List.Vector B n)) (H : C ⊆ C') :
  flipCode C ⊆ flipCode C' :=
by {
  intro X hX
  rw [mem_flipCode] at hX ⊢
  rcases hX with ⟨Y, hY, hYX⟩
  exact ⟨Y, H hY, hYX⟩
}

lemma flipCode_union (C C' : Finset (List.Vector B n)) :
  flipCode (C ∪ C') = flipCode C ∪ flipCode C' :=
by {
  unfold flipCode
  rw [Finset.image_union]
}

lemma flipCode_inter (C C' : Finset (List.Vector B n)) :
  flipCode (C ∩ C') = flipCode C ∩ flipCode C' :=
by {
  unfold flipCode
  exact Finset.image_inter C C' flip_injective
}

lemma flipCode_insert (C : Finset (List.Vector B n)) (X : List.Vector B n) :
  flipCode (insert X C) = insert (B.Vector.flip X) (flipCode C) :=
by {
  unfold flipCode
  exact Finset.image_insert B.Vector.flip X C
}

lemma flipCode_erase (C : Finset (List.Vector B n)) (X : List.Vector B n) :
  flipCode (Finset.erase C X) = Finset.erase (flipCode C) (B.Vector.flip X) :=
by {
  unfold flipCode
  exact Finset.image_erase flip_injective C X
}

lemma flipCode_sdiff (C₁ C₂ : Finset (List.Vector B n)) :
  flipCode (C₁ \ C₂) = flipCode C₁ \ flipCode C₂ :=
by {
  unfold flipCode
  exact Finset.image_sdiff C₁ C₂ flip_injective
}

lemma card_flipCode (C : Finset (List.Vector B n)) :
  (flipCode C).card = C.card :=
by {
  unfold flipCode
  exact Finset.card_image_of_injective C flip_injective
}

end Finset

end B
