/- Copyright Manabu Hagiwara 2022, 2026 -/
import VTlean.B

namespace List
variable (X : List B)

def num_Is : List B → Nat
| [] => 0
| B.O :: tail => num_Is tail
| B.I :: tail => num_Is tail + 1

def num_Os : List B → Nat
| [] => 0
| B.O :: tail => num_Os tail + 1
| B.I :: tail => num_Os tail

lemma num_Os_add_num_Is_eq_length (X : List B) : num_Os X + num_Is X = X.length := by
  induction X with
  | nil => rfl
  | cons x X' ih =>
    cases x
    · change (num_Os X' + 1) + num_Is X' = X'.length + 1
      rw [Nat.add_right_comm, ih]
    · change num_Os X' + (num_Is X' + 1) = X'.length + 1
      rw [← Nat.add_assoc, ih]

lemma num_Is_append (X Y : List B) : num_Is (X ++ Y) = num_Is X + num_Is Y := by
  induction X with
  | nil => exact (Nat.zero_add _).symm
  | cons x X' ih =>
    cases x
    · change num_Is (X' ++ Y) = num_Is X' + num_Is Y
      exact ih
    · change num_Is (X' ++ Y) + 1 = (num_Is X' + 1) + num_Is Y
      rw [ih, Nat.add_right_comm]

lemma num_Os_append (X Y : List B) : num_Os (X ++ Y) = num_Os X + num_Os Y := by
  induction X with
  | nil => exact (Nat.zero_add _).symm
  | cons x X' ih =>
    cases x
    · change num_Os (X' ++ Y) + 1 = (num_Os X' + 1) + num_Os Y
      rw [ih, Nat.add_right_comm]
    · change num_Os (X' ++ Y) = num_Os X' + num_Os Y
      exact ih

lemma num_Is_replicate_O (n : Nat) : num_Is (replicate n B.O) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change num_Is (replicate n B.O) = 0
    exact ih

lemma num_Is_replicate_I (n : Nat) : num_Is (replicate n B.I) = n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change num_Is (replicate n B.I) + 1 = n + 1
    rw [ih]

lemma num_Os_replicate_O (n : Nat) : num_Os (replicate n B.O) = n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change num_Os (replicate n B.O) + 1 = n + 1
    rw [ih]

lemma num_Os_replicate_I (n : Nat) : num_Os (replicate n B.I) = 0 := by
  induction n with
  | zero => rfl
  | succ n ih =>
    change num_Os (replicate n B.I) = 0
    exact ih

lemma num_Is_flip (X : List B) : num_Is (B.List.flip X) = num_Os X := by
  induction X with
  | nil => rfl
  | cons x X' ih =>
    cases x
    · change num_Is (B.I :: B.List.flip X') = num_Os X' + 1
      change num_Is (B.List.flip X') + 1 = num_Os X' + 1
      rw [ih]
    · change num_Is (B.O :: B.List.flip X') = num_Os X'
      change num_Is (B.List.flip X') = num_Os X'
      rw [ih]

end List

namespace Vector
variable {n : Nat}

def num_Is (X : Vector B n) : Nat := List.num_Is X.toList

def num_Os (X : Vector B n) : Nat := List.num_Os X.toList

end Vector
