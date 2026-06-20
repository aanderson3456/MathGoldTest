/- Copyright Manabu Hagiwara 2022, 2026 -/
import VTlean.NumOsNumIs
import VTlean.InsDel
import Mathlib
import VTlean.DelCode


open Nat Finset B
namespace List
variable (X Y : List B) (x : B) (i : Nat)

def moment_sub : List B → Nat → Nat
| [], _ => 0
| B.O :: tail, n => moment_sub tail (n + 1)
| B.I :: tail, n => moment_sub tail (n + 1) + n

lemma moment_sub_succ (X : List B) (n : Nat) :
  moment_sub X (n + 1) = moment_sub X n + num_Is X := by
  revert n
  induction X with
  | nil =>
    intro n; rfl
  | cons x X' ih =>
    intro n
    cases x
    · change moment_sub X' (n + 1 + 1) = moment_sub X' (n + 1) + num_Is X'
      rw [ih (n + 1)]
    · change moment_sub X' (n + 1 + 1) + (n + 1) = moment_sub X' (n + 1) + n + (num_Is X' + 1)
      rw [ih (n + 1)]
      ac_rfl

def moment (X : List B) : Nat := moment_sub X 1

/-! We use macroscopic lemmas mapped correctly to List native forms. -/


def num_RIs (X : List B) (i : Nat) : Nat := num_Is (X.drop i)
def num_LOs (X : List B) (i : Nat) : Nat := num_Os (X.take i)

lemma moment_nil : moment ([] : List B) = 0 := rfl

lemma moment_zero : moment [B.O] = 0 := rfl

lemma moment_one : moment [B.I] = 1 := rfl

lemma moment_singleton (x : B) : moment [x] = num_Is [x] := by
  cases x <;> rfl

lemma moment_cons (x : B) (X : List B) :
  moment (x :: X) = moment X + num_Is (x :: X) := by
  cases x
  · change moment_sub X 2 = moment_sub X 1 + num_Is X
    exact moment_sub_succ X 1
  · change moment_sub X 2 + 1 = moment_sub X 1 + (num_Is X + 1)
    rw [moment_sub_succ X 1]
    ac_rfl


lemma moment_le_cons (x : B) (X : List B) :
  moment X ≤ moment (x :: X) := by {
  rw [moment_cons]
  exact Nat.le_add_right _ _
}

lemma num_Is_sDel_le (X : List B) (i : Nat) : num_Is (sDel X i) ≤ num_Is X := by {
  revert i
  induction X with
  | nil => intro i; exact Nat.le_refl _
  | cons x X' IHX =>
    intro i
    cases X' with
    | nil => exact Nat.zero_le _
    | cons x' X'' =>
      cases i with
      | zero =>
        change num_Is (x' :: X'') ≤ num_Is (x :: x' :: X'')
        cases x with
        | O => exact Nat.le_refl _
        | I => exact Nat.le_add_right _ _
      | succ i =>
        change num_Is (x :: sDel (x' :: X'') i) ≤ num_Is (x :: x' :: X'')
        cases x with
        | O => exact IHX i
        | I =>
          apply Nat.succ_le_succ
          exact IHX i
}

lemma num_Is_le_sIns (X : List B) (i : Nat) (b : B) : num_Is X ≤ num_Is (sIns X i b) := by {
  revert i
  induction X with
  | nil =>
    intro i
    exact Nat.zero_le _
  | cons x X' IHX =>
    intro i
    cases i with
    | zero =>
      change num_Is (x :: X') ≤ num_Is (b :: x :: X')
      cases b with
      | O => exact Nat.le_refl _
      | I => exact Nat.le_add_right _ _
    | succ i =>
      change num_Is (x :: X') ≤ num_Is (x :: sIns X' i b)
      cases x with
      | O => exact IHX i
      | I =>
        apply Nat.succ_le_succ
        exact IHX i
}

lemma num_Is_sIns_zero (X : List B) (i : Nat) : num_Is (sIns X i B.O) = num_Is X := by {
  revert i
  induction X with
  | nil => intro i; rfl
  | cons x X' IHX =>
    intro i
    cases i with
    | zero => rfl
    | succ i =>
      change num_Is (x :: sIns X' i B.O) = num_Is (x :: X')
      cases x with
      | O => exact IHX i
      | I =>
        change num_Is (sIns X' i B.O) + 1 = num_Is X' + 1
        rw [IHX i]
}

lemma num_Is_sIns_one (X : List B) (i : Nat) : num_Is (sIns X i B.I) = num_Is X + 1 := by {
  revert i
  induction X with
  | nil => intro i; rfl
  | cons x X' IHX =>
    intro i
    cases i with
    | zero => rfl
    | succ i =>
      change num_Is (x :: sIns X' i B.I) = num_Is (x :: X') + 1
      cases x with
      | O => exact IHX i
      | I =>
        change num_Is (sIns X' i B.I) + 1 = (num_Is X' + 1) + 1
        rw [IHX i]
}

lemma moment_sDel_le :
  moment (sDel X i) ≤ moment X := by {
  revert i
  induction X with
  | nil =>
    intro i
    exact Nat.zero_le _
  | cons x X' IHX =>
    intro i
    cases X' with
    | nil => exact Nat.zero_le _
    | cons x' X'' =>
      cases i with
      | zero =>
        change moment (x' :: X'') ≤ moment (x :: x' :: X'')
        exact moment_le_cons x (x' :: X'')
      | succ i =>
        change moment (x :: sDel (x' :: X'') i) ≤ moment (x :: x' :: X'')
        rw [moment_cons, moment_cons]
        apply Nat.add_le_add (IHX i)
        cases x with
        | O =>
          change num_Is (sDel (x' :: X'') i) ≤ num_Is (x' :: X'')
          exact num_Is_sDel_le (x' :: X'') i
        | I =>
          change num_Is (sDel (x' :: X'') i) + 1 ≤ num_Is (x' :: X'') + 1
          apply Nat.succ_le_succ
          exact num_Is_sDel_le (x' :: X'') i
}

lemma moment_le_sIns :
  (moment X) ≤ (moment ((sIns X i b))) := by {
  revert i
  induction X with
  | nil =>
    intro i
    change 0 ≤ moment [b]
    exact Nat.zero_le _
  | cons x X' IHX =>
    intro i
    cases i with
    | zero =>
      change moment (x :: X') ≤ moment (b :: x :: X')
      exact moment_le_cons b (x :: X')
    | succ i =>
      change moment (x :: X') ≤ moment (x :: sIns X' i b)
      rw [moment_cons, moment_cons]
      apply Nat.add_le_add (IHX i)
      exact num_Is_le_sIns (x :: X') (i + 1) b
}

lemma moment_sIns_zero :
  (moment ((sIns X i B.O))) = (moment X) + num_RIs X i := by {
  revert i
  induction X with
  | nil =>
    intro i
    change moment [B.O] = moment [] + num_RIs [] i
    rw [moment_zero, moment_nil, num_RIs]
    change 0 = 0 + num_Is (List.drop i [])
    have h_drop : List.drop i ([] : List B) = [] := by cases i <;> rfl
    rw [h_drop, num_Is]
  | cons x X' IHX =>
    intro i
    cases i with
    | zero =>
      change moment (B.O :: x :: X') = moment (x :: X') + num_RIs (x :: X') 0
      rw [moment_cons, moment_cons, num_RIs, List.drop_zero]
      rfl
    | succ i =>
      change moment (x :: sIns X' i B.O) = moment (x :: X') + num_Is (List.drop (i + 1) (x :: X'))
      have h_drop : List.drop (i + 1) (x :: X') = List.drop i X' := rfl
      rw [h_drop, moment_cons, moment_cons, IHX i]
      cases x with
      | O =>
        have h_num_Is : num_Is (B.O :: sIns X' i B.O) = num_Is (sIns X' i B.O) := rfl
        have h_num_Is_O : num_Is (B.O :: X') = num_Is X' := rfl
        rw [h_num_Is, num_Is_sIns_zero X' i, h_num_Is_O, num_RIs]
        ac_rfl
      | I =>
        have h_num_Is : num_Is (B.I :: sIns X' i B.O) = num_Is (sIns X' i B.O) + 1 := rfl
        have h_num_Is_I : num_Is (B.I :: X') = num_Is X' + 1 := rfl
        rw [h_num_Is, num_Is_sIns_zero X' i, h_num_Is_I, num_RIs]
        ac_rfl
}

lemma moment_sIns_one :
  (moment ((sIns X i B.I))) = (moment X) + num_LOs X i + num_Is X + 1 := by {
  revert i
  induction X with
  | nil =>
    intro i
    change moment [B.I] = moment [] + num_LOs [] i + num_Is [] + 1
    rw [moment_one, moment_nil, num_Is]
    cases i <;> rfl
  | cons x X' IHX =>
    intro i
    cases i with
    | zero =>
      change moment (B.I :: x :: X') = moment (x :: X') + num_LOs (x :: X') 0 + num_Is (x :: X') + 1
      rw [moment_cons, moment_cons, num_LOs, List.take_zero, num_Os]
      ac_rfl
    | succ i =>
      change moment (x :: sIns X' i B.I) = moment (x :: X') + num_LOs (x :: X') (i + 1) + num_Is (x :: X') + 1
      rw [moment_cons, moment_cons, IHX i]
      cases x with
      | O =>
        have h_num_Is : num_Is (B.O :: sIns X' i B.I) = num_Is (sIns X' i B.I) := rfl
        have h_num_LOs : num_LOs (B.O :: X') (i + 1) = num_LOs X' i + 1 := rfl
        have h_num_Is_O : num_Is (B.O :: X') = num_Is X' := rfl
        rw [h_num_Is, num_Is_sIns_one X' i, h_num_LOs, h_num_Is_O]
        change moment X' + num_LOs X' i + num_Is X' + 1 + (num_Is X' + 1) = (moment X' + num_Is X') + (num_LOs X' i + 1) + num_Is X' + 1
        ac_rfl
      | I =>
        have h_num_Is : num_Is (B.I :: sIns X' i B.I) = num_Is (sIns X' i B.I) + 1 := rfl
        have h_num_LOs : num_LOs (B.I :: X') (i + 1) = num_LOs X' i := rfl
        have h_num_Is_I : num_Is (B.I :: X') = num_Is X' + 1 := rfl
        rw [h_num_Is, num_Is_sIns_one X' i, h_num_LOs, h_num_Is_I]
        change moment X' + num_LOs X' i + num_Is X' + 1 + (num_Is X' + 1 + 1) = (moment X' + (num_Is X' + 1)) + num_LOs X' i + (num_Is X' + 1) + 1
        ac_rfl
}

lemma moment_sub_sDel_of_sDel_O 
  (H : sIns (sDel X i) i B.O = X) :
  moment X - moment (sDel X i) = num_RIs (sDel X i) i := by {
  have h : moment (sIns (sDel X i) i B.O) = moment (sDel X i) + num_RIs (sDel X i) i := moment_sIns_zero (sDel X i) i
  rw [H] at h
  rw [h]
  exact Nat.add_sub_cancel_left (moment (sDel X i)) (num_RIs (sDel X i) i)
}

lemma moment_sub_sDel_of_sDel_I 
  (H : sIns (sDel X i) i B.I = X) :
  moment X - moment (sDel X i) = num_LOs (sDel X i) i + num_Is (sDel X i) + 1 := by {
  have h : moment (sIns (sDel X i) i B.I) = moment (sDel X i) + num_LOs (sDel X i) i + num_Is (sDel X i) + 1 := moment_sIns_one (sDel X i) i
  have h_assoc : moment (sDel X i) + num_LOs (sDel X i) i + num_Is (sDel X i) + 1 = moment (sDel X i) + (num_LOs (sDel X i) i + num_Is (sDel X i) + 1) := by ac_rfl
  rw [h_assoc] at h
  rw [H] at h
  rw [h]
  exact Nat.add_sub_cancel_left (moment (sDel X i)) (num_LOs (sDel X i) i + num_Is (sDel X i) + 1)
}


lemma sIns_sDel_eq_or (X : List B) (i : Nat) (H : 1 ≤ length X) :
  sIns (sDel X i) i B.O = X ∨ sIns (sDel X i) i B.I = X := by {
  have ⟨b, hb⟩ := sIns_sDel_id X i H
  cases b with
  | O => exact Or.inl hb
  | I => exact Or.inr hb
}

lemma num_RIs_le_num_Is (X : List B) (i : Nat) : num_RIs X i ≤ num_Is X := by {
  rw [num_RIs]
  have h : X = X.take i ++ X.drop i := (List.take_append_drop i X).symm
  conv => rhs; rw [h]
  rw [num_Is_append]
  exact Nat.le_add_left _ _
}

lemma num_LOs_le_num_Os (X : List B) (i : Nat) : num_LOs X i ≤ num_Os X := by {
  rw [num_LOs]
  have h : X = X.take i ++ X.drop i := (List.take_append_drop i X).symm
  conv => rhs; rw [h]
  rw [num_Os_append]
  exact Nat.le_add_right _ _
}

lemma num_Is_le_length (X : List B) : num_Is X ≤ length X := by {
  have h := num_Os_add_num_Is_eq_length X
  rw [← h]
  exact Nat.le_add_left _ _
}

lemma sDel_length_le (X : List B) (i : Nat) : length (sDel X i) ≤ length X := by {
  rw [length_sDel]
  exact Nat.sub_le _ _
}

lemma moment_sub_sDel_le :
  moment X - moment (sDel X i) ≤ length X := by {
  cases X with
  | nil => exact Nat.zero_le _
  | cons x X' =>
    have H1 : 1 ≤ length (x :: X') := Nat.le_add_left 1 _
    have ⟨b, hb⟩ := sIns_sDel_id (x :: X') i H1
    cases b with
    | O =>
      have h2 : moment (x :: X') - moment (sDel (x :: X') i) = num_RIs (sDel (x :: X') i) i := moment_sub_sDel_of_sDel_O (x :: X') i hb
      rw [h2]
      apply Nat.le_trans (num_RIs_le_num_Is _ _)
      apply Nat.le_trans (num_Is_le_length _)
      rw [length_sDel]
      exact Nat.sub_le _ _
    | I =>
      have h2 : moment (x :: X') - moment (sDel (x :: X') i) = num_LOs (sDel (x :: X') i) i + num_Is (sDel (x :: X') i) + 1 := moment_sub_sDel_of_sDel_I (x :: X') i hb
      rw [h2]
      change _ ≤ length X' + 1
      apply Nat.succ_le_succ
      apply Nat.le_trans
      · apply Nat.add_le_add_right
        exact num_LOs_le_num_Os _ _
      · have h3 := num_Os_add_num_Is_eq_length (sDel (x :: X') i)
        rw [h3]
        rw [length_sDel]
        exact Nat.le_refl _
}

lemma sIns_fig_of_pos_of_moment
    (H1 : 1 ≤ length X)
    (H2 : (moment X) - (moment ((sDel X i))) ≤ num_Is ((sDel X i))) :
    sIns ((sDel X i)) i B.O = X := by {
  have H : sIns (sDel X i) i B.O = X ∨ sIns (sDel X i) i B.I = X := sIns_sDel_eq_or X i H1
  cases H with
  | inl Hl => exact Hl
  | inr Hr =>
    have h2 : moment X - moment (sDel X i) = num_LOs (sDel X i) i + num_Is (sDel X i) + 1 := moment_sub_sDel_of_sDel_I X i Hr
    rw [h2] at H2
    have h3 : num_Is (sDel X i) < num_LOs (sDel X i) i + num_Is (sDel X i) + 1 := by {
      have h4 : num_Is (sDel X i) < num_Is (sDel X i) + 1 := Nat.lt_succ_self _
      have h5 : num_Is (sDel X i) + 1 ≤ num_LOs (sDel X i) i + (num_Is (sDel X i) + 1) := Nat.le_add_left _ _
      have h_comm : num_LOs (sDel X i) i + num_Is (sDel X i) + 1 = num_LOs (sDel X i) i + (num_Is (sDel X i) + 1) := by ac_rfl
      rw [← h_comm] at h5
      exact Nat.lt_of_lt_of_le h4 h5
    }
    have h_contra := Nat.not_le_of_gt h3
    contradiction
}

lemma sIns_fig_of_neg_of_moment
    (H1 : 1 ≤ length X)
    (H2 : ¬ (moment X) - (moment ((sDel X i))) ≤ num_Is ((sDel X i))) :
    sIns ((sDel X i)) i B.I = X:= by {
  have H : sIns (sDel X i) i B.O = X ∨ sIns (sDel X i) i B.I = X := sIns_sDel_eq_or X i H1
  cases H with
  | inr Hr => exact Hr
  | inl Hl =>
    have h2 : moment X - moment (sDel X i) = num_RIs (sDel X i) i := moment_sub_sDel_of_sDel_O X i Hl
    rw [h2] at H2
    have h3 : num_RIs (sDel X i) i ≤ num_Is (sDel X i) := num_RIs_le_num_Is _ _
    contradiction
}

end List

namespace List.Vector
variable {n : Nat} (X : List.Vector B n) (c : List.Vector B n)

variable {n : Nat} (X : List.Vector B n)

def moment (X : List.Vector B n) : Nat := List.moment X.toList

def num_RIs {n : Nat} (X : List.Vector B n) (i : Nat) : Nat := List.num_RIs X.toList i
def num_LOs {n : Nat} (X : List.Vector B n) (i : Nat) : Nat := List.num_LOs X.toList i
lemma moment_nil : moment (⟨[], rfl⟩ : List.Vector B 0) = 0 := rfl


lemma moment_sDel_le :
  moment (sDel X i) ≤ moment X := by {
  exact List.moment_sDel_le X.toList i
}

lemma moment_le_sIns {b : B} :
  (moment X) ≤ (moment ((sIns X i b))) := by {
  exact List.moment_le_sIns X.toList i
}

lemma moment_sIns_zero :
  (moment ((sIns X i B.O))) = (moment X) + num_RIs X i := by {
  exact List.moment_sIns_zero X.toList i
}

lemma moment_sIns_one :
  (moment ((sIns X i B.I))) = (moment X) + num_LOs X i + wt X + 1 := by {
  exact List.moment_sIns_one X.toList i
}

lemma moment_sub_sDel_of_sDel_O 
  (X : List.Vector B (n + 1))
  (H : sIns ((sDel X i)) i B.O = X) :
  (moment X) - (moment ((sDel X i))) = num_RIs ((sDel X i)) i := by {
  sorry
}

lemma moment_sub_sDel_of_sDel_I 
  (X : List.Vector B (n + 1))
  (H : sIns ((sDel X i)) i B.I = X) :
  (moment X) - (moment ((sDel X i))) = num_LOs ((sDel X i)) i + wt ((sDel X i)) + 1 := by {
  sorry
}


lemma moment_sub_sDel_le :
  (moment X) - (moment ((sDel X i))) ≤ n := by {
  sorry
}

lemma sIns_fig_of_pos_of_moment
    (X : List.Vector B (n + 1))
    (H : (moment X) - (moment ((sDel X i))) ≤ wt ((sDel X i))) :
    sIns ((sDel X i)) i B.O = X := by {
  sorry
}

lemma sIns_fig_of_neg_of_moment
    (X : List.Vector B (n + 1))
    (H : ¬ (moment X) - (moment ((sDel X i))) ≤ wt ((sDel X i))) :
    sIns ((sDel X i)) i B.I = X := by {
  sorry
}

end List.Vector

def VTCode (n a : Nat) : Set (List.Vector B n) :=
  { X | List.Vector.moment X % (n + 1) = a % (n + 1) }

lemma mem_VTCode {n a : Nat} {X : List.Vector B n} :
  X ∈ VTCode n a ↔ List.Vector.moment X % (n + 1) = a % (n + 1) := Iff.rfl

instance decidable_pred_VTCode (n a : Nat) : DecidablePred (VTCode n a) :=
  fun X => inferInstanceAs (Decidable (List.Vector.moment X % (n + 1) = a % (n + 1)))


namespace List 
def sub_mod (m a : Nat) (X : List B) : Nat := sorry

lemma sub_mod_zero (m : Nat) (X : List B) :
    sub_mod m 0 X = (m - (moment X) % m) % m := by {
  sorry
}

lemma sub_mod_mod_self (m : Nat) (X : List B) :
  sub_mod m m X = sub_mod m 0 X := by {
  sorry
}

lemma sub_mod_nil (m : Nat) :
    sub_mod m a [] = a % m := by {
  sorry
}

lemma sub_mod_add (m : Nat) (X : List B) :
  sub_mod m (a + m) X = sub_mod m a X := by {
  sorry
}

lemma sub_mod_sub (m : Nat) (X : List B) (H : m  ≤ a) :
  sub_mod m (a - m) X = sub_mod m a X := by {
  sorry
}

lemma sub_mod_mod (m : Nat) (X : List B) :
  sub_mod m (a % m) X = sub_mod m a X := by {
  sorry
}

lemma sub_mod_sDel
  {n a : Nat} {X : List B} (HX : length X = n) 
  (H : (moment X) % (n + 1) = a % (n + 1)) (i : Nat) : 
  sub_mod (n + 1) a ((sDel X i)) = (moment X) - (moment ((sDel X i))) := by {
  sorry
}

lemma sub_mod_sDel_of_pos
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : sub_mod (n + 1) a ((sDel X i)) ≤ num_Is ((sDel X i))) :
    sub_mod (n + 1) a ((sDel X i)) = num_RIs ((sDel X i)) i := by {
  sorry
}

lemma sub_mod_sDel_of_neg
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : ¬ sub_mod (n + 1) a ((sDel X i)) ≤ num_Is ((sDel X i))) :
    sub_mod (n + 1) a ((sDel X i)) = num_LOs ((sDel X i)) i + num_Is ((sDel X i)) + 1 := by {
  sorry
}

lemma sIns_fig_of_pos
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : sub_mod (n + 1) a ((sDel X i)) ≤ num_Is ((sDel X i)))   :
  sIns ((sDel X i)) i B.O = X := by {
  sorry
}

lemma sIns_fig_of_neg
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : ¬ sub_mod (n + 1) a ((sDel X i)) ≤ num_Is ((sDel X i)))   :
  sIns ((sDel X i)) i B.I = X := by {
  sorry
}

def min_num_LOs : List B → Nat → Nat 
| [], _ => 0
| x::X, 0 => 0
| B.O::X, n + 1 => min_num_LOs X n + 1
| B.I::X, n + 1 => min_num_LOs X (n + 1) + 1

lemma min_num_LOs_zero (X : List B) :
  min_num_LOs X 0 = 0 := sorry

lemma min_num_LOs_of_num_Os (X : List B) (i : Nat) 
  (H : num_Os X + 1 ≤ i) :
  min_num_LOs X i = length X := by {
  sorry
}

lemma num_LOs_min_num_LOs (X : List B) (i : Nat)  
  (H : i ≤ num_Os X) :
  num_LOs X (min_num_LOs X i) = i := by {
  sorry
}

def max_num_RIs : List B → Nat → Nat := sorry

lemma max_num_RIs_zero (X : List B) :
  max_num_RIs X 0 = length X := by {
  sorry
}

lemma max_num_RIs_of_num_Is (X : List B) (i : Nat) 
  (H : num_Is X + 1 ≤ i) :
  max_num_RIs X i = 0 := by {
  sorry
}

lemma num_RIs_max_num_RIs (X : List B) (i : Nat) 
  (H : i ≤ num_Is X) :
  num_RIs X (max_num_RIs X i) = i := by {
  sorry
}

def decoding_alg (n a : Nat) (X : List B) : List B := sorry

lemma length_decoding_alg 
  (n a : Nat) (X : List B) (H : length X = n - 1) :
  length (decoding_alg n a X) = n := by {
  sorry
}

lemma sDelErr_correctable_of_pos
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (Hr : sub_mod (n + 1) a ((sDel X i)) ≤ num_Is ((sDel X i))) :
    decoding_alg n a ((sDel X i)) = X := by {
  sorry
}

lemma sDelErr_correctable_of_neg
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (Hr : ¬ sub_mod (n + 1) a ((sDel X i)) ≤ num_Is ((sDel X i))) :
    decoding_alg n a ((sDel X i)) = X := by {
  sorry
}

lemma sDelErr_correctable
  {n a : Nat} {X : List B} 
  (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) (i : Nat) :
  decoding_alg n a ((sDel X i)) = X := by {
  sorry
}

end List 
namespace List.Vector
variable {n : Nat} (X : List.Vector B n) (c : List.Vector B n)

def sub_mod (m a : Nat) (X : List.Vector B n) : Nat := sorry

lemma sub_mod_zero (m : Nat) :
    sub_mod m 0 X = (m - (moment X) % m) % m := by {
  sorry
}

lemma sub_mod_mod_self (m : Nat) :
  sub_mod m m X = sub_mod m 0 X := by {
  sorry
}

lemma sub_mod_nil (m : Nat) :
    sub_mod m a List.Vector.nil = a % m := by {
  sorry
}

lemma sub_mod_add (m : Nat) :
  sub_mod m (a + m) X = sub_mod m a X := by {
  sorry
}

lemma sub_mod_sub (m : Nat) (H : m ≤ a) :
  sub_mod m (a - m) X = sub_mod m a X := by {
  sorry
}

lemma sub_mod_mod (m : Nat) :
  sub_mod m (a % m) X = sub_mod m a X := by {
  sorry
}

lemma sub_mod_sDel
  {n a : Nat} {X : List.Vector B n} (H : X ∈ VTCode n a) (i : Nat) : 
  sub_mod (n + 1) a ((sDel X i)) = (moment X) - (moment ((sDel X i))) := by {
  sorry
}

lemma sub_mod_sDel_of_pos
  {n a : Nat} {X : List.Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
  (i : Nat) (H : sub_mod (n + 2) a ((sDel X i)) ≤ wt ((sDel X i))) : 
  sub_mod (n + 2) a ((sDel X i)) = num_RIs ((sDel X i)) i := by {
  sorry
}

lemma sub_mod_sDel_of_neg
  {n a : Nat} {X : List.Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
  (i : Nat) (H : ¬ sub_mod (n + 2) a ((sDel X i)) ≤ wt ((sDel X i))) : 
  sub_mod (n + 2) a ((sDel X i)) = num_LOs ((sDel X i)) i + wt ((sDel X i)) + 1 := by {
  sorry
}

lemma sIns_fig_of_pos
  {n a : Nat} {c : List.Vector B (n + 1)} (Hc : c ∈ VTCode (n + 1) a) 
  (i : Nat) (H : sub_mod (n + 2) a ((sDel c i)) ≤ wt ((sDel c i)))  :
  sIns ((sDel c i)) i B.O = c := by {
  sorry
}

lemma sIns_fig_of_neg
  {n a : Nat} {c : List.Vector B (n + 1)} (Hc : c ∈ VTCode (n + 1) a) 
  (i : Nat) (H : ¬ sub_mod (n + 2) a ((sDel c i)) ≤ wt ((sDel c i)))  :
  sIns ((sDel c i)) i B.I = c := by {
  sorry
}

def min_num_LOs {n : Nat} (X : List.Vector B n) (i : Nat) : Nat := sorry

lemma min_num_LOs_zero :
  min_num_LOs X 0 = 0 := by {
  sorry
}

lemma num_LOs_min_num_LOs (i : Nat) (H : i ≤ n - wt X) :
  num_LOs X (min_num_LOs X i) = i := by {
  sorry
}

def max_num_RIs {n : Nat} (X : List.Vector B n) (i : Nat) : Nat := sorry

lemma max_num_RIs_zero :
  max_num_RIs X 0 = n := by {
  sorry
}

lemma max_num_RIs_of_num_Is (i : Nat) (H : wt X + 1 ≤ i) :
  max_num_RIs X i = 0 := by {
  sorry
}

lemma num_RIs_max_num_RIs (i : Nat) (H : i ≤ wt X) :
  num_RIs X (max_num_RIs X i) = i := by {
  sorry
}

def decoding_alg (n a : Nat) (X : List.Vector B (n - 1)) : List.Vector B n := sorry

lemma decoding_alg_to_list (n a : Nat) (X : List.Vector B (n - 1)) : 
  (decoding_alg n a X).toList = _root_.List.decoding_alg n a X.toList := by {
  sorry
}

lemma sDelErr_correctable_of_nil
    {a : Nat} {X : List.Vector B 0} (H : X ∈ VTCode 0 a) (i : Nat) :
    decoding_alg 0 a ((sDel X i)) = X := by {
  sorry
}

lemma sDelErr_correctable_of_pos
    {n a : Nat} {X : List.Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
    (i : Nat) (Hr : sub_mod (n + 2) a ((sDel X i)) ≤ wt ((sDel X i))) :
    decoding_alg (n + 1) a ((sDel X i)) = X := by {
  sorry
}

lemma sDelErr_correctable_of_neg
    {n a : Nat} {X : List.Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
    (i : Nat) (Hr : ¬ sub_mod (n + 2) a ((sDel X i)) ≤ wt ((sDel X i))) :
    decoding_alg (n + 1) a ((sDel X i)) = X := by {
  sorry
}

theorem sDelErr_correctable
  {n a : Nat} {c : List.Vector B n} 
  (Hc : c ∈ VTCode n a) (i : Nat) :
  decoding_alg n a ((sDel c i)) = c := by {
  sorry
}

end List.Vector
namespace Finset
def VTCode (n a : Nat) : Finset (List.Vector B n) := sorry

lemma mem_VTCode (n a : Nat) (x : List.Vector B n) :
  x ∈ Finset.VTCode n a ↔ x ∈ VTCode n a := by {
  sorry
}

theorem DelCode_VTCode (n a : Nat) :
  is_DelCode (VTCode n a) := by {
  sorry
}

end Finset
