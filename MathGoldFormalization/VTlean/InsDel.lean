/- Copyright Manabu Hagiwara 2022, 2026 -/
import Mathlib.Data.Vector.Basic
import Mathlib.Data.Finset.Basic
import Mathlib.Data.Fintype.Basic
import VTlean.Lemma
import VTlean.B
import Mathlib.Data.Fintype.EquivFin

open scoped Classical

variable {α : Type} [DecidableEq α]

namespace List

variable (x y : α) (X Y : List α) (i j : Nat) (a b : α)

def sDel : List α → Nat → List α
  | [], _ => []
  | [_], _ => []
  | _::x'::X', 0 => x'::X'
  | x::x'::X', i + 1 => x :: sDel (x'::X') i

lemma sDel_nil :
  sDel ([] : List α) i = [] :=
by { rfl }

lemma sDel_singleton : sDel [x] i = [] :=
by { rfl }

lemma sDel_zero : sDel (x::X) 0 = X :=
by {
  cases X with
  | nil => rfl
  | cons x' X' => rfl
}

lemma sDel_cons (H : X ≠ []) :
   sDel (x::X) (i + 1) = x :: (sDel X i) :=
by {
  cases X with
  | nil => contradiction
  | cons x' X' => rfl
}

lemma length_sDel :
  length (sDel X i) = length X - 1 :=
by {
  revert i
  induction X with
  | nil => intro i; rfl
  | cons x X' IHX =>
    intro i
    cases X' with
    | nil => rfl
    | cons x' X'' =>
      cases i with
      | zero => rfl
      | succ i' =>
        change length (x :: sDel (x' :: X'') i') = length (x :: x' :: X'') - 1
        rw [length, IHX]
        rfl
}

lemma sDel_of_ovrlen (H : length X - 1 ≤ i):
  sDel X i = sDel X (length X - 1) :=
by {
  revert i
  induction X with
  | nil =>
    intro i H
    rw [sDel_nil, sDel_nil]
  | cons x X' IHX =>
    intro i H
    cases X' with
    | nil =>
      rw [sDel_singleton, sDel_singleton]
    | cons x' X'' =>
      cases i with
      | zero => contradiction
      | succ i' =>
        change x :: sDel (x' :: X'') i' = sDel (x :: x' :: X'') (length (x :: x' :: X'') - 1)
        have h_len : length (x :: x' :: X'') - 1 = length (x' :: X'') - 1 + 1 := rfl
        rw [h_len]
        change x :: sDel (x' :: X'') i' = x :: sDel (x' :: X'') (length (x' :: X'') - 1)
        rw [IHX i' (Nat.le_of_succ_le_succ H)]
}

lemma exists_sDel_le :
  ∃ j : Nat, j ≤ length X - 1 ∧ sDel X i = sDel X j :=
by {
  cases Classical.em (i ≤ length X - 1) with
  | inl hle =>
    exact ⟨i, hle, rfl⟩
  | inr hnle =>
    have hnle' := Nat.lt_of_not_le hnle
    exact Exists.intro (length X - 1) (And.intro (Nat.le_refl _) (sDel_of_ovrlen X i (Nat.le_of_lt hnle')))
}

lemma sDel_append_of_lt (H : i + 1 ≤ length X) :
  sDel (X ++ Y) i = sDel X i ++ Y :=
by {
  revert i
  induction X with
  | nil =>
    intro i H
    change i + 1 ≤ 0 at H
    contradiction
  | cons x X' IHX =>
    intro i H
    cases X' with
    | nil =>
      change i + 1 ≤ 1 at H
      have hi : i = 0 := Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ H)
      rw [hi]
      change sDel (x :: Y) 0 = sDel (x :: []) 0 ++ Y
      rw [sDel_zero, sDel_zero, List.nil_append]
    | cons x' X'' =>
      cases i with
      | zero =>
        change x' :: (X'' ++ Y) = (x' :: X'') ++ Y
        exact rfl
      | succ i' =>
        change x :: sDel (x' :: X'' ++ Y) i' = (x :: sDel (x' :: X'') i') ++ Y
        change x :: sDel (x' :: X'' ++ Y) i' = x :: (sDel (x' :: X'') i' ++ Y)
        congr 1
        have h_eq : x' :: X'' ++ Y = (x' :: X'') ++ Y := rfl
        rw [h_eq]
        apply IHX i' (Nat.lt_of_succ_lt_succ H)
}

lemma sDel_append_of_ge (H : length X ≤ i) (HY : Y ≠ []):
  sDel (X ++ Y) i = X ++ sDel Y (i - length X) :=
by {
  revert i
  induction X with
  | nil =>
    intro i H
    change sDel Y i = sDel Y (i - 0)
    rw [Nat.sub_zero]
  | cons x X' IHX =>
    intro i H
    cases X' with
    | nil =>
      cases i with
      | zero =>
        change 1 ≤ 0 at H
        contradiction
      | succ i' =>
        cases Y with
        | nil => contradiction
        | cons y Y' =>
          change sDel (x :: y :: Y') (i' + 1) = [x] ++ sDel (y :: Y') (i' + 1 - 1)
          have h1 : sDel (x :: y :: Y') (i' + 1) = x :: sDel (y :: Y') i' := rfl
          rw [h1]
          have h2 : i' + 1 - 1 = i' := rfl
          rw [h2]
          have h3 : [x] ++ sDel (y :: Y') i' = x :: sDel (y :: Y') i' := rfl
          rw [h3]
    | cons x' X'' =>
      cases i with
      | zero =>
        change length (x :: x' :: X'') ≤ 0 at H
        contradiction
      | succ i' =>
        cases Y with
        | nil => contradiction
        | cons y Y' =>
          change sDel (x :: x' :: X'' ++ y :: Y') (i' + 1) = (x :: x' :: X'') ++ sDel (y :: Y') (i' + 1 - length (x :: x' :: X''))
          have h1 : sDel (x :: x' :: X'' ++ y :: Y') (i' + 1) = x :: sDel ((x' :: X'') ++ y :: Y') i' := rfl
          rw [h1]
          have h2 : (x :: x' :: X'') ++ sDel (y :: Y') (i' + 1 - length (x :: x' :: X'')) = x :: ((x' :: X'') ++ sDel (y :: Y') (i' + 1 - length (x :: x' :: X''))) := rfl
          rw [h2]
          congr 1
          have h_len : i' + 1 - length (x :: x' :: X'') = i' - length (x' :: X'') := Nat.succ_sub_succ _ _
          rw [h_len]
          apply IHX i' (Nat.le_of_succ_le_succ H)
}

lemma sDel_replicate (k : Nat) :
  sDel (replicate k a) i = replicate (k - 1) a :=
by {
  revert i
  induction k with
  | zero =>
    intro i
    rfl
  | succ n IHn =>
    intro i
    change sDel (a :: replicate n a) i = replicate ((n + 1) - 1) a
    have h_sub : (n + 1) - 1 = n := rfl
    rw [h_sub]
    cases i with
    | zero =>
      cases n with
      | zero => rfl
      | succ n' => rfl
    | succ i' =>
      cases n with
      | zero => rfl
      | succ n' =>
        change a :: sDel (a :: replicate n' a) i' = a :: replicate n' a
        congr 1
        have h_ih := IHn i'
        change sDel (a :: replicate n' a) i' = replicate n' a at h_ih
        exact h_ih
}

lemma exists_sDel_sDel
  (X : List α) (i j : Nat) :
  ∃ i' j' : Nat, sDel (sDel X i) j' = sDel (sDel X j) i' :=
by {
  revert i j
  induction X with
  | nil =>
    intro i j
    exact ⟨0, 0, rfl⟩
  | cons x X' ihX =>
    intro i j
    cases X' with
    | nil => exact ⟨0, 0, rfl⟩
    | cons x' X'' =>
      cases X'' with
      | nil =>
        exact ⟨0, 0, by {
          have h1 : sDel (sDel (x :: x' :: []) i) 0 = [] := by {
            apply List.eq_nil_of_length_eq_zero
            rw [length_sDel, length_sDel]
            rfl
          }
          have h2 : sDel (sDel (x :: x' :: []) j) 0 = [] := by {
            apply List.eq_nil_of_length_eq_zero
            rw [length_sDel, length_sDel]
            rfl
          }
          rw [h1, h2]
        }⟩
      | cons x'' X''' =>
        cases i with
        | zero =>
          cases j with
          | zero => exact ⟨0, 0, rfl⟩
          | succ j' =>
            exact ⟨0, j', by {
              have h1 : sDel (sDel (x :: x' :: x'' :: X''') 0) j' = sDel (x' :: x'' :: X''') j' := rfl
              have h2 : sDel (sDel (x :: x' :: x'' :: X''') (j' + 1)) 0 = sDel (x :: sDel (x' :: x'' :: X''') j') 0 := rfl
              rw [h1, h2]
              rw [sDel_zero]
            }⟩
        | succ i' =>
          cases j with
          | zero =>
            exact ⟨i', 0, by {
              have h1 : sDel (sDel (x :: x' :: x'' :: X''') (i' + 1)) 0 = sDel (x :: sDel (x' :: x'' :: X''') i') 0 := rfl
              have h2 : sDel (sDel (x :: x' :: x'' :: X''') 0) i' = sDel (x' :: x'' :: X''') i' := rfl
              rw [h1, h2]
              rw [sDel_zero]
            }⟩
          | succ j' =>
            cases (ihX i' j') with
            | intro i'' hi'' =>
              cases hi'' with
              | intro j'' hij'' =>
                exact ⟨i'' + 1, j'' + 1, by {
                  have hL : sDel (x' :: x'' :: X''') i' ≠ [] := by {
                    intro h
                    have h_len : length (sDel (x' :: x'' :: X''') i') = 0 := by { rw [h]; rfl }
                    rw [length_sDel] at h_len
                    have h_len2 : length (x' :: x'' :: X''') - 1 = length X''' + 1 := rfl
                    rw [h_len2] at h_len
                    contradiction
                  }
                  have hR : sDel (x' :: x'' :: X''') j' ≠ [] := by {
                    intro h
                    have h_len : length (sDel (x' :: x'' :: X''') j') = 0 := by { rw [h]; rfl }
                    rw [length_sDel] at h_len
                    have h_len2 : length (x' :: x'' :: X''') - 1 = length X''' + 1 := rfl
                    rw [h_len2] at h_len
                    contradiction
                  }
                  have h1 : sDel (sDel (x :: x' :: x'' :: X''') (i' + 1)) (j'' + 1) = sDel (x :: sDel (x' :: x'' :: X''') i') (j'' + 1) := rfl
                  have h2 : sDel (x :: sDel (x' :: x'' :: X''') i') (j'' + 1) = x :: sDel (sDel (x' :: x'' :: X''') i') j'' := sDel_cons x (sDel (x' :: x'' :: X''') i') j'' hL
                  have h3 : sDel (sDel (x :: x' :: x'' :: X''') (j' + 1)) (i'' + 1) = sDel (x :: sDel (x' :: x'' :: X''') j') (i'' + 1) := rfl
                  have h4 : sDel (x :: sDel (x' :: x'' :: X''') j') (i'' + 1) = x :: sDel (sDel (x' :: x'' :: X''') j') i'' := sDel_cons x (sDel (x' :: x'' :: X''') j') i'' hR
                  rw [h1, h2, h3, h4]
                  rw [hij'']
                }⟩
}

def sIns : List α → Nat → α → List α
  | [], _, b => [b]
  | x :: X, 0, b => b :: x :: X
  | x :: X, i + 1, b => x :: sIns X i b

lemma sIns_nil :
  sIns ([] : List α) i b = [b] :=
by { cases i with | zero => rfl | succ _ => rfl }

lemma sIns_zero : sIns X 0 b = b :: X :=
by {
  cases X with
  | nil => rfl
  | cons x X => rfl
}

lemma sIns_cons :
 sIns (x :: X) (i + 1) b = x :: sIns X i b :=
by { rfl }

lemma length_sIns :
  length (sIns X i b) = length X + 1 :=
by {
  revert i
  induction X with
  | nil =>
    intro i
    cases i with | zero => rfl | succ _ => rfl
  | cons x X' IHX =>
    intro i
    cases i with
    | zero => rfl
    | succ i' =>
      change length (x :: sIns X' i' b) = length (x :: X') + 1
      rw [length, IHX i']
      rfl
}

lemma sIns_ne_nil :
  sIns X i b ≠ [] :=
by {
  intro h
  have hl : length (sIns X i b) = 0 := by { rw [h]; rfl }
  rw [length_sIns] at hl
  contradiction
}

lemma sIns_of_ovrlen (H : length X ≤ i):
  sIns X i b = X ++ [b] :=
by {
  revert i
  induction X with
  | nil =>
    intros i H
    cases i with | zero => rfl | succ _ => rfl
  | cons x X' IHX =>
    intros i H
    cases i with
    | zero =>
      change length (x :: X') ≤ 0 at H
      contradiction
    | succ i' =>
      change x :: sIns X' i' b = x :: (X' ++ [b])
      congr 1
      apply IHX _ (Nat.le_of_succ_le_succ H)
}

lemma exists_sIns_le :
  ∃ j : Nat, j ≤ length X ∧ sIns X i b = sIns X j b :=
by {
  cases Classical.em (i ≤ length X) with
  | inl hlt => exact ⟨i, hlt, rfl⟩
  | inr hnlt =>
    have hnlt' := Nat.lt_of_not_le hnlt
    exact ⟨length X, Nat.le_refl _, by {
      rw [sIns_of_ovrlen _ _ _ (Nat.le_refl _)]
      rw [sIns_of_ovrlen _ _ _ (Nat.le_of_lt hnlt')]
    }⟩
}

lemma exists_sIns_sIns_eq :
  ∃ i' j' : Nat, sIns (sIns X i a) j' b = sIns (sIns X j b) i' a :=
by {
  revert i j
  induction X with
  | nil =>
    intro i j
    exact ⟨0, 1, rfl⟩
  | cons x X' ihX =>
    intro i j
    cases i with
    | zero =>
      cases j with
      | zero => exact ⟨0, 1, rfl⟩
      | succ j' => exact ⟨0, j' + 2, rfl⟩
    | succ i' =>
      cases j with
      | zero => exact ⟨i' + 2, 0, rfl⟩
      | succ j' =>
        cases (ihX i' j') with
        | intro i'' hi'' =>
          cases hi'' with
          | intro j'' hij'' =>
            exact ⟨i'' + 1, j'' + 1, by {
              change x :: sIns (sIns X' i' a) j'' b = x :: sIns (sIns X' j' b) i'' a
              rw [hij'']
            }⟩
}

lemma sIns_sDel_id (H : 1 ≤ length X)  :
  ∃ (b : α), sIns (sDel X i) i b = X :=
by {
  revert i
  induction X with
  | nil =>
    intro i
    change 1 ≤ 0 at H
    contradiction
  | cons x X' IHX =>
    intro i
    cases X' with
    | nil =>
      exact ⟨x, by {
        have h_sdel : sDel [x] i = [] := sDel_singleton x i
        rw [h_sdel]
        change sIns [] i x = [x]
        cases i with | zero => rfl | succ _ => rfl
      }⟩
    | cons x' X'' =>
      cases i with
      | zero =>
        exact ⟨x, rfl⟩
      | succ i' =>
        have hl : 1 ≤ length (x' :: X'') := Nat.le_add_left 1 _
        cases IHX hl i' with
        | intro a ha =>
          exact ⟨a, by {
            change sIns (x :: sDel (x' :: X'') i') (i' + 1) a = x :: x' :: X''
            change x :: sIns (sDel (x' :: X'') i') i' a = x :: x' :: X''
            congr 1
          }⟩
}

lemma sDel_sIns_id (b : α) :
  sDel (sIns X i b) i = X :=
by {
  revert i
  induction X with
  | nil =>
    intro i
    cases i with | zero => rfl | succ _ => rfl
  | cons x X' IHX =>
    intro i
    cases i with
    | zero => rfl
    | succ i' =>
      change sDel (x :: sIns X' i' b) (i' + 1) = x :: X'
      have h : sDel (x :: sIns X' i' b) (i' + 1) = x :: sDel (sIns X' i' b) i' := sDel_cons x (sIns X' i' b) i' (sIns_ne_nil X' i' b)
      rw [h]
      rw [IHX i']
}

lemma sIns_of_sDel (HX : 1 ≤ length X) (HXY : Y = sDel X i) :
  ∃ b : α, X = sIns Y i b :=
by {
  cases sIns_sDel_id X i HX with
  | intro a ha =>
    exact ⟨a, by { rw [HXY]; exact ha.symm }⟩
}

lemma sDel_of_sIns (HXY : Y = sIns X i b) :
  X = sDel Y i :=
by {
  rw [HXY]
  exact (sDel_sIns_id X i b).symm
}

lemma exists_sIns_eq_of_sDel [Inhabited α]
  (HXY : length X = length Y) (Hij : sDel X i = sDel Y j) :
  ∃ i' j' : Nat, ∃ a b : α, sIns X i' a = sIns Y j' b :=
by {
  cases Classical.em (1 ≤ length X) with
  | inl hle =>
    have hleY : 1 ≤ length Y := by { rw [← HXY]; exact hle }
    cases sIns_sDel_id X i hle with
    | intro c hc =>
      cases sIns_sDel_id Y j hleY with
      | intro d hd =>
        cases exists_sIns_sIns_eq (sDel X i) i j c d with
        | intro i' hi' =>
          cases hi' with
          | intro j' hij' =>
            exact ⟨j', i', d, c, by {
              have h1 : sIns (sDel X i) i c = X := hc
              have h2 : sIns (sDel Y j) j d = Y := hd
              rw [h1] at hij'
              have h3 : sIns (sDel X i) j d = sIns (sDel Y j) j d := by rw [Hij]
              rw [h3] at hij'
              rw [h2] at hij'
              exact hij'
            }⟩
  | inr hnle =>
    have hnleY : ¬ (1 ≤ length Y) := by { intro h; exact hnle (by { rw [HXY]; exact h }) }
    exact ⟨0, 0, default, default, by {
      have hx_len : length X = 0 := Nat.eq_zero_of_le_zero (Nat.le_of_lt_succ (Nat.lt_of_not_le hnle))
      have hy_len : length Y = 0 := Nat.eq_zero_of_le_zero (Nat.le_of_lt_succ (Nat.lt_of_not_le hnleY))
      have hx_nil : X = [] := List.eq_nil_of_length_eq_zero hx_len
      have hy_nil : Y = [] := List.eq_nil_of_length_eq_zero hy_len
      rw [hx_nil, hy_nil]
    }⟩
}

lemma exists_sDel_eq_of_sIns
  (HXYij : sIns X i a = sIns Y j b) :
  ∃ i' j' : Nat, sDel X i' = sDel Y j' :=
by {
  have hX : sDel (sIns X i a) i = X := sDel_sIns_id X i a
  have hY : sDel (sIns Y j b) j = Y := sDel_sIns_id Y j b
  cases exists_sDel_sDel (sIns X i a) i j with
  | intro i' hi' =>
    cases hi' with
    | intro j' hij' =>
      exact ⟨j', i', by {
        rw [hX] at hij'
        have h1 : sDel (sIns X i a) j = sDel (sIns Y j b) j := by rw [HXYij]
        rw [h1] at hij'
        rw [hY] at hij'
        exact hij'
      }⟩
}

end List

namespace List.Vector

open List

variable {n : Nat} (x : α) (X : List.Vector α n) (Y : List.Vector α (n - 1)) (i j : Nat) (a b : α)

def sDel {n : Nat} (X : List.Vector α n) (i : Nat) : List.Vector α (n - 1) :=
  ⟨List.sDel X.val i, by {
    have h := List.length_sDel X.val i
    have hX := X.2
    rw [hX] at h
    exact h
  }⟩

lemma sDel_nil :
  sDel (List.Vector.nil : List.Vector α 0) i = List.Vector.nil :=
by { apply Subtype.ext; rfl }

lemma sDel_zero :
  sDel (x ::ᵥ X) 0 = X :=
by {
  apply Subtype.ext
  change List.sDel (x :: X.val) 0 = X.val
  rw [List.sDel_zero]
}

lemma sDel_cons (X : List.Vector α (n + 1)) :
  sDel (x ::ᵥ X) (i + 1) = x ::ᵥ sDel X i :=
by {
  apply Subtype.ext
  change List.sDel (x :: X.val) (i + 1) = x :: List.sDel X.val i
  have HX : X.val ≠ [] := by {
    intro h
    have hlen : X.val.length = 0 := by { rw [h]; rfl }
    have hX2 : X.val.length = n + 1 := X.2
    rw [hX2] at hlen
    contradiction
  }
  rw [List.sDel_cons _ _ _ HX]
}

lemma sDel_of_ovrlen (H : n - 1 ≤ i) :
  sDel X i = sDel X (n - 1) :=
by {
  apply Subtype.ext
  change List.sDel X.val i = List.sDel X.val (n - 1)
  have hlen : X.val.length = n := X.2
  have H' : X.val.length - 1 ≤ i := by { rw [hlen]; exact H }
  have h_rw := List.sDel_of_ovrlen X.val i H'
  rw [hlen] at h_rw
  exact h_rw
}

lemma exists_sDel_le :
  ∃ j : Nat, j ≤ n - 1 ∧ sDel X i = sDel X j :=
by {
  cases List.exists_sDel_le X.val i with
  | intro j hj =>
    cases hj with
    | intro hj1 hj2 =>
      exact ⟨j, by {
        have hlen : X.val.length = n := X.2
        rw [hlen] at hj1
        exact hj1
      }, by {
        apply Subtype.ext
        exact hj2
      }⟩
}

lemma sDel_replicate :
  sDel (List.Vector.replicate n a) i = List.Vector.replicate (n - 1) a :=
by {
  apply Subtype.ext
  change List.sDel (List.replicate n a) i = List.replicate (n - 1) a
  rw [List.sDel_replicate]
}

def sIns {n : Nat} (X : List.Vector α n) (i : Nat) (b : α) : List.Vector α (n + 1) :=
  ⟨List.sIns X.val i b, by {
    have h := List.length_sIns X.val i b
    have hX := X.2
    rw [hX] at h
    exact h
  }⟩

lemma sIns_nil :
  sIns (List.Vector.nil : List.Vector α 0) i b = ⟨[b], rfl⟩ :=
by { apply Subtype.ext; rfl }

lemma sIns_zero :
  sIns X 0 b = b ::ᵥ X :=
by {
  apply Subtype.ext
  change List.sIns X.val 0 b = b :: X.val
  rw [List.sIns_zero]
}

lemma sIns_cons (X : List.Vector α n) :
  sIns (x ::ᵥ X) (i + 1) b = x ::ᵥ sIns X i b :=
by {
  apply Subtype.ext
  change List.sIns (x :: X.val) (i + 1) b = x :: List.sIns X.val i b
  rw [List.sIns_cons]
}

lemma sIns_of_ovrlen (H : n ≤ i) :
  sIns X i b = sIns X n b :=
by {
  apply Subtype.ext
  change List.sIns X.val i b = List.sIns X.val n b
  have hlen : X.val.length = n := X.2
  have H' : X.val.length ≤ i := hlen.symm ▸ H
  have hrw1 := List.sIns_of_ovrlen X.val i b H'
  have H'' : X.val.length ≤ n := hlen.symm ▸ Nat.le_refl n
  have hrw2 := List.sIns_of_ovrlen X.val n b H''
  rw [hrw1, hrw2]
}

lemma exists_sIns_le :
  ∃ j : Nat, j ≤ n ∧ sIns X i b = sIns X j b :=
by {
  cases List.exists_sIns_le X.val i b with
  | intro j hj =>
    cases hj with
    | intro hj1 hj2 =>
      have hlen : X.val.length = n := X.2
      have hj1_rw : j ≤ n := hlen ▸ hj1
      exact ⟨j, hj1_rw, by {
        apply Subtype.ext
        change List.sIns X.val i b = List.sIns X.val j b
        exact hj2
      }⟩
}

lemma sIns_sDel_id (X : List.Vector α (n + 1)) (i : Nat) :
  ∃ (b : α), sIns (sDel X i) i b = X :=
by {
  have hX : 1 ≤ X.val.length := by {
    have h_len : X.val.length = n + 1 := X.2
    rw [h_len]
    exact Nat.le_add_left 1 n
  }
  cases List.sIns_sDel_id X.val i hX with
  | intro b hb =>
    exact ⟨b, by { 
      apply Subtype.ext
      change List.sIns (List.sDel X.val i) i b = X.val
      exact hb 
    }⟩
}

lemma sDel_sIns_id :
  sDel (sIns X i b) i = X :=
by {
  apply Subtype.ext
  change List.sDel (List.sIns X.val i b) i = X.val
  rw [List.sDel_sIns_id]
}

lemma sIns_of_sDel (X : List.Vector α (n + 1)) (Y : List.Vector α n) (HXY : Y = sDel X i) :
  ∃ b : α, X = sIns Y i b :=
by {
  have hY : Y.val = List.sDel X.val i := by { 
    have H : Y.val = (sDel X i).val := by rw [HXY]
    exact H
  }
  have HX : 1 ≤ X.val.length := by {
    have h_len : X.val.length = n + 1 := X.2
    rw [h_len]
    exact Nat.le_add_left 1 n
  }
  cases List.sIns_of_sDel X.val Y.val i HX hY with
  | intro b hb =>
    exact ⟨b, by { 
      apply Subtype.ext
      change X.val = List.sIns Y.val i b
      exact hb 
    }⟩
}

lemma sDel_of_sIns (X : List.Vector α n) (Y : List.Vector α (n + 1)) (HXY : Y = sIns X i b) :
  X = sDel Y i :=
by {
  apply Subtype.ext
  have hY : Y.val = List.sIns X.val i b := by { 
    have H : Y.val = (sIns X i b).val := by rw [HXY]
    exact H
  }
  change X.val = List.sDel Y.val i
  exact List.sDel_of_sIns X.val Y.val i b hY
}

lemma exists_sIns_eq_of_sDel [Inhabited α] (X Y : List.Vector α n) (HXYij : sDel X i = sDel Y j) :
  ∃ i' j' : Nat, ∃ a b : α, sIns X i' a = sIns Y j' b :=
by {
  have hXY_len : X.val.length = Y.val.length := by {
    have hX : X.val.length = n := X.2
    have hY : Y.val.length = n := Y.2
    rw [hX, hY]
  }
  have h_sDel : List.sDel X.val i = List.sDel Y.val j := by {
    have H : (sDel X i).val = (sDel Y j).val := by rw [HXYij]
    exact H
  }
  cases List.exists_sIns_eq_of_sDel X.val Y.val i j hXY_len h_sDel with
  | intro i' hi' =>
    cases hi' with
    | intro j' hij' =>
      cases hij' with
      | intro a ha =>
        cases ha with
        | intro b hb =>
          exact ⟨i', j', a, b, by { 
            apply Subtype.ext
            change List.sIns X.val i' a = List.sIns Y.val j' b
            exact hb 
          }⟩
}

lemma exists_sDel_eq_of_sIns (X Y : List.Vector α n) (HXYij : sIns X i a = sIns Y j b) :
  ∃ i' j' : Nat, sDel X i' = sDel Y j' :=
by {
  have h_sIns : List.sIns X.val i a = List.sIns Y.val j b := by {
    have H : (sIns X i a).val = (sIns Y j b).val := by rw [HXYij]
    exact H
  }
  cases List.exists_sDel_eq_of_sIns X.val Y.val i j a b h_sIns with
  | intro i' hi' =>
    cases hi' with
    | intro j' hij' =>
      exact ⟨i', j', by { 
        apply Subtype.ext
        change List.sDel X.val i' = List.sDel Y.val j'
        exact hij' 
      }⟩
}

def dS_le {n : Nat} (X : List.Vector α n) : Nat → List (List.Vector α (n - 1))
  | 0 => [sDel X 0]
  | k + 1 => sDel X (k + 1) :: dS_le X k

lemma mem_dS_le (k : Nat) :
  Y ∈ dS_le X k ↔ ∃ i : Nat, i ≤ k ∧ Y = sDel X i :=
by {
  induction k with
  | zero =>
    apply Iff.intro
    · intro hy
      cases hy with
      | head => exact ⟨0, Nat.le_refl 0, rfl⟩
      | tail _ h => contradiction
    · intro hy
      cases hy with
      | intro i hi =>
        cases hi with
        | intro hi_le hi_eq =>
          have h0 : i = 0 := Nat.eq_zero_of_le_zero hi_le
          rw [h0] at hi_eq
          rw [hi_eq]
          exact List.Mem.head _
  | succ k' ihk =>
    apply Iff.intro
    · intro hy
      cases hy with
      | head => exact ⟨k' + 1, Nat.le_refl _, rfl⟩
      | tail _ h_tail =>
        have h_k' : ∃ i : Nat, i ≤ k' ∧ Y = sDel X i := (ihk.mp h_tail)
        cases h_k' with
        | intro i hi =>
          cases hi with
          | intro hi_le hi_eq =>
            exact ⟨i, Nat.le_succ_of_le hi_le, hi_eq⟩
    · intro hy
      cases hy with
      | intro i hi =>
        cases hi with
        | intro hi_le hi_eq =>
          cases Classical.em (i = k' + 1) with
          | inl heq =>
            rw [heq] at hi_eq
            rw [hi_eq]
            exact List.Mem.head _
          | inr hneq =>
            have h_lt : i < k' + 1 := Nat.lt_of_le_of_ne hi_le hneq
            have h_le : i ≤ k' := Nat.le_of_lt_succ h_lt
            have h_mem : Y ∈ dS_le X k' := ihk.mpr ⟨i, h_le, hi_eq⟩
            exact List.Mem.tail _ h_mem
}

def dS_list {n : Nat} (X : List.Vector α n) : List (List.Vector α (n - 1)) :=
  dS_le X (n - 1)

def IS_le {n : Nat} (X : List.Vector B n) : Nat → List (List.Vector B (n + 1))
  | 0 => [sIns X 0 B.O, sIns X 0 B.I]
  | i + 1 => sIns X (i + 1) B.O :: sIns X (i + 1) B.I :: IS_le X i

def IS_list {n : Nat} (X : List.Vector B n) : List (List.Vector B (n + 1)) :=
  IS_le X n

def dS {n : Nat} (X : List.Vector α n) : Finset (List.Vector α (n - 1)) :=
  List.toFinset (dS_list X)

def IS {n : Nat} (X : List.Vector B n) : Finset (List.Vector B (n + 1)) :=
  List.toFinset (IS_list X)

lemma mem_IS_le (x : List.Vector B n) (k : Nat) (y : List.Vector B (n + 1)) :
  y ∈ IS_le x k ↔ ∃ i : Nat, ∃ b : B, i ≤ k ∧ y = sIns x i b :=
by {
  induction k with
  | zero =>
    apply Iff.intro
    · intro hy
      unfold IS_le at hy
      cases hy with
      | head _ => 
        use 0, B.O
      | tail _ hy =>
        cases hy with
        | head _ => 
          use 0, B.I
        | tail _ hy => contradiction
    · intro hy
      rcases hy with ⟨i, b, hi, rfl⟩
      have hi0 : i = 0 := Nat.eq_zero_of_le_zero hi
      rw [hi0]
      cases b
      · exact List.Mem.head _
      · apply List.Mem.tail; exact List.Mem.head _
  | succ k ih =>
    apply Iff.intro
    · intro hy
      unfold IS_le at hy
      cases hy with
      | head _ => 
        use k + 1, B.O
      | tail _ hy =>
        cases hy with
        | head _ => 
          use k + 1, B.I
        | tail _ hy =>
          have hy' := ih.mp hy
          rcases hy' with ⟨i, b, hi, hyib⟩
          use i, b
          exact ⟨Nat.le_trans hi (Nat.le_succ _), hyib⟩
    · intro hy
      rcases hy with ⟨i, b, hi, hyib⟩
      unfold IS_le
      cases Classical.em (i = k + 1) with
      | inl heq =>
        cases b
        · rw [hyib, heq]; exact List.Mem.head _
        · rw [hyib, heq]; apply List.Mem.tail; exact List.Mem.head _
      | inr hneq =>
        apply List.Mem.tail; apply List.Mem.tail
        apply ih.mpr
        use i, b
        exact ⟨Nat.le_of_lt_succ (Nat.lt_of_le_of_ne hi hneq), hyib⟩
}

lemma mem_IS_list (x : List.Vector B n) (y : List.Vector B (n + 1)) :
  y ∈ IS_list x ↔ ∃ i : Nat, ∃ b : B, y = sIns x i b :=
by {
  unfold IS_list
  have H := mem_IS_le x n y
  cases n with
  | zero =>
    apply Iff.intro
    · intro hy
      have hy' := H.mp hy
      rcases hy' with ⟨i, b, hi, rfl⟩
      use i, b
    · rintro ⟨i, b, rfl⟩
      apply H.mpr
      have h_len : x.val.length = 0 := x.property
      have h1 : x.val.length ≤ i := Nat.le_trans (Nat.le_of_eq h_len) (Nat.zero_le i)
      have h2 : x.val.length ≤ 0 := Nat.le_of_eq h_len
      have heq : sIns x i b = sIns x 0 b := by {
        apply Subtype.ext
        change List.sIns x.val i b = List.sIns x.val 0 b
        rw [List.sIns_of_ovrlen _ _ _ h1, List.sIns_of_ovrlen _ _ _ h2]
      }
      exact ⟨0, b, Nat.le_refl 0, heq⟩
  | succ m =>
    apply Iff.intro
    · intro hy
      have hy' := H.mp hy
      rcases hy' with ⟨i, b, hi, rfl⟩
      use i, b
    · rintro ⟨i, b, rfl⟩
      apply H.mpr
      cases Classical.em (i < Nat.succ (Nat.succ m)) with
      | inl hlt =>
        use i, b
        exact ⟨Nat.le_of_lt_succ hlt, rfl⟩
      | inr hnlt =>
        have h_len : x.val.length = Nat.succ m := x.property
        have h1 : x.val.length ≤ i := by {
          rw [h_len]
          exact Nat.le_trans (Nat.le_succ _) (Nat.le_of_not_lt hnlt)
        }
        have h2 : x.val.length ≤ Nat.succ m := Nat.le_of_eq h_len
        have h_eq : sIns x i b = sIns x (Nat.succ m) b := by {
          apply Subtype.ext
          change List.sIns x.val i b = List.sIns x.val (Nat.succ m) b
          rw [List.sIns_of_ovrlen _ _ _ h1, List.sIns_of_ovrlen _ _ _ h2]
        }
        exact ⟨Nat.succ m, b, Nat.le_refl _, h_eq⟩
}

lemma mem_IS (x : List.Vector B n) (y : List.Vector B (n + 1)) :
  y ∈ IS x ↔ ∃ i : Nat, ∃ b : B, y = sIns x i b :=
by {
  unfold IS
  rw [List.mem_toFinset]
  exact mem_IS_list x y
}

lemma mem_dS :
  Y ∈ dS X ↔ ∃ i : Nat, i ≤ n - 1 ∧ Y = sDel X i :=
by {
  unfold dS
  rw [List.mem_toFinset]
  unfold dS_list
  rw [mem_dS_le]
}

lemma mem_IS_of_mem_dS 
  (X : List.Vector B (n + 1)) (Y : List.Vector B n) (HXY : Y ∈ dS X) :
  X ∈ IS Y :=
by {
  have h_mem := Iff.mp (mem_dS X Y) HXY
  rcases h_mem with ⟨i, _, hyi⟩
  rw [mem_IS]
  exact ⟨i, sIns_of_sDel i X Y hyi⟩
}

lemma mem_dS_of_mem_IS 
  (X : List.Vector B n) (Y : List.Vector B (n + 1)) (HXY : Y ∈ IS X) :
  X ∈ dS Y :=
by {
  rw [mem_IS] at HXY
  rcases HXY with ⟨i, b, hyib⟩
  apply Iff.mpr (mem_dS Y X)
  cases exists_sDel_le Y i with
  | intro j hj =>
    use j
    exact ⟨hj.1, by { rw [← hj.2]; exact sDel_of_sIns i b X Y hyib }⟩
}

lemma dS_inter_empty_of_IS_inter 
  {X Y : List.Vector B n} (HXY : IS X ∩ IS Y = ∅) : 
  dS X ∩ dS Y = ∅ :=
by {
  apply Finset.ext
  intro z
  rw [Finset.mem_inter]
  apply Iff.intro
  · intro hz
    have hzX : z ∈ dS X := hz.left
    have hzY : z ∈ dS Y := hz.right
    rw [mem_dS] at hzX hzY
    rcases hzX with ⟨i, _, hzi⟩
    rcases hzY with ⟨j, _, hzj⟩
    have h1 : ∃ i' j' : Nat, ∃ a b : B, sIns X i' a = sIns Y j' b :=
      exists_sIns_eq_of_sDel i j X Y (hzi.symm.trans hzj)
    rcases h1 with ⟨i', j', a, b, h_eq⟩
    have h2 : sIns X i' a ∈ IS X ∩ IS Y := by {
      rw [Finset.mem_inter, mem_IS, mem_IS]
      exact ⟨⟨i', a, rfl⟩, ⟨j', b, h_eq⟩⟩
    }
    have h3 : sIns X i' a ∉ (∅ : Finset _) := by simp
    rw [← HXY] at h3
    contradiction
  · intro hz
    simp at hz
}

lemma IS_inter_empty_of_dS_inter
  {X Y : List.Vector B n} (HXY : dS X ∩ dS Y = ∅) : 
  IS X ∩ IS Y = ∅ :=
by {
  apply Finset.ext
  intro z
  rw [Finset.mem_inter]
  apply Iff.intro
  · intro hz
    have hzX : z ∈ IS X := hz.left
    have hzY : z ∈ IS Y := hz.right
    rw [mem_IS] at hzX hzY
    rcases hzX with ⟨i, a, hzi⟩
    rcases hzY with ⟨j, b, hzj⟩
    have h1 : ∃ i' j' : Nat, sDel X i' = sDel Y j' :=
      exists_sDel_eq_of_sIns i j a b X Y (hzi.symm.trans hzj)
    rcases h1 with ⟨i', j', h_eq⟩
    cases exists_sDel_le X i' with
    | intro i'' hi'' =>
      cases exists_sDel_le Y j' with
      | intro j'' hj'' =>
        have h2 : sDel X i'' ∈ dS X ∩ dS Y := by {
          rw [Finset.mem_inter, mem_dS, mem_dS]
          exact ⟨⟨i'', hi''.1, rfl⟩, ⟨j'', hj''.1, by rw [← hi''.2, h_eq, hj''.2]⟩⟩
        }
        have h3 : sDel X i'' ∉ (∅ : Finset _) := by simp
        rw [← HXY] at h3
        contradiction
  · intro hz
    simp at hz
}

lemma IS_inter_empty_iff (X Y : List.Vector B n) :
  IS X ∩ IS Y = ∅ ↔ dS X ∩ dS Y = ∅ :=
by {
  apply Iff.intro
  · exact dS_inter_empty_of_IS_inter
  · exact IS_inter_empty_of_dS_inter
}

lemma IS_inter_ne_empty_iff (X Y : List.Vector B n) :
  IS X ∩ IS Y ≠ ∅ ↔ dS X ∩ dS Y ≠ ∅ :=
by {
  apply Iff.intro
  · intro h h'
    rw [← IS_inter_empty_iff] at h'
    contradiction
  · intro h h'
    rw [IS_inter_empty_iff] at h'
    contradiction
}

lemma _root_.List.sDel_flip (X : List B) (i : Nat) :
  List.sDel (B.List.flip X) i = B.List.flip (List.sDel X i) :=
by {
  induction i generalizing X with
  | zero =>
    cases X with
    | nil => rfl
    | cons x1 X1 =>
      cases X1 with
      | nil => rfl
      | cons x2 X2 => rfl
  | succ k ih =>
    cases X with
    | nil => rfl
    | cons x1 X1 =>
      cases X1 with
      | nil => rfl
      | cons x2 X2 =>
        change B.flip x1 :: List.sDel (B.List.flip (x2 :: X2)) k = B.flip x1 :: B.List.flip (List.sDel (x2 :: X2) k)
        rw [ih (x2 :: X2)]
}

lemma sDel_flip (X : List.Vector B n) (i : Nat) :
  List.Vector.sDel (B.Vector.flip X) i = B.Vector.flip (List.Vector.sDel X i) :=
by {
  apply Subtype.ext
  exact List.sDel_flip X.val i
}

lemma dS_flip (x : List.Vector B n) :
  dS (B.Vector.flip x) = B.Finset.flipCode (dS x) :=
by {
  apply Finset.Subset.antisymm
  · intro y hy
    rw [mem_dS] at hy
    rcases hy with ⟨i, hi, hyi⟩
    rw [B.Finset.mem_flipCode]
    use List.Vector.sDel x i
    rw [mem_dS]
    exact ⟨⟨i, hi, rfl⟩, by { rw [hyi, ← sDel_flip] }⟩
  · intro y hy
    rw [B.Finset.mem_flipCode] at hy
    rcases hy with ⟨z, hz, hzy⟩
    rw [mem_dS] at hz
    rcases hz with ⟨i, hi, hzi⟩
    rw [mem_dS]
    use i
    exact ⟨hi, by { rw [← hzy, hzi, ← sDel_flip] }⟩
}

def union_dS {n : Nat} (C : Finset (List.Vector α n)) : Finset (List.Vector α (n - 1)) :=
  C.biUnion (fun x => dS x)

lemma union_dS_empty :
  union_dS (∅ : Finset (List.Vector α n)) = ∅ :=
by exact Finset.biUnion_empty

lemma union_dS_insert (C : Finset (List.Vector α n)) (Hx : X ∉ C) :
  union_dS (insert X C) = dS X ∪ union_dS C :=
by {
  unfold union_dS
  rw [Finset.biUnion_insert]
}

lemma card_union_dS_insert (C : Finset (List.Vector α n)) (H : X ∉ C):
  (union_dS (insert X C)).card = (dS X).card + (union_dS C).card - (dS X ∩ union_dS C).card :=
by {
  rw [union_dS_insert X C H]
  have h := Finset.card_union_add_card_inter (dS X) (union_dS C)
  exact Eq.symm (Nat.sub_eq_of_eq_add h.symm)
}

lemma union_dS_union (C C' : Finset (List.Vector α n)) :
  union_dS (C ∪ C') = union_dS C ∪ union_dS C' :=
by {
  unfold union_dS
  exact Finset.union_biUnion
}

lemma mem_union_dS (C : Finset (List.Vector α n)) :
  Y ∈ union_dS C ↔ ∃ c ∈ C, Y ∈ dS c :=
by {
  unfold union_dS
  exact Finset.mem_biUnion
}

lemma dS_subset_union_dS (C : Finset (List.Vector α n)) (c : List.Vector α n) (Hc : c ∈ C) :
  dS c ⊆ union_dS C :=
by {
  intro y hy
  rw [mem_union_dS]
  exact ⟨c, Hc, hy⟩
}

lemma union_dS_subset_of_subset (C₁ C₂ : Finset (List.Vector α n)) (H : C₁ ⊆ C₂) :
  union_dS C₁ ⊆ union_dS C₂ :=
by {
  intro y hy
  rw [mem_union_dS] at hy
  cases hy with
  | intro c hc =>
    cases hc with
    | intro hc1 hc2 =>
      rw [mem_union_dS]
      exact ⟨c, H hc1, hc2⟩
}

lemma dS_inter_union_dS (C : Finset (List.Vector α n)) (HX : ∀ c ∈ C, dS X ∩ dS c = ∅) :
  dS X ∩ union_dS C = ∅ :=
by {
  apply Finset.ext
  intro y
  rw [Finset.mem_inter]
  apply Iff.intro
  · intro hy
    have hym : y ∈ union_dS C := hy.right
    rw [mem_union_dS] at hym
    cases hym with
    | intro c hc =>
      cases hc with
      | intro hc1 hc2 =>
        have HXc := HX c hc1
        have hint : y ∈ dS X ∩ dS c := Finset.mem_inter.mpr ⟨hy.left, hc2⟩
        rw [HXc] at hint
        exact hint
  · intro hy
    contradiction
}

lemma forall_dS_inter_dS
  (C : Finset (List.Vector α n)) (HX : dS X ∩ union_dS C = ∅)  :
  ∀ c ∈ C, dS X ∩ dS c = ∅ :=
by {
  intro c hc
  apply Finset.Subset.antisymm
  · intro x hx
    have h1 : x ∈ dS X ∩ union_dS C := by {
      rw [Finset.mem_inter] at hx ⊢
      exact ⟨hx.1, dS_subset_union_dS C c hc hx.2⟩
    }
    rw [HX] at h1
    exact h1
  · exact Finset.empty_subset _
}

lemma forall_dS_inter_dS_iff (C : Finset (List.Vector α n)):
  (∀ c ∈ C, dS X ∩ dS c = ∅) ↔ dS X ∩ union_dS C = ∅ :=
by {
  apply Iff.intro
  · exact dS_inter_union_dS X C
  · exact forall_dS_inter_dS X C
}

end List.Vector
