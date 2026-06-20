/- Copyright Manabu Hagiwara 2022, 2026 -/
import Mathlib.Data.List.Basic
import Mathlib.Data.Vector.Basic
import Mathlib.Data.Finset.Basic

namespace Nat

lemma ne_of_lt_ {a b : Nat} (H : a < b) : a ≠ b :=
  fun h => Nat.lt_irrefl b (by rw [h] at H; exact H)

lemma ne_of_gt_ {a b : Nat} (H : b < a) : a ≠ b :=
  fun h => Nat.lt_irrefl a (by rw [←h] at H; exact H)

lemma sub_sub_eq_add_sub {b c : Nat} (H : c ≤ b) (a : Nat) :
  a - (b - c) = a + c - b := by
  revert a c
  induction b with
  | zero =>
    intro c H a
    have hc : c = 0 := Nat.eq_zero_of_le_zero H
    rw [hc]
    rfl
  | succ b ihb =>
    intro c H a
    cases c
    case zero =>
      rw [Nat.sub_zero, Nat.add_zero]
      rfl
    case succ c =>
      have h1 : b + 1 - (c + 1) = b - c := Nat.succ_sub_succ b c
      rw [h1]
      have h2 : a + (c + 1) - (b + 1) = a + c + 1 - (b + 1) := by rw [Nat.add_assoc]
      rw [h2]
      have h3 : a + c + 1 - (b + 1) = a + c - b := Nat.succ_sub_succ (a + c) b
      rw [h3]
      apply ihb (Nat.le_of_succ_le_succ H)

lemma add_eq_self_iff {n m : Nat} :
  n + m = n ↔ m = 0 := by
  cases m
  case zero =>
    apply Iff.intro
    · intro; rfl
    · intro; rw [Nat.add_zero]
  case succ m =>
    apply Iff.intro
    · intro h
      have h1 : 0 < Nat.succ m := Nat.zero_lt_succ m
      have h2 : n < n + Nat.succ m := Nat.lt_add_of_pos_right h1
      exact False.elim <| ne_of_lt_ h2 h.symm
    · intro h
      have h1 : 0 < Nat.succ m := Nat.zero_lt_succ m
      exact False.elim <| ne_of_gt_ h1 h

lemma add_left_eq_add_iff {a b c : Nat} :
  a + b = a + c ↔ b = c := by
  apply Iff.intro
  · revert b c
    induction a with
    | zero =>
      intro b c h
      rw [Nat.zero_add, Nat.zero_add] at h
      exact h
    | succ a iha =>
      intro b c h
      rw [Nat.succ_add, Nat.succ_add] at h
      apply iha (Nat.succ.inj h)
  · intro h; rw [h]

lemma add_right_eq_add_iff {a b c : Nat} :
  b + a = c + a ↔ b = c := by
  apply Iff.intro
  · revert b c
    induction a with
    | zero =>
      intro b c h
      rw [Nat.add_zero, Nat.add_zero] at h
      exact h
    | succ a iha =>
      intro b c h
      rw [Nat.add_succ, Nat.add_succ] at h
      apply iha (Nat.succ.inj h)
  · intro h; rw [h]

lemma sub_eq_self_iff {n m : Nat} :
  n - m = n ↔ n = 0 ∨ m = 0 := by
  cases n
  case zero =>
    apply Iff.intro
    · intro; exact Or.inl rfl
    · intro; rw [Nat.zero_sub]
  case succ n =>
    cases m
    case zero =>
      apply Iff.intro
      · intro; exact Or.inr rfl
      · intro; rw [Nat.sub_zero]
    case succ m =>
      apply Iff.intro
      · intro h
        apply False.elim
        apply Nat.not_le_of_lt (Nat.lt_succ_self n)
        have h_le : Nat.succ n ≤ Nat.succ n - Nat.succ m := by rw [h]
        have h_le_2 : Nat.succ n - Nat.succ m ≤ n := by 
          rw [Nat.succ_sub_succ]
          apply Nat.sub_le
        exact Nat.le_trans h_le h_le_2
      · intro h
        cases h
        case inl h_inl => contradiction
        case inr h_inr => contradiction

lemma zero_of_sub_eq_of_le {n m k : Nat}
  (Hn : 0 < n) (Hnm : n ≤ m) (Hnkm : n - k = m) :
  k = 0 := by
  cases k
  case zero => rfl
  case succ k =>
    cases n
    case zero =>
      apply False.elim
      apply Nat.not_lt_of_le (Nat.le_refl 0) Hn
    case succ n =>
      apply False.elim
      apply Nat.not_le_of_lt (Nat.lt_succ_self n)
      have hm_le_n : m ≤ n := by
        rw [← Hnkm]
        rw [Nat.succ_sub_succ]
        apply Nat.sub_le
      exact Nat.le_trans Hnm hm_le_n

lemma eq_of_sub_eq_le {n m k : Nat} (Hnm : n ≤ m) (Hnkm : n - k = m) :
  n = m := by
  cases k
  case zero =>
    rw [Nat.sub_zero] at Hnkm
    exact Hnkm
  case succ k =>
    cases n
    case zero =>
      rw [Nat.zero_sub] at Hnkm
      exact Hnkm
    case succ n =>
      apply False.elim
      apply Nat.not_le_of_lt (Nat.lt_succ_self n)
      have hm_le_n : m ≤ n := by
        rw [← Hnkm]
        rw [Nat.succ_sub_succ]
        apply Nat.sub_le
      exact Nat.le_trans Hnm hm_le_n

lemma le_and_sub_eq_iff {n m k : Nat} (Hn : 0 < n) :
  n ≤ m ∧ n - k = m ↔ k = 0 ∧ n = m := by
  apply Iff.intro
  · intro h
    apply And.intro
    · cases k
      case zero => rfl
      case succ k =>
        apply False.elim
        have hn_le : n ≤ n - Nat.succ k := by
          rw [h.right]
          exact h.left
        cases n
        case zero => contradiction
        case succ n_val =>
          have hn_val : Nat.succ n_val ≤ n_val - k := by
            rw [Nat.succ_sub_succ] at hn_le
            exact hn_le
          have h_sub_le : n_val - k ≤ n_val := Nat.sub_le _ _
          have h_le_nval : Nat.succ n_val ≤ n_val := Nat.le_trans hn_val h_sub_le
          exact Nat.not_le_of_lt (Nat.lt_succ_self n_val) h_le_nval
    · exact eq_of_sub_eq_le h.left h.right
  · intro h
    apply And.intro
    · exact le_of_eq h.right
    · rw [h.left, Nat.sub_zero]; exact h.right

lemma add_right_div_le_of_le (a b₁ b₂ c : Nat) (H : b₁ ≤ b₂) :
  (a + b₁) / c ≤ (a + b₂) / c := by
  apply Nat.div_le_div_right
  apply Nat.add_le_add_left H

end Nat