/- Copyright Manabu Hagiwara 2022, 2026 -/
import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Basic
import VTlean.InsDel
import VTlean.B
import VTlean.NumOsNumIs
import Mathlib.Data.Fintype.EquivFin
import Mathlib.Data.Nat.Basic



variable {α : Type} [DecidableEq α]
variable {n : Nat} (C C' : Finset (List.Vector α n)) (c : List.Vector α n)
variable (X X' : List.Vector α n) (Y : List.Vector α (n - 1))

open Nat List List.Vector Finset B

def wt {n : Nat} (X : List.Vector B n) : Nat := List.num_Is X.val

def Icc_wt {n : Nat} (a b : Nat) (X : List.Vector B n) : Prop :=
  a ≤ wt X ∧ wt X ≤ b

noncomputable instance {n : Nat} (a b : Nat) : DecidablePred (@Icc_wt n a b) :=
  Classical.decPred _

def Iic_wt {n : Nat} (a : Nat) (X : List.Vector B n) : Prop :=
  wt X ≤ a

noncomputable instance {n : Nat} (a : Nat) : DecidablePred (@Iic_wt n a) :=
  Classical.decPred _

def Ici_wt {n : Nat} (a : Nat) (X : List.Vector B n) : Prop :=
  a ≤ wt X

noncomputable instance {n : Nat} (a : Nat) : DecidablePred (@Ici_wt n a) :=
  Classical.decPred _
def is_DelCode {n : Nat} (C : Finset (List.Vector α n)) : Prop :=
  ∀ X ∈ C, ∀ Y ∈ C, X ≠ Y → dS X ∩ dS Y = ∅

noncomputable instance DecidablePred_is_DelCode [Fintype α] :
  DecidablePred (@is_DelCode α _ n) :=
  Classical.decPred _
lemma DelCode_empty :
  is_DelCode (∅ : Finset (List.Vector α n)) :=
by {
  intro x hx _ _ _
  exact False.elim (Finset.notMem_empty x hx)
}
lemma DelCode_singleton :
  is_DelCode ({X}) :=
by {
  intro x hx y hy hne
  rw [Finset.mem_singleton] at hx hy
  rw [hx, hy] at hne
  exact absurd rfl hne
}
lemma DelCode_subset
  (H : is_DelCode C) (HCC : C' ⊆ C) :
  is_DelCode C' :=
by {
  intro x hx y hy hne
  exact H x (HCC hx) y (HCC hy) hne
}
lemma DelCode_filter
  (H : is_DelCode C) (p : List.Vector α n → Prop) [DecidablePred p] :
  is_DelCode (filter p C) :=
  DelCode_subset C (filter p C) H (Finset.filter_subset p C)
lemma DelCode_sdiff
  (H : is_DelCode C) (S : Finset (List.Vector α n)) :
  is_DelCode (C \ S) :=
  DelCode_subset C (C \ S) H Finset.sdiff_subset
lemma DelCode_insert
  (HC : is_DelCode C) (Hx : ∀ c ∈ C, dS X ∩ dS c = ∅):
  is_DelCode (insert X C) :=
by {
  intro y hy z hz hne
  rw [Finset.mem_insert] at hy hz
  cases hy with
  | inl hyx =>
    cases hz with
    | inl hzx =>
      rw [hyx, hzx] at hne
      contradiction
    | inr hzC =>
      rw [hyx]
      exact Hx z hzC
  | inr hyC =>
    cases hz with
    | inl hzx =>
      rw [hzx, Finset.inter_comm]
      exact Hx y hyC
    | inr hzC =>
      exact HC y hyC z hzC hne
}
lemma DelCode_of_insert
  (H : is_DelCode (insert X C)) :
  is_DelCode C :=
  DelCode_subset (insert X C) C H (Finset.subset_insert X C)
lemma dS_inter_union_dS_iff (C : Finset (List.Vector α n)) :
  dS X ∩ union_dS C = ∅ ↔ ∀ c ∈ C, dS X ∩ dS c = ∅ :=
by {
  constructor
  · intro h c hc
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro y hy
    rw [Finset.eq_empty_iff_forall_notMem] at h
    have hy_inter : y ∈ dS X ∩ union_dS C := by
      rw [Finset.mem_inter] at hy ⊢
      constructor
      · exact hy.left
      · rw [mem_union_dS]
        exact ⟨c, hc, hy.right⟩
    exact h y hy_inter
  · intro h
    apply Finset.eq_empty_iff_forall_notMem.mpr
    intro y hy
    rw [Finset.mem_inter] at hy
    rw [mem_union_dS] at hy
    rcases hy.right with ⟨c, hc, hyc⟩
    have h_empty := h c hc
    rw [Finset.eq_empty_iff_forall_notMem] at h_empty
    have hy_inter : y ∈ dS X ∩ dS c := by
      rw [Finset.mem_inter]
      exact ⟨hy.left, hyc⟩
    exact h_empty y hy_inter
}

lemma DelCode_insert_iff (Hx : X ∉ C) :
  is_DelCode (insert X C) ↔ is_DelCode C ∧ ∀ c ∈ C, dS X ∩ dS c = ∅ :=
by {
  constructor
  · intro hCx
    constructor
    · exact DelCode_of_insert _ X hCx
    · intro c hc
      apply hCx X (Finset.mem_insert_self X C) c (Finset.mem_insert_of_mem hc)
      rintro rfl
      contradiction
  · rintro ⟨h1, h2⟩
    exact DelCode_insert C X h1 h2
}

lemma DelCode_insert_iff' (Hx : X ∉ C) :
  is_DelCode (insert X C) ↔ is_DelCode C ∧ dS X ∩ union_dS C = ∅ :=
by {
  rw [DelCode_insert_iff C X Hx, dS_inter_union_dS_iff]
}
lemma DelCode_erase (H : is_DelCode C) :
  is_DelCode (erase C X) :=
  DelCode_subset C (erase C X) H (Finset.erase_subset X C)
def replaceCode :=
  insert X' (erase C X)

lemma DelCode_replaceCode
  (HC : is_DelCode C) (HX : X ∈ C) (HX' : dS X' ⊆ dS X) :
  is_DelCode (replaceCode C X X') :=
by {
  unfold replaceCode
  apply DelCode_insert _ _ (DelCode_erase C X HC)
  intro c hc
  rw [← Finset.subset_empty]
  apply Finset.Subset.trans
  · exact Finset.inter_subset_inter_right HX'
  · have hc_mem : c ∈ C := Finset.mem_of_mem_erase hc
    have hc_ne : X ≠ c := by
      intro heq
      rw [heq] at hc
      exact Finset.notMem_erase c C hc
    have h_inter := HC X HX c hc_mem hc_ne
    rw [h_inter]
}
lemma card_replaceCode
  (HC : is_DelCode C)
  (x : List.Vector α n) (Hx : x ∈ C)
  (y : List.Vector α n) (Hxy : dS y ⊆ dS x) :
  card (replaceCode C x y) = card C :=
by {
  unfold replaceCode
  rw [Finset.card_insert_of_notMem]
  · rw [Finset.card_erase_of_mem Hx]
    have h_card_pos : 0 < card C := by
      apply Finset.card_pos.mpr
      exact ⟨x, Hx⟩
    exact Nat.succ_pred_eq_of_pos h_card_pos
  · intro h
    rw [Finset.mem_erase] at h
    have h1 : dS x ∩ dS y = ∅ := HC x Hx y h.2 h.1.symm
    have h2 : dS y ⊆ dS x ∩ dS y := Finset.subset_inter Hxy (Finset.Subset.refl _)
    rw [h1] at h2
    have h3 : dS y = ∅ := Finset.subset_empty.mp h2
    have h4 : List.Vector.sDel y 0 ∈ dS y := by
      rw [List.Vector.mem_dS]
      use 0
      exact ⟨Nat.zero_le _, rfl⟩
    have h5 : dS y ≠ ∅ := Finset.ne_empty_of_mem h4
    contradiction
}
lemma DelCode_flipCode
  {C : Finset (List.Vector B n)} (HC : is_DelCode C) :
  is_DelCode (B.Finset.flipCode C) :=
by {
  intro x hx y hy hne
  rw [B.Finset.mem_flipCode] at hx hy
  rcases hx with ⟨x', hx', hxx'⟩
  rcases hy with ⟨y', hy', hyy'⟩
  rw [← hxx', ← hyy'] at hne
  have hne' : x' ≠ y' := by
    intro h
    rw [h] at hne
    contradiction
  have h_inter := HC x' hx' y' hy' hne'
  rw [← hxx', ← hyy']
  rw [dS_flip, dS_flip, ← B.Finset.flipCode_inter, h_inter, B.Finset.flipCode_empty]
}

lemma wt_flip {n : Nat} (X : List.Vector B n) : wt (B.Vector.flip X) = n - wt X := by {
  have h_flip : List.num_Is (B.List.flip X.val) = List.num_Os X.val := List.num_Is_flip X.val
  have h_len : List.num_Os X.val + List.num_Is X.val = n := Eq.trans (List.num_Os_add_num_Is_eq_length X.val) X.property
  have h_sub : List.num_Os X.val = n - List.num_Is X.val := (Nat.sub_eq_of_eq_add h_len.symm).symm
  exact Eq.trans h_flip h_sub
}

namespace B.Finset

lemma filter_flipCode_swap {n : Nat} (C : Finset (List.Vector B n)) (a b : Nat)
  (Ha : a ≤ n) (Hb : b ≤ n) :
  (filter (Icc_wt a b) (flipCode C)).card = (filter (Icc_wt (n - b) (n - a)) C).card :=
by {
  refine Set.BijOn.finsetCard_eq B.Vector.flip ?_
  unfold Set.BijOn Set.MapsTo Set.InjOn Set.SurjOn
  apply And.intro
  · intro x hx
    rw [Finset.mem_coe, Finset.mem_filter] at hx ⊢
    have hC : B.Vector.flip x ∈ C := (flipCode_mem C x).mpr hx.1
    have hw : Icc_wt (n - b) (n - a) (B.Vector.flip x) := by
      unfold Icc_wt at hx ⊢
      rw [wt_flip]
      have h1 : n - wt x ≤ n - a := Nat.sub_le_sub_left hx.2.1 n
      have h2 : n - b ≤ n - wt x := Nat.sub_le_sub_left hx.2.2 n
      exact ⟨h2, h1⟩
    exact ⟨hC, hw⟩
  · apply And.intro
    · intro x _ y _ hxy
      have hxy_flip : B.Vector.flip (B.Vector.flip x) = B.Vector.flip (B.Vector.flip y) := congrArg B.Vector.flip hxy
      rw [B.Vector.flip_flip, B.Vector.flip_flip] at hxy_flip
      exact hxy_flip
    · intro y hy
      rw [Finset.mem_coe, Finset.mem_filter] at hy
      use B.Vector.flip y
      have h_mem : B.Vector.flip y ∈ filter (Icc_wt a b) (flipCode C) := by
        rw [Finset.mem_filter]
        have hc_mem : B.Vector.flip y ∈ flipCode C := (flipCode_mem C (B.Vector.flip y)).mp (by { rw [B.Vector.flip_flip]; exact hy.1 })
        have hw : Icc_wt a b (B.Vector.flip y) := by
          unfold Icc_wt at hy ⊢
          rw [wt_flip]
          have h1 : a ≤ n - wt y := by
            have ha_le : a ≤ n - (n - a) := by rw [Nat.sub_sub_self Ha]
            apply Nat.le_trans ha_le
            apply Nat.sub_le_sub_left hy.2.2 n
          have h2 : n - wt y ≤ b := by
            have hb_le : n - (n - b) ≤ b := by rw [Nat.sub_sub_self Hb]
            apply Nat.le_trans _ hb_le
            apply Nat.sub_le_sub_left hy.2.1 n
          exact ⟨h1, h2⟩
        exact ⟨hc_mem, hw⟩
      exact ⟨h_mem, B.Vector.flip_flip y⟩
}

end B.Finset

lemma exists_DC_card_filter_wt_le
  (S : Finset (List.Vector B n)) (HS : B.Finset.flipCode S = S)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (HCS : C ⊆ S)
  (a b : Nat) (Ha : a ≤ n) (Hb : b ≤ n) :
  ∃ C' : Finset (List.Vector B n), is_DelCode C' ∧ C' ⊆ S
  ∧ C'.card = C.card ∧ (filter (Icc_wt (n - b) (n - a)) C').card ≤ (filter (Icc_wt a b) C').card :=
by {
  by_cases hle : (filter (Icc_wt (n - b) (n - a)) C).card ≤ (filter (Icc_wt a b) C).card
  · exact ⟨C, HC, HCS, rfl, hle⟩
  · use B.Finset.flipCode C
    rw [← HS]
    refine ⟨DelCode_flipCode HC, B.Finset.flipCode_subset _ _ HCS, B.Finset.card_flipCode _, ?_⟩
    have h1 : (filter (Icc_wt (n - b) (n - a)) (B.Finset.flipCode C)).card = (filter (Icc_wt a b) C).card := by {
      rw [B.Finset.filter_flipCode_swap _ _ _ (Nat.sub_le n b) (Nat.sub_le n a)]
      have h1a : n - (n - a) = a := Nat.sub_sub_self Ha
      have h1b : n - (n - b) = b := Nat.sub_sub_self Hb
      rw [h1a, h1b]
    }
    have h2 : (filter (Icc_wt a b) (B.Finset.flipCode C)).card = (filter (Icc_wt (n - b) (n - a)) C).card := by {
      rw [B.Finset.filter_flipCode_swap _ _ _ Ha Hb]
    }
    rw [h1, h2]
    exact le_of_lt (Nat.lt_of_not_ge hle)
}
def sum_card_dS {n : Nat} (C : Finset (List.Vector α n)) : Nat :=
  C.sum (fun c => (dS c).card)

lemma sum_card_dS_empty :
  sum_card_dS (∅ : Finset (List.Vector α n)) = 0 :=
by {
  unfold sum_card_dS
  exact Finset.sum_empty
}
lemma sum_card_dS_insert (H : X ∉ C) :
  sum_card_dS (insert X C) = (dS X).card + sum_card_dS C :=
by {
  unfold sum_card_dS
  exact Finset.sum_insert H
}
def is_DelCode' {n : Nat} (C : Finset (List.Vector α n)) : Prop :=
  (union_dS C).card = sum_card_dS C

instance DecidablePred_is_DelCode' :
  DecidablePred (@is_DelCode' α _ n) :=
fun C => by
  unfold is_DelCode'
  exact instDecidableEqNat _ _

lemma DelCode'_empty :
  is_DelCode' (∅ : Finset (List.Vector α n)) :=
by {
  unfold is_DelCode'
  rw [union_dS_empty, Finset.card_empty, sum_card_dS_empty]
}
lemma card_union_dS_le :
  (union_dS C).card ≤ sum_card_dS C :=
by {
  induction C using Finset.induction_on with
  | empty => exact Nat.le_refl _
  | insert x S hnin IH =>
    rw [sum_card_dS_insert S x hnin, union_dS_insert x S hnin]
    apply Nat.le_trans (Finset.card_union_le _ _)
    exact Nat.add_le_add_left IH _
}
lemma dS_inter_union_dS_of_DelCode'_insert
  (HX : X ∉ C) (HCX : is_DelCode' (insert X C)) :
  dS X ∩ union_dS C = ∅ :=
by {
  unfold is_DelCode' at HCX
  rw [card_union_dS_insert X C HX, sum_card_dS_insert C X HX] at HCX
  rw [← Finset.card_eq_zero]
  have hdS : 0 < (dS X).card := by {
    rw [Finset.card_pos]
    exact ⟨sDel X 0, (mem_dS X (sDel X 0)).mpr ⟨0, Nat.zero_le _, rfl⟩⟩
  }
  have Hn : 0 < (dS X).card + (union_dS C).card := Nat.lt_of_lt_of_le hdS (Nat.le_add_right _ _)
  have Hnm : (dS X).card + (union_dS C).card ≤ (dS X).card + sum_card_dS C := Nat.add_le_add_left (card_union_dS_le C) _
  exact Nat.zero_of_sub_eq_of_le Hn Hnm HCX
}
lemma DelCode'_of_DelCode'_insert
  (HX : X ∉ C) (HCX : is_DelCode' (insert X C)) :
  is_DelCode' C :=
by {
  have h : (dS X).card + (union_dS C).card - (dS X ∩ union_dS C).card = (dS X).card + sum_card_dS C := by {
    unfold is_DelCode' at HCX
    rw [card_union_dS_insert X C HX, sum_card_dS_insert C X HX] at HCX
    exact HCX
  }
  rw [dS_inter_union_dS_of_DelCode'_insert C X HX HCX, Finset.card_empty, Nat.sub_zero] at h
  exact Nat.add_left_cancel h
}
lemma card_dS_insert_of_card_dS
  (HC : is_DelCode' C) (HX : X ∉ C) (HCX : dS X ∩ union_dS C = ∅):
  is_DelCode' (insert X C) :=
by {
  unfold is_DelCode' at HC ⊢
  rw [card_union_dS_insert X C HX, HC, HCX, Finset.card_empty, Nat.sub_zero, sum_card_dS_insert C X HX]
}
lemma DelCode'_insert_iff (HX : X ∉ C) :
  is_DelCode' (insert X C) ↔ is_DelCode' C ∧ dS X ∩ union_dS C = ∅ :=
by {
  apply Iff.intro
  · intro h
    exact ⟨DelCode'_of_DelCode'_insert C X HX h, dS_inter_union_dS_of_DelCode'_insert C X HX h⟩
  · intro h
    exact card_dS_insert_of_card_dS C X h.left HX h.right
}
lemma DelCode_of_DelCode' (HC : is_DelCode' C) :
  is_DelCode C :=
by {
  induction C using Finset.induction_on with
  | empty => exact DelCode_empty
  | insert s S hs ihC =>
    rw [DelCode'_insert_iff S s hs] at HC
    rw [DelCode_insert_iff' S s hs]
    exact ⟨ihC HC.left, HC.right⟩
}
lemma DelCode'_of_DelCode (HC : is_DelCode C) :
  is_DelCode' C :=
by {
  induction C using Finset.induction_on with
  | empty => exact DelCode'_empty
  | insert s S hs ihC =>
    rw [DelCode_insert_iff' S s hs] at HC
    rw [DelCode'_insert_iff S s hs]
    exact ⟨ihC HC.left, HC.right⟩
}
lemma DelCode'_iff {n : Nat} (C : Finset (List.Vector α n)) :
  is_DelCode' C ↔ is_DelCode C :=
by {
  apply Iff.intro
  · exact DelCode_of_DelCode' C
  · exact DelCode'_of_DelCode C
}
lemma union_dS_inter_of_DelCode
  {C : Finset (List.Vector α n)} (HC : is_DelCode C)
  {C₁ C₂ : Finset (List.Vector α n)} (HC₁ : C₁ ⊆ C) (HC₂ : C₂ ⊆ C)
  (H : C₁ ∩ C₂ = ∅) :
  union_dS C₁ ∩ union_dS C₂ = ∅ :=
by {
  rw [← Finset.subset_empty]
  intro x hx
  rw [Finset.mem_inter] at hx
  have hx1 := hx.1
  have hx2 := hx.2
  rw [mem_union_dS] at hx1 hx2
  rcases hx1 with ⟨y1, hy1, hxy1⟩
  rcases hx2 with ⟨y2, hy2, hxy2⟩
  have h1 : dS y1 ∩ dS y2 = ∅ := by
    apply HC y1 (HC₁ hy1) y2 (HC₂ hy2)
    intro h_eq
    rw [h_eq] at hy1
    have h_mem_inter : y2 ∈ C₁ ∩ C₂ := by
      rw [Finset.mem_inter]
      exact ⟨hy1, hy2⟩
    rw [H] at h_mem_inter
    exact False.elim (Finset.notMem_empty _ h_mem_inter)
  have h2 : x ∈ dS y1 ∩ dS y2 := by
    rw [Finset.mem_inter]
    exact ⟨hxy1, hxy2⟩
  have h3 : dS y1 ∩ dS y2 ≠ ∅ := Finset.ne_empty_of_mem h2
  contradiction
}
namespace B

def dB {n : Nat} (X : List.Vector B n) : Finset (List.Vector B n) :=
  union_dS (IS X)

lemma mem_dB {n : Nat} (X Y : List.Vector B n) :
  Y ∈ dB X ↔ Y ∈ union_dS (IS X) :=
by exact Iff.rfl
lemma mem_dB_iff {n : Nat} (X Y : List.Vector B n) :
  Y ∈ dB X ↔ IS X ∩ IS Y ≠ ∅ :=
by {
  apply Iff.intro
  · intro hY
    unfold dB union_dS at hY
    have hY2 : ∃ Z ∈ IS X, Y ∈ dS Z := Finset.mem_biUnion.mp hY
    rcases hY2 with ⟨Z, hZ, hYZ⟩
    have h : Z ∈ IS X ∩ IS Y := by {
      rw [Finset.mem_inter]
      exact ⟨hZ, mem_IS_of_mem_dS Z Y hYZ⟩
    }
    exact Finset.ne_empty_of_mem h
  · intro h
    rcases Finset.nonempty_of_ne_empty h with ⟨Z, hZ⟩
    rw [Finset.mem_inter] at hZ
    unfold dB union_dS
    exact Finset.mem_biUnion.mpr ⟨Z, hZ.1, mem_dS_of_mem_IS Y Z hZ.2⟩
}
lemma mem_dB_iff' {n : Nat} (X Y : List.Vector B n) :
  Y ∈ dB X ↔ dS X ∩ dS Y ≠ ∅ :=
by {
  rw [mem_dB_iff, IS_inter_ne_empty_iff]
}
def union_dB {n : Nat} (C : Finset (List.Vector B n)) :=
  C.biUnion dB

lemma union_dB_empty {n : Nat} :
  union_dB (∅ : Finset (List.Vector B n)) = ∅ :=
by {
  unfold union_dB
  exact Finset.biUnion_empty
}
lemma mem_union_dB (C : Finset (List.Vector B n)) (X : List.Vector B n) :
  X ∈ union_dB C ↔ ∃ Y ∈ C, X ∈ dB Y :=
by {
  unfold union_dB
  exact Finset.mem_biUnion
}
lemma mem_union_dB_iff (C : Finset (List.Vector B n)) (X : List.Vector B n) :
  X ∈ union_dB C ↔ ∃ Y ∈ C, dS Y ∩ dS X ≠ ∅ :=
by {
  apply Iff.intro
  · intro h
    rw [mem_union_dB] at h
    rcases h with ⟨Y, hY, hXY⟩
    rw [mem_dB_iff'] at hXY
    exact ⟨Y, hY, hXY⟩
  · intro h
    rcases h with ⟨Y, hY, hXY⟩
    rw [mem_union_dB]
    use Y
    exact ⟨hY, (mem_dB_iff' Y X).mpr hXY⟩
}
lemma not_mem_dB_iff
  (C : Finset (List.Vector B n)) (X : List.Vector B n) :
  X ∉ union_dB C ↔ ∀ Y ∈ C, dS Y ∩ dS X = ∅ :=
by {
  apply Iff.intro
  · intro h Y hY
    by_contra h_ne
    have h_mem : X ∈ union_dB C := by
      rw [mem_union_dB_iff]
      exact ⟨Y, hY, h_ne⟩
    contradiction
  · intro h h_mem
    rw [mem_union_dB_iff] at h_mem
    rcases h_mem with ⟨Y, hY, hXY⟩
    exact hXY (h Y hY)
}
lemma subset_union_dB (C : Finset (List.Vector B n)) :
  C ⊆ union_dB C :=
by {
  intro x hx
  rw [mem_union_dB_iff]
  use x
  exact ⟨hx, by {
    rw [Finset.inter_self]
    have h4 : List.Vector.sDel x 0 ∈ dS x := by
      rw [List.Vector.mem_dS]
      use 0
      exact ⟨Nat.zero_le _, rfl⟩
    exact Finset.ne_empty_of_mem h4
  }⟩
}
lemma union_dB_subset
  (C₁ C₂ : Finset (List.Vector B n)) (H : C₁ ⊆ C₂) :
  union_dB C₁ ⊆ union_dB C₂  :=
by {
  intro x hx
  rw [mem_union_dB_iff] at hx
  rcases hx with ⟨y, hy, hxy⟩
  rw [mem_union_dB_iff]
  exact ⟨y, H hy, hxy⟩
}
lemma not_mem_of_not_mem_dB
  (C : Finset (List.Vector B n)) (X : List.Vector B n)
  (H : X ∉ union_dB C) :
  X ∉ C :=
by {
  intro h
  have hX : X ∈ union_dB C := subset_union_dB C h
  contradiction
}
lemma DelCode_insert_iff_not_mem_dB
  (C : Finset (List.Vector B n)) (X : List.Vector B n) (HX : X ∉ C) :
  is_DelCode (insert X C) ↔ is_DelCode C ∧ X ∉ union_dB C :=
by {
  rw [DelCode_insert_iff C X HX, not_mem_dB_iff]
  apply Iff.intro
  · intro h
    refine ⟨h.1, fun Y hY => ?_⟩
    have h_eq := h.2 Y hY
    rw [Finset.inter_comm] at h_eq
    exact h_eq
  · intro h
    refine ⟨h.1, fun Y hY => ?_⟩
    have h_eq := h.2 Y hY
    rw [Finset.inter_comm] at h_eq
    exact h_eq
}
lemma not_mem_union_dB
  {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  {C₁ C₂ : Finset (List.Vector B n)}
  (HC₁ : C₁ ⊆ C) (HC₂ : C₂ ⊆ C) (H : C₁ ∩ C₂ = ∅)
  (c : List.Vector B n) (Hc : c ∈ C₁) :
  c ∉ union_dB C₂ :=
by {
  rw [not_mem_dB_iff]
  intro y hy
  apply HC y (HC₂ hy) c (HC₁ Hc)
  intro h_eq
  have h_mem : c ∈ C₁ ∩ C₂ := by
    rw [Finset.mem_inter]
    exact ⟨Hc, by { rw [← h_eq]; exact hy }⟩
  rw [H] at h_mem
  exact Finset.notMem_empty _ h_mem
}
lemma DelCode_union_iff
  {n : Nat} {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  {S C' : Finset (List.Vector B n)} (HSC' : C' ⊆ S) (HC' : is_DelCode C') (H : C ∩ C' = ∅) :
  is_DelCode (C ∪ C') ↔ C' ⊆ S \ union_dB C :=
by {
  apply Iff.intro
  · intro h x hx
    rw [Finset.mem_sdiff]
    exact ⟨HSC' hx, by {
      rw [not_mem_dB_iff]
      intro y hy
      apply h y (by { rw [Finset.mem_union]; exact Or.inl hy }) x (by { rw [Finset.mem_union]; exact Or.inr hx })
      intro h_eq
      have H' : C ∩ C' ≠ ∅ := by
        have h_mem : y ∈ C ∩ C' := by
          rw [Finset.mem_inter]
          exact ⟨hy, by { rw [h_eq]; exact hx }⟩
        exact Finset.ne_empty_of_mem h_mem
      contradiction
    }⟩
  · intro h x hx y hy hne
    rw [Finset.mem_union] at hx
    rcases hx with hx | hx
    · rw [Finset.mem_union] at hy
      rcases hy with hy | hy
      · exact HC x hx y hy hne
      · have H' : y ∈ S \ union_dB C := h hy
        rw [Finset.mem_sdiff] at H'
        rw [not_mem_dB_iff] at H'
        exact H'.2 x hx
    · rw [Finset.mem_union] at hy
      rcases hy with hy | hy
      · have H' : x ∈ S \ union_dB C := h hx
        rw [Finset.mem_sdiff] at H'
        rw [not_mem_dB_iff] at H'
        have h_eq := H'.2 y hy
        rw [Finset.inter_comm] at h_eq
        exact h_eq
      · exact HC' x hx y hy hne
}
lemma subset_union_dB_of_DelCode
  {S : Finset (List.Vector B n)} {C : Finset (List.Vector B n)}
  (HC : is_DelCode C) (HCS : C ⊆ S)
  {C₁ C₂ : Finset (List.Vector B n)}
  (HC₁ : C₁ ⊆ C) (HC₂ : C₂ ⊆ C) (H : C₁ ∩ C₂ = ∅) :
  C₁ ⊆ S \ union_dB C₂ :=
by {
  intro y hy
  rw [Finset.mem_sdiff]
  exact ⟨HCS (HC₁ hy), not_mem_union_dB HC HC₁ HC₂ H y hy⟩
}
lemma not_mem_union_dB_erase
  {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  (c : List.Vector B n) (Hc : c ∈ C) :
  c ∉ union_dB (erase C c) :=
by {
  rw [not_mem_dB_iff]
  intro y hy
  apply HC y (Finset.erase_subset _ _ hy) c Hc
  rw [Finset.mem_erase] at hy
  exact hy.1
}
def dS_wt (X : List.Vector B n) (w : Nat) : Finset (List.Vector B (n - 1)) :=
  filter (fun x => wt x = w) (dS X)

lemma mem_dS_wt (X : List.Vector B n) (w : Nat) (Y : List.Vector B (n - 1)) :
  Y ∈ dS_wt X w ↔ Y ∈ dS X ∧ wt Y = w :=
by {
  unfold dS_wt
  rw [Finset.mem_filter]
}
lemma dS_wt_subset (X : List.Vector B n) (w : Nat) :
  dS_wt X w ⊆ dS X :=
by {
  intro x hx
  rw [mem_dS_wt] at hx
  exact hx.1
}
def union_dS_wt (C : Finset (List.Vector B n)) (w : Nat) : Finset (List.Vector B (n - 1)) :=
  filter (fun x => wt x = w) (union_dS C)

lemma mem_union_dS_wt (C : Finset (List.Vector B n)) (w : Nat) (X : List.Vector B (n - 1)) :
  X ∈ union_dS_wt C w ↔ X ∈ union_dS C ∧ wt X = w :=
by {
  unfold union_dS_wt
  rw [Finset.mem_filter]
}
lemma union_dS_wt_empty (w : Nat) :
  union_dS_wt (∅ : Finset (List.Vector B n)) w = ∅ :=
by {
  unfold union_dS_wt
  rw [union_dS_empty, Finset.filter_empty]
}
lemma  union_dS_wt_insert
  (C : Finset (List.Vector B n)) (w : Nat) (X : List.Vector B n) (HX : X ∉ C):
  union_dS_wt (insert X C) w = dS_wt X w ∪ union_dS_wt C w :=
by {
  unfold union_dS_wt dS_wt
  rw [List.Vector.union_dS_insert X C HX, Finset.filter_union]
}
lemma union_dS_wt_subset
  (C : Finset (List.Vector B n)) (w : Nat):
  union_dS_wt C w ⊆ union_dS C :=
by {
  intro x hx
  rw [mem_union_dS_wt] at hx
  exact hx.1
}
lemma union_dS_wt_subset_of_subset
  (C₁ C₂ : Finset (List.Vector B n)) (H : C₁ ⊆ C₂) (w : Nat) :
  union_dS_wt C₁ w ⊆ union_dS_wt C₂ w :=
by {
  intro x hx
  rw [mem_union_dS_wt] at hx ⊢
  exact ⟨union_dS_subset_of_subset _ _ H hx.1, hx.2⟩
}
lemma union_dS_wt_union
  (C₁ C₂ : Finset (List.Vector B n)) (w : Nat):
  union_dS_wt (C₁ ∪ C₂) w = union_dS_wt C₁ w ∪ union_dS_wt C₂ w :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    simp only [mem_union_dS_wt, union_dS_union, Finset.mem_union] at hx
    rcases hx with ⟨h_left | h_right, hw⟩
    · rw [Finset.mem_union]
      exact Or.inl ((mem_union_dS_wt C₁ w x).mpr ⟨h_left, hw⟩)
    · rw [Finset.mem_union]
      exact Or.inr ((mem_union_dS_wt C₂ w x).mpr ⟨h_right, hw⟩)
  · apply Finset.union_subset
    · exact union_dS_wt_subset_of_subset _ _ Finset.subset_union_left _
    · exact union_dS_wt_subset_of_subset _ _ Finset.subset_union_right _
}
def Cwr
  (C : Finset (List.Vector B n)) (w r : Nat) : Finset (List.Vector B n) :=
  filter (fun X => card (dS_wt X w) = r) C

lemma mem_Cwr (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n) :
  X ∈ Cwr C w r ↔ X ∈ C ∧ card (dS_wt X w) = r :=
by {
  unfold Cwr
  rw [Finset.mem_filter]
}
lemma not_mem_Cwr
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n) (Hx : X ∉ C) :
  X ∉ Cwr C w r :=
by {
  intro h
  rw [mem_Cwr] at h
  exact Hx h.1
}
lemma Cwr_empty (w r : Nat) :
  Cwr (∅ : Finset (List.Vector B n)) w r = ∅ :=
by {
  unfold Cwr
  exact Finset.filter_empty _
}
lemma Cwr_subset (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr C w r ⊆ C :=
by {
  intro x hx
  rw [mem_Cwr] at hx
  exact hx.1
}
lemma Cwr_subset_of_subset
  {C₁ C₂ : Finset (List.Vector B n)} (H : C₁ ⊆ C₂) (w r : Nat)  :
  Cwr C₁ w r ⊆ Cwr C₂ w r :=
by {
  intro x hx
  rw [mem_Cwr] at hx ⊢
  exact ⟨H hx.1, hx.2⟩
}
lemma DelCode_Cwr
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  is_DelCode (Cwr C w r) :=
by {
  exact DelCode_subset C (Cwr C w r) HC (Cwr_subset C w r)
}
lemma Cwr_insert_of_eq
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n)
  (H : card (dS_wt X w) = r) :
  Cwr (insert X C) w r = insert X (Cwr C w r) :=
by {
  unfold Cwr
  rw [Finset.filter_insert, if_pos H]
}
lemma Cwr_insert_of_neq
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n)
  (H : card (dS_wt X w) ≠ r)  :
  Cwr (insert X C) w r = Cwr C w r :=
by {
  unfold Cwr
  rw [Finset.filter_insert, if_neg H]
}
lemma Cwr_inter_of_ne (C : Finset (List.Vector B n)) (w r₁ r₂: ℕ) (Hr : r₁ ≠ r₂):
  Cwr C w r₁ ∩ Cwr C w r₂ = ∅  :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_inter, mem_Cwr, mem_Cwr] at hx
    have h : r₁ = r₂ := by rw [← hx.1.2, ← hx.2.2]
    contradiction
  · exact Finset.empty_subset _
}
lemma card_union_dS_wt_Cwr_zero (C : Finset (List.Vector B n)) (w : Nat) :
  card (union_dS_wt (Cwr C w 0) w) = 0 :=
by {
  induction C using Finset.induction_on with
  | empty =>
    rw [Cwr_empty, union_dS_wt_empty, Finset.card_empty]
  | insert s S hs ihS =>
    cases Classical.em (card (dS_wt s w) = 0) with
    | inl heq =>
      rw [Cwr_insert_of_eq S w 0 s heq]
      apply Nat.eq_zero_of_le_zero
      calc card (union_dS_wt (insert s (Cwr S w 0)) w)
        _ = card (dS_wt s w ∪ union_dS_wt (Cwr S w 0) w) := by rw [union_dS_wt_insert _ _ _ (not_mem_Cwr _ _ _ _ hs)]
        _ ≤ card (dS_wt s w) + card (union_dS_wt (Cwr S w 0) w) := Finset.card_union_le _ _
        _ = 0 + 0 := by rw [heq, ihS]
        _ = 0 := rfl
    | inr hneq =>
      rw [Cwr_insert_of_neq S w 0 s hneq]
      exact ihS
}
lemma card_union_dS_wt_Cwr (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  card (union_dS_wt (Cwr C w r) w) = r * card (Cwr C w r) :=
by {
  induction C using Finset.induction_on with
  | empty =>
    rw [Cwr_empty, union_dS_wt_empty, Finset.card_empty, Finset.card_empty, Nat.mul_zero]
  | insert s S hs ihS =>
    have HCS : is_DelCode S ∧ dS s ∩ union_dS S = ∅ := (DelCode_insert_iff' S s hs).mp HC
    have HCS_DelCode : is_DelCode S := HCS.1
    cases Classical.em (card (dS_wt s w) = r) with
    | inl heq =>
      rw [Cwr_insert_of_eq S w r s heq]
      rw [union_dS_wt_insert _ _ _ (not_mem_Cwr _ _ _ _ hs)]
      rw [Finset.card_union_of_disjoint]
      · rw [heq, ihS HCS_DelCode]
        rw [Finset.card_insert_of_notMem (not_mem_Cwr _ _ _ _ hs)]
        rw [Nat.mul_add, Nat.mul_one, Nat.add_comm]
      · rw [Finset.disjoint_iff_inter_eq_empty]
        apply Finset.subset_empty.mp
        intro x hx
        rw [Finset.mem_inter] at hx
        have h1 : x ∈ dS s := dS_wt_subset _ _ hx.1
        have h2 : x ∈ union_dS S := by {
          have h2a := union_dS_wt_subset _ _ hx.2
          exact union_dS_subset_of_subset _ _ (Cwr_subset _ _ _) h2a
        }
        have h3 : x ∈ dS s ∩ union_dS S := by {
          rw [Finset.mem_inter]
          exact ⟨h1, h2⟩
        }
        rw [HCS.2] at h3
        exact h3
    | inr hneq =>
      rw [Cwr_insert_of_neq S w r s hneq]
      exact ihS HCS_DelCode
}
def mul_card_dS_wt (C : Finset (List.Vector B n)) (w r : Nat) :=
  r * (card (Cwr C w r))

lemma mul_card_dS_wt_empty (w r : Nat) :
  mul_card_dS_wt (∅ : Finset (List.Vector B n)) w r = 0 :=
by {
  unfold mul_card_dS_wt
  rw [Cwr_empty, Finset.card_empty, Nat.mul_zero]
}
lemma mul_card_dS_wt_zero (C : Finset (List.Vector B n)) (w : Nat):
  mul_card_dS_wt C w 0 = 0 :=
by {
  unfold mul_card_dS_wt
  rw [Nat.zero_mul]
}
lemma mul_card_dS_wt_eq (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  mul_card_dS_wt C w r = card (union_dS_wt (Cwr C w r) w) :=
by {
  unfold mul_card_dS_wt
  rw [card_union_dS_wt_Cwr C HC w r]
}
def Cwr_le (C : Finset (List.Vector B n)) (w r : Nat) : Finset (List.Vector B n) :=
  filter (fun X => card (dS_wt X w) ≤ r) C

lemma mem_Cwr_le (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n) :
  X ∈ Cwr_le C w r ↔ X ∈ C ∧ card (dS_wt X w) ≤ r :=
by {
  unfold Cwr_le
  rw [Finset.mem_filter]
}
lemma not_mem_Cwr_le
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n) (HX : X ∉ C) :
  X ∉ Cwr_le C w r :=
by {
  intro h
  rw [mem_Cwr_le] at h
  exact HX h.1
}
lemma Cwr_le_empty (w r : Nat) :
  Cwr_le (∅ : Finset (List.Vector B n)) w r = ∅ :=
by {
  unfold Cwr_le
  exact Finset.filter_empty _
}
lemma Cwr_le_zero (C : Finset (List.Vector B n)) (w : Nat) :
  Cwr_le C w 0 = Cwr C w 0 :=
by {
  unfold Cwr_le Cwr
  apply Finset.filter_congr
  intro x _
  exact Nat.le_zero
}
lemma Cwr_le_subset (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_le C w r ⊆ C :=
by {
  intro x hx
  rw [mem_Cwr_le] at hx
  exact hx.1
}
lemma Cwr_subset_le (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr C w r ⊆ Cwr_le C w r :=
by {
  intro x hx
  rw [mem_Cwr] at hx
  rw [mem_Cwr_le]
  exact ⟨hx.1, Nat.le_of_eq hx.2⟩
}
lemma DelCode_Cwr_le
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  is_DelCode (Cwr_le C w r) :=
by {
  exact DelCode_subset C (Cwr_le C w r) HC (Cwr_le_subset C w r)
}
lemma Cwr_le_insert_of_le
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n)
  (H : card (dS_wt X w) ≤ r) :
  Cwr_le (insert X C) w r = insert X (Cwr_le C w r) :=
by {
  unfold Cwr_le
  rw [Finset.filter_insert, if_pos H]
}
lemma Cwr_le_insert_of_gt
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n)
  (H : r < card (dS_wt X w)) :
  Cwr_le (insert X C) w r = Cwr_le C w r :=
by {
  unfold Cwr_le
  have H_not_le : ¬ (card (dS_wt X w) ≤ r) := Nat.not_le_of_gt H
  rw [Finset.filter_insert, if_neg H_not_le]
}
lemma Cwr_le_succ (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_le C w (r + 1) = Cwr_le C w r ∪ Cwr C w (r + 1) :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [mem_Cwr_le] at hx
    cases Nat.lt_or_eq_of_le hx.2 with
    | inl h_lt =>
      rw [Finset.mem_union, mem_Cwr_le]
      exact Or.inl ⟨hx.1, Nat.le_of_lt_succ h_lt⟩
    | inr h_eq =>
      rw [Finset.mem_union, mem_Cwr]
      exact Or.inr ⟨hx.1, h_eq⟩
  · intro x hx
    rw [Finset.mem_union] at hx
    cases hx with
    | inl h_le =>
      rw [mem_Cwr_le] at h_le ⊢
      exact ⟨h_le.1, Nat.le_succ_of_le h_le.2⟩
    | inr h_eq =>
      rw [mem_Cwr] at h_eq
      rw [mem_Cwr_le]
      exact ⟨h_eq.1, Nat.le_of_eq h_eq.2⟩
}
lemma Cwr_le_inter_eq (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_le C w r ∩ Cwr C w (r + 1) = ∅ :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_inter, mem_Cwr_le, mem_Cwr] at hx
    have h1 : card (dS_wt x w) ≤ r := hx.1.2
    have h2 : card (dS_wt x w) = r + 1 := hx.2.2
    rw [h2] at h1
    exact False.elim (Nat.not_succ_le_self r h1)
  · exact Finset.empty_subset _
}
lemma card_Cwr_le_succ (C : Finset (List.Vector B n)) (w r : Nat) :
  card (Cwr_le C w (r + 1)) = card (Cwr_le C w r) + card (Cwr C w (r + 1)) :=
by {
  rw [Cwr_le_succ]
  rw [Finset.card_union_of_disjoint]
  rw [Finset.disjoint_iff_inter_eq_empty]
  exact Cwr_le_inter_eq C w r
}
lemma length_dS_le {α : Type} [DecidableEq α] (X : List.Vector α n) (k : Nat) : (dS_le X k).length = k + 1 := by {
  induction k with
  | zero => rfl
  | succ k ih => exact congrArg Nat.succ ih
}

lemma card_dS {n : Nat} (x : List.Vector B n) : card (dS x) ≤ n - 1 + 1 := by {
  unfold dS dS_list
  have h1 : (List.toFinset (dS_le x (n - 1))).card ≤ (dS_le x (n - 1)).length := List.toFinset_card_le _
  have h2 : (dS_le x (n - 1)).length = n - 1 + 1 := length_dS_le x (n - 1)
  rw [h2] at h1
  exact h1
}

lemma Cwr_le_length (C : Finset (List.Vector B n)) (w : Nat):
  Cwr_le C w (n - 1 + 1) = C := by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [mem_Cwr_le] at hx
    exact hx.1
  · intro x hx
    rw [mem_Cwr_le]
    exact ⟨hx, by {
      apply Nat.le_trans
      · exact Finset.card_le_card (dS_wt_subset _ _)
      · exact card_dS _
    }⟩
}
lemma card_union_dS_wt_Cwr_le_zero (C : Finset (List.Vector B n)) (w : Nat) :
  card (union_dS_wt (Cwr_le C w 0) w) = 0 :=
by {
  rw [Cwr_le_zero]
  exact card_union_dS_wt_Cwr_zero C w
}
def mul_card_dS_wt_le : Finset (List.Vector B n) → ℕ → ℕ → ℕ
| C, w, 0       => mul_card_dS_wt C w 0
| C, w, k + 1 => mul_card_dS_wt C w (k + 1) + mul_card_dS_wt_le C w k

lemma mul_card_dS_wt_le_empty (w r : Nat) :
  mul_card_dS_wt_le (∅ : Finset (List.Vector B n)) w r = 0 :=
by {
  induction r with
  | zero =>
    unfold mul_card_dS_wt_le
    rw [mul_card_dS_wt_empty]
  | succ r ihr =>
    unfold mul_card_dS_wt_le
    rw [mul_card_dS_wt_empty, Nat.zero_add, ihr]
}
lemma mul_card_dS_wt_le_zero (C : Finset (List.Vector B n)) (w : Nat):
  mul_card_dS_wt_le C w 0 = 0 :=
by {
  unfold mul_card_dS_wt_le
  rw [mul_card_dS_wt_zero]
}
lemma mul_card_dS_wt_le_insert_of_gt
  (C : Finset (List.Vector B n)) (w r : Nat)
  (x : List.Vector B n) (Hr : r < card (dS_wt x w)) :
  mul_card_dS_wt_le (insert x C) w r = mul_card_dS_wt_le C w r :=
by {
  induction r with
  | zero =>
    rw [mul_card_dS_wt_le_zero, mul_card_dS_wt_le_zero]
  | succ r ihr =>
    unfold mul_card_dS_wt_le
    unfold mul_card_dS_wt
    rw [Cwr_insert_of_neq]
    · rw [ihr (Nat.lt_trans (Nat.lt_succ_self r) Hr)]
    · exact Nat.ne_of_gt Hr
}
lemma mul_card_dS_wt_le_insert_of_le
  (C : Finset (List.Vector B n)) (w r : Nat)
  (x : List.Vector B n) (Hx : x ∉ C) (Hr : card (dS_wt x w) ≤ r) :
  mul_card_dS_wt_le (insert x C) w r
  = mul_card_dS_wt_le C w r + card (dS_wt x w) :=
by {
  induction r with
  | zero =>
    rw [mul_card_dS_wt_le_zero, mul_card_dS_wt_le_zero]
    rw [Nat.eq_zero_of_le_zero Hr]
  | succ r ihr =>
    unfold mul_card_dS_wt_le
    unfold mul_card_dS_wt
    cases Nat.eq_or_lt_of_le Hr with
    | inl heq =>
      rw [Cwr_insert_of_eq C w (r + 1) x heq]
      rw [Finset.card_insert_of_notMem]
      · rw [Nat.mul_succ, Nat.add_right_comm]
        rw [mul_card_dS_wt_le_insert_of_gt]
        · rw [heq]
        · rw [heq]
          exact Nat.lt_succ_self _
      · exact not_mem_Cwr C w (r + 1) x Hx
    | inr hlt =>
      rw [Cwr_insert_of_neq]
      · rw [ihr (Nat.le_of_lt_succ hlt), Nat.add_assoc]
      · exact Nat.ne_of_lt hlt
}
lemma mul_card_dS_wt_le_eq
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  mul_card_dS_wt_le C w r = card (union_dS_wt (Cwr_le C w r) w) :=
by {
  induction r with
  | zero =>
    rw [mul_card_dS_wt_le_zero]
    rw [card_union_dS_wt_Cwr_le_zero C]
  | succ r ihr =>
    unfold mul_card_dS_wt_le
    rw [mul_card_dS_wt_eq _ HC, ihr]
    rw [Cwr_le_succ, union_dS_wt_union]
    have h_disj : Disjoint (union_dS_wt (Cwr_le C w r) w) (union_dS_wt (Cwr C w (r + 1)) w) := by {
      rw [Finset.disjoint_iff_inter_eq_empty]
      rw [← Finset.subset_empty]
      apply Finset.Subset.trans
      · apply Finset.inter_subset_inter
        · exact union_dS_wt_subset _ _
        · exact union_dS_wt_subset _ _
      · have h_inter := union_dS_inter_of_DelCode HC (Cwr_le_subset C w r) (Cwr_subset C w (r + 1)) (Cwr_le_inter_eq C w r)
        rw [h_inter]
    }
    rw [Finset.card_union_of_disjoint h_disj]
    rw [Nat.add_comm]
}
lemma mul_card_dS_wt_le_le
  (C : Finset (List.Vector B n)) (w r : Nat) :
  mul_card_dS_wt_le C w r ≤ mul_card_dS_wt_le C w (n - 1 + 1) :=
by {
  induction C using Finset.induction with
  | empty =>
    rw [mul_card_dS_wt_le_empty]
    exact Nat.zero_le _
  | insert c C hc ihC =>
    by_cases hge : card (dS_wt c w) ≤ r
    · rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ hc hge]
      rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ hc]
      · exact Nat.add_le_add_right ihC _
      · apply Nat.le_trans
        · exact Finset.card_le_card (dS_wt_subset _ _)
        · exact card_dS _
    · rw [mul_card_dS_wt_le_insert_of_gt _ _ _ _ (Nat.lt_of_not_ge hge)]
      rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ hc]
      · exact Nat.le_trans ihC (Nat.le_add_right _ _)
      · apply Nat.le_trans
        · exact Finset.card_le_card (dS_wt_subset _ _)
        · exact card_dS _
}

lemma mul_card_dS_wt_le_length
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  mul_card_dS_wt_le C w (n - 1 + 1) = card (union_dS_wt C w) :=
by {
  rw [mul_card_dS_wt_le_eq C HC]
  rw [Cwr_le_length]
}

lemma mul_card_dS_wt_le_card_univ
  {n : Nat} (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  mul_card_dS_wt_le C w r ≤ card (filter (fun x : List.Vector B (n - 1) => wt x = w) univ) :=
by {
  rw [mul_card_dS_wt_le_eq C HC]
  apply Finset.card_le_card
  unfold union_dS_wt
  intro x hx
  rw [Finset.mem_filter] at hx ⊢
  exact ⟨Finset.mem_univ _, hx.2⟩
}

lemma mul_card_dS_wt_le_card_univ'
  {n : Nat} (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w : Nat) :
  mul_card_dS_wt_le C w n ≤ card (filter (fun x : List.Vector B (n - 1) => wt x = w) univ) :=
by {
  apply mul_card_dS_wt_le_card_univ _ HC
}
def Cwr_ge (C : Finset (List.Vector B n)) (w r : Nat) : Finset (List.Vector B n) :=
  filter (fun X => r ≤ card (dS_wt X w)) C

lemma mem_Cwr_ge (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n) :
  X ∈ Cwr_ge C w r ↔ X ∈ C ∧ r ≤ card (dS_wt X w) :=
by {
  unfold Cwr_ge
  rw [Finset.mem_filter]
}
lemma Cwr_ge_empty (w r : Nat) :
  Cwr_ge (∅ : Finset (List.Vector B n)) w r = ∅ :=
by {
  unfold Cwr_ge
  exact Finset.filter_empty _
}
lemma Cwr_ge_insert_of_ge
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n)
  (H : r ≤ card (dS_wt X w)) :
  Cwr_ge (insert X C) w r = insert X (Cwr_ge C w r) :=
by {
  unfold Cwr_ge
  rw [Finset.filter_insert, if_pos H]
}
lemma Cwr_ge_insert_of_lt
  (C : Finset (List.Vector B n)) (w r : Nat) (X : List.Vector B n)
  (H : card (dS_wt X w) < r) :
  Cwr_ge (insert X C) w r = Cwr_ge C w r :=
by {
  unfold Cwr_ge
  have H_not_le : ¬ (r ≤ card (dS_wt X w)) := Nat.not_le_of_gt H
  rw [Finset.filter_insert, if_neg H_not_le]
}
lemma Cwr_ge_subset
  (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_ge C w r ⊆ C :=
by {
  intro x hx
  rw [mem_Cwr_ge] at hx
  exact hx.1
}
lemma Cwr_ge_subset_of_subset
  {C₁ C₂ : Finset (List.Vector B n)} (H : C₁ ⊆ C₂) (w r : Nat)  :
  Cwr_ge C₁ w r ⊆ Cwr_ge C₂ w r :=
by {
  intro x hx
  rw [mem_Cwr_ge] at hx ⊢
  exact ⟨H hx.1, hx.2⟩
}
lemma Cwr_ge_zero (C : Finset (List.Vector B n)) (w : Nat) :
  Cwr_ge C w 0 = C :=
by {
  apply Finset.Subset.antisymm
  · exact Cwr_ge_subset _ _ _
  · intro x hx
    rw [mem_Cwr_ge]
    exact ⟨hx, Nat.zero_le _⟩
}
lemma DelCode_Cwr_ge
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (w r : Nat) :
  is_DelCode (Cwr_ge C w r) :=
by {
  exact DelCode_subset _ _ HC (Cwr_ge_subset _ _ _)
}
lemma Cwr_ge_eq
  (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_ge C w r = Cwr C w r ∪ Cwr_ge C w (r + 1) :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [mem_Cwr_ge] at hx
    rw [Finset.mem_union]
    cases Nat.eq_or_lt_of_le hx.2 with
    | inl heq =>
      rw [mem_Cwr]
      exact Or.inl ⟨hx.1, heq.symm⟩
    | inr hlt =>
      rw [mem_Cwr_ge]
      exact Or.inr ⟨hx.1, Nat.succ_le_of_lt hlt⟩
  · intro x hx
    rw [Finset.mem_union] at hx
    cases hx with
    | inl heq =>
      rw [mem_Cwr] at heq
      rw [mem_Cwr_ge]
      exact ⟨heq.1, Nat.le_of_eq heq.2.symm⟩
    | inr hle =>
      rw [mem_Cwr_ge] at hle
      rw [mem_Cwr_ge]
      exact ⟨hle.1, Nat.le_of_succ_le hle.2⟩
}
lemma Cwr_subset_ge
  (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr C w r ⊆ Cwr_ge C w r :=
by {
  rw [Cwr_ge_eq]
  exact Finset.subset_union_left
}
lemma Cwr_le_union_ge (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_le C w r ∪ Cwr_ge C w (r + 1) = C :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_union] at hx
    cases hx with
    | inl hl => exact Cwr_le_subset _ _ _ hl
    | inr hr => exact Cwr_ge_subset _ _ _ hr
  · intro x hx
    cases Classical.em (card (dS_wt x w) ≤ r) with
    | inl hle =>
      rw [Finset.mem_union, mem_Cwr_le]
      exact Or.inl ⟨hx, hle⟩
    | inr hnle =>
      rw [Finset.mem_union, mem_Cwr_ge]
      exact Or.inr ⟨hx, Nat.succ_le_of_lt (Nat.lt_of_not_ge hnle)⟩
}
lemma Cwr_le_inter_ge (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_le C w r ∩ Cwr_ge C w (r + 1) = ∅ :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_inter, mem_Cwr_le, mem_Cwr_ge] at hx
    have h1 := hx.1.2
    have h2 := hx.2.2
    have h3 := Nat.lt_of_succ_le h2
    exact False.elim (Nat.not_le_of_gt h3 h1)
  · exact Finset.empty_subset _
}
lemma Cwr_ge_succ_eq_sdiff_le (C : Finset (List.Vector B n)) (w r : Nat) :
  Cwr_ge C w (r + 1) = C \ Cwr_le C w r :=
by {
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_sdiff]
    have h_sub := Cwr_ge_subset C w (r + 1) hx
    refine ⟨h_sub, ?_⟩
    intro hl
    have h_inter : x ∈ Cwr_le C w r ∩ Cwr_ge C w (r + 1) := Finset.mem_inter.mpr ⟨hl, hx⟩
    have h_emp : x ∈ (∅ : Finset (List.Vector B n)) := by { rw [← Cwr_le_inter_ge C w r]; exact h_inter }
    exact Finset.notMem_empty _ h_emp
  · intro x hx
    rw [Finset.mem_sdiff] at hx
    have h_union : x ∈ Cwr_le C w r ∪ Cwr_ge C w (r + 1) := by { rw [Cwr_le_union_ge C w r]; exact hx.1 }
    rw [Finset.mem_union] at h_union
    cases h_union with
    | inl hl => exact False.elim (hx.2 hl)
    | inr hr => exact hr
}
lemma card_Cwr_le_add_ge (C : Finset (List.Vector B n)) (w r : Nat) :
  card (Cwr_le C w r) + card (Cwr_ge C w (r + 1)) = card C :=
by {
  have h_disj : Disjoint (Cwr_le C w r) (Cwr_ge C w (r + 1)) := by {
    rw [Finset.disjoint_iff_inter_eq_empty]
    exact Cwr_le_inter_ge C w r
  }
  have h := Finset.card_union_of_disjoint h_disj
  rw [Cwr_le_union_ge] at h
  exact h.symm
}
def mul_card_dS_wt_ge (C : Finset (List.Vector B n)) (w r : Nat) : Nat :=
  mul_card_dS_wt_le C w (n - 1 + 1) - mul_card_dS_wt_le C w (r - 1)

lemma mul_card_dS_wt_ge_empty (w r : Nat) :
  mul_card_dS_wt_ge (∅ : Finset (List.Vector B n)) w r = 0 :=
by {
  unfold mul_card_dS_wt_ge
  rw [mul_card_dS_wt_le_empty, mul_card_dS_wt_le_empty, Nat.sub_zero]
}
lemma mul_card_dS_wt_ge_zero (C : Finset (List.Vector B n)) (w : Nat) :
  mul_card_dS_wt_ge C w 0 = mul_card_dS_wt_le C w (n - 1 + 1) :=
by {
  unfold mul_card_dS_wt_ge
  rw [mul_card_dS_wt_le_zero, Nat.sub_zero]
}
lemma mul_card_dS_wt_ge_insert_of_lt
  (C : Finset (List.Vector B n)) (w r : Nat)
  (x : List.Vector B n) (Hr : card (dS_wt x w) < r) :
  mul_card_dS_wt_ge (insert x C) w r = mul_card_dS_wt_ge C w r :=
by {
  cases Classical.em (x ∈ C) with
  | inl hin => rw [Finset.insert_eq_of_mem hin]
  | inr hnin =>
    unfold mul_card_dS_wt_ge
    rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ hnin]
    · rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ hnin]
      · rw [Nat.add_sub_add_right]
      · apply Nat.le_of_lt_succ
        apply Nat.lt_of_lt_of_le Hr
        cases r with
        | zero => apply Nat.zero_le
        | succ r => exact Nat.le_refl _
    · apply Nat.le_trans
      · exact Finset.card_le_card (dS_wt_subset _ _)
      · exact card_dS _
}

lemma mul_card_dS_wt_ge_insert_of_ge
  (C : Finset (List.Vector B n)) (w r : Nat)
  (x : List.Vector B n) (Hx : x ∉ C) (Hr : r ≤ card (dS_wt x w)) :
  mul_card_dS_wt_ge (insert x C) w r
  = mul_card_dS_wt_ge C w r + card (dS_wt x w)  :=
by {
  cases r with
  | zero =>
    rw [mul_card_dS_wt_ge_zero, mul_card_dS_wt_ge_zero]
    rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ Hx]
    apply Nat.le_trans
    · exact Finset.card_le_card (dS_wt_subset _ _)
    · exact card_dS _
  | succ r =>
    unfold mul_card_dS_wt_ge
    rw [mul_card_dS_wt_le_insert_of_le _ _ _ _ Hx]
    · rw [Nat.succ_sub_one]
      rw [mul_card_dS_wt_le_insert_of_gt _ _ _ _ (Nat.lt_of_succ_le Hr)]
      rw [Nat.add_comm (mul_card_dS_wt_le C w _), Nat.add_sub_assoc]
      · rw [Nat.add_comm]
      · apply mul_card_dS_wt_le_le
    · apply Nat.le_trans
      · exact Finset.card_le_card (dS_wt_subset _ _)
      · exact card_dS _
}

lemma card_dS_wt_ge_le (C : Finset (List.Vector B n)) (w r : Nat) :
  r * card (Cwr_ge C w r) ≤ mul_card_dS_wt_ge C w r :=
by {
  induction C using Finset.induction with
  | empty =>
    rw [Cwr_ge_empty, Finset.card_empty, mul_zero]
    exact Nat.zero_le _
  | insert c C hc ihC =>
    cases Classical.em (r ≤ card (dS_wt c w)) with
    | inl hle =>
      rw [Cwr_ge_insert_of_ge _ _ _ _ hle]
      rw [Finset.card_insert_of_notMem]
      · rw [Nat.mul_succ, mul_card_dS_wt_ge_insert_of_ge _ _ _ _ hc hle]
        exact Nat.add_le_add ihC hle
      · unfold Cwr_ge
        exact mt (fun h_mem => (Finset.mem_filter.mp h_mem).1) hc
    | inr hnle =>
      rw [Cwr_ge_insert_of_lt _ _ _ _ (Nat.lt_of_not_ge hnle)]
      rw [mul_card_dS_wt_ge_insert_of_lt _ _ _ _ (Nat.lt_of_not_ge hnle)]
      exact ihC
}

lemma card_dS_wt_ge_le_univ
  (C : Finset (List.Vector B n)) (H : is_DelCode C) (w r : Nat) :
  card (Cwr_ge C w (r + 1))
  ≤ (card (Finset.filter (fun x : List.Vector B (n - 1) => wt x = w) Finset.univ)
    - mul_card_dS_wt_le C w r) / (r + 1) :=
by {
  rw [Nat.le_div_iff_mul_le (Nat.zero_lt_succ r)]
  rw [Nat.mul_comm]
  apply Nat.le_trans
  · exact card_dS_wt_ge_le C w (r + 1)
  · apply Nat.le_sub_of_add_le
    unfold mul_card_dS_wt_ge
    rw [Nat.succ_sub_one]
    have h_sub_add : mul_card_dS_wt_le C w (n - 1 + 1) - mul_card_dS_wt_le C w r + mul_card_dS_wt_le C w r = mul_card_dS_wt_le C w (n - 1 + 1) := by {
      apply Nat.sub_add_cancel
      exact mul_card_dS_wt_le_le C w r
    }
    rw [h_sub_add]
    exact mul_card_dS_wt_le_card_univ _ H _ _
}

lemma card_Cwr_le_1
  (C : Finset (List.Vector B n)) (w : Nat):
  card (Cwr_le C w 1) = card (Cwr C w 0) + card (Cwr C w 1) :=
by {
  have h1 : card (Cwr_le C w 1) = card (Cwr_le C w 0) + card (Cwr C w 1) := card_Cwr_le_succ C w 0
  rw [h1, Cwr_le_zero]
}

lemma card_Cwr_le_2
  (C : Finset (List.Vector B n)) (w : Nat):
  card (Cwr_le C w 2) = card (Cwr C w 0) + card (Cwr C w 1) + card (Cwr C w 2):=
by {
  have h1 : card (Cwr_le C w 2) = card (Cwr_le C w 1) + card (Cwr C w 2) := card_Cwr_le_succ C w 1
  have h2 : card (Cwr_le C w 1) = card (Cwr_le C w 0) + card (Cwr C w 1) := card_Cwr_le_succ C w 0
  rw [h1, h2, Cwr_le_zero, Nat.add_assoc]
}

lemma mul_card_dS_wt_le_1
  (C : Finset (List.Vector B n)) (w : Nat):
  mul_card_dS_wt_le C w 1 = card (Cwr C w 1) :=
by {
  unfold mul_card_dS_wt_le
  rw [mul_card_dS_wt_le_zero]
  unfold mul_card_dS_wt
  rw [Nat.add_zero, Nat.one_mul]
}
lemma mul_card_dS_wt_le_2
  (C : Finset (List.Vector B n)) (w : Nat):
  mul_card_dS_wt_le C w 2 = 2 * card (Cwr C w 2) + card (Cwr C w 1) :=
by {
  unfold mul_card_dS_wt_le
  rw [mul_card_dS_wt_le_1, mul_card_dS_wt]
}

lemma card_le_univ_add_1
  {n : Nat} (C : Finset (List.Vector B n)) (HC : is_DelCode C)
  (w : Nat) (HCw : Cwr C w 0 = ∅) :
  card C ≤ (card (Finset.filter (fun x : List.Vector B (n - 1) => wt x = w) Finset.univ) + card (Cwr C w 1)) / 2 :=
by {
  rw [Nat.le_div_iff_mul_le (Nat.zero_lt_succ 1)]
  rw [← card_Cwr_le_add_ge C w 1]
  rw [card_Cwr_le_1, HCw, Finset.card_empty, Nat.zero_add]
  apply Nat.le_add_of_sub_le
  rw [Nat.add_mul, Nat.add_comm, Nat.mul_two (card (Cwr C w 1))]
  rw [← Nat.add_assoc, Nat.add_sub_cancel]
  apply Nat.le_trans
  · apply Nat.add_le_add_right
    rw [← Nat.le_div_iff_mul_le (Nat.zero_lt_succ 1)]
    apply card_dS_wt_ge_le_univ C HC
  · rw [← mul_card_dS_wt_le_1]
    rw [Nat.sub_add_cancel]
    apply mul_card_dS_wt_le_card_univ C HC
}

lemma card_le_univ_add_2
  {n : Nat} (C : Finset (List.Vector B n)) (HC : is_DelCode C)
  (w : Nat) (HCw : Cwr C w 0 = ∅) :
  card C ≤ (card (Finset.filter (fun x : List.Vector B (n - 1) => wt x = w) Finset.univ) + 2 * card (Cwr C w 1) + card (Cwr C w 2)) / 3 :=
by {
  -- First, we convert the division inequality into a multiplication inequality.
  rw [Nat.le_div_iff_mul_le (by exact Nat.zero_lt_succ 2)]
  -- We split the cardinality of C into elements with weight <= 2 and >= 3.
  have h_C := card_Cwr_le_add_ge C w 2
  -- We substitute this split back into our main inequality.
  rw [← h_C]
  -- We distribute the multiplication over the addition.
  rw [Nat.add_mul]
  -- We establish an algebraic identity for multiplying by 3.
  have h3 : card (Cwr_le C w 2) * 3 = card (Cwr_le C w 2) * 2 + card (Cwr_le C w 2) := by {
    -- We rely on the linear arithmetic solver to prove this simple identity.
    linarith
  }
  -- We apply this identity to the first term in our sum.
  rw [h3]
  -- We recall the formula for elements of weight <= 2.
  have h_le2 := card_Cwr_le_2 C w
  -- We know that there are no elements of weight 0, so we cancel that term out.
  rw [HCw, Finset.card_empty, Nat.zero_add] at h_le2
  -- We substitute this simplified formula into our main inequality.
  rw [h_le2]
  -- We rearrange the terms on the left hand side.
  -- Notice that we expand the multiplication and group terms manually.
  have h_alg : (card (Cwr C w 1) + card (Cwr C w 2)) * 2 + (card (Cwr C w 1) + card (Cwr C w 2)) + card (Cwr_ge C w 3) * 3
      = card (Cwr_ge C w 3) * 3 + card (Cwr C w 1) * 3 + card (Cwr C w 2) * 3 := by {
    -- We rely on the linear arithmetic solver to prove this simple identity.
    linarith
  }
  -- Apply our algebraic rearrangement to the goal.
  rw [h_alg]
  -- Now we bring in the universal bound for elements of weight >= 3.
  have h_univ := card_dS_wt_ge_le_univ C HC w 2
  -- Convert the division inequality to a multiplication inequality.
  rw [Nat.le_div_iff_mul_le (by exact Nat.zero_lt_succ 2)] at h_univ
  -- We recall the formula for mul_card_dS_wt_le at r=2.
  have h_mul_le := mul_card_dS_wt_le_2 C w
  -- We recall the universal bound for mul_card_dS_wt_le.
  have h_le_card_univ := mul_card_dS_wt_le_card_univ C HC w 2
  -- We apply transitivity to link our current sum with the universal bounds.
  apply Nat.le_trans
  -- On the left branch, we add our Cwr 1 and Cwr 2 terms to the h_univ bound.
  · apply Nat.add_le_add_right
    -- We add the second term.
    apply Nat.add_le_add_right
    -- We apply the h_univ inequality directly.
    exact h_univ
  -- On the right branch, we must show that the bound matches our target right-hand side.
  · rw [h_mul_le]
    -- We establish that the total cardinality is greater than the parts we are subtracting.
    have h_U_ge : 2 * card (Cwr C w 2) + card (Cwr C w 1) ≤ card (Finset.filter (fun x => wt x = w) Finset.univ) := by {
      -- Substitute our formula for r=2 back in.
      rw [← h_mul_le]
      -- Apply the universal bound.
      exact mul_card_dS_wt_le_card_univ C HC w 2
    }
    -- We cancel out the subtracted term by adding it back.
    have h_sub_add1 : card (Finset.filter (fun x => wt x = w) Finset.univ) - (2 * card (Cwr C w 2) + card (Cwr C w 1)) + (2 * card (Cwr C w 2) + card (Cwr C w 1)) = card (Finset.filter (fun x => wt x = w) Finset.univ) := Nat.sub_add_cancel h_U_ge
    -- We formulate an exact equality for the remaining arithmetic.
    have h_eq : card (Finset.filter (fun x => wt x = w) Finset.univ) - (2 * card (Cwr C w 2) + card (Cwr C w 1)) + card (Cwr C w 1) * 3 + card (Cwr C w 2) * 3 = card (Finset.filter (fun x => wt x = w) Finset.univ) + 2 * card (Cwr C w 1) + card (Cwr C w 2) := by {
      -- We rely on the linear arithmetic solver to prove this simple identity.
      linarith
    }
    -- Complete the proof using our exact equality.
    exact Nat.le_of_eq h_eq
}

end B

variable [Fintype α]
variable (S : Finset (List.Vector α n))

noncomputable def DCs (n :  Nat) : Finset (Finset (List.Vector α n)) :=
  filter is_DelCode (powerset univ)

lemma mem_DCs :
  C ∈ @DCs α _ _ n ↔ is_DelCode C :=
by {
  -- Unfold the definition of DCs.
  unfold DCs
  -- Apply the membership rule for filter.
  rw [Finset.mem_filter]
  -- Apply the membership rule for powerset.
  rw [Finset.mem_powerset]
  -- Prove both directions of the iff.
  apply Iff.intro
  -- Forward direction: extract the right side of the AND.
  · intro h; exact h.right
  -- Backward direction: Any set is a subset of the universal set.
  · intro h; apply And.intro (Finset.subset_univ C) h
}
noncomputable def DCs' (n : Nat) : Finset (Finset (List.Vector α n)) :=
  filter is_DelCode' (powerset univ)

lemma DCs'_eq :
  @DCs' α _ _ n = @DCs α _ _ n :=
by {
  -- Unfold both definitions.
  unfold DCs
  unfold DCs'
  -- Apply Finset extensionality.
  ext x
  -- Rewrite filter membership.
  rw [Finset.mem_filter, Finset.mem_filter]
  -- Use the equivalence of the predicates.
  rw [DelCode'_iff]
}
noncomputable def DCs_sub (S : Finset (List.Vector α n)) : Finset (Finset (List.Vector α n)) :=
  filter is_DelCode (powerset S)

lemma mem_DCs_sub :
  C ∈ DCs_sub S ↔ C ⊆ S ∧ is_DelCode C :=
by {
  -- Unfold the definition.
  unfold DCs_sub
  -- Apply filter membership rule.
  rw [Finset.mem_filter]
  -- Apply powerset membership rule.
  rw [Finset.mem_powerset]
}
lemma DCs_sub_empty :
  @DCs_sub α _ n _ ∅ = {∅} :=
by {
  -- We prove equality of Finsets by extensionality.
  ext C
  -- We prove both directions.
  apply Iff.intro
  -- Forward direction: If C is in DCs_sub ∅, then C = ∅.
  · intro h
    -- Expand membership.
    rw [mem_DCs_sub] at h
    -- Expand singleton membership.
    rw [Finset.mem_singleton]
    -- The subset condition forces C to be empty.
    have h1 := h.left
    rw [Finset.subset_empty] at h1
    exact h1
  -- Backward direction: ∅ is in DCs_sub ∅.
  · intro h
    -- Expand singleton membership.
    rw [Finset.mem_singleton] at h
    -- Substitute C = ∅.
    rw [h]
    -- Expand membership.
    rw [mem_DCs_sub]
    -- Prove both the subset and the property.
    apply And.intro (Finset.Subset.refl _) DelCode_empty
}
lemma DCs_sub_univ :
  @DCs_sub α _ _ _ univ = DCs n :=
by {
  -- This is true by definition.
  rfl
}
lemma DCs_sub_subset
  {S₁ S₂ : Finset (List.Vector α n)} (HS : S₁ ⊆ S₂) :
  DCs_sub S₁ ⊆ DCs_sub S₂ :=
by {
  -- We start with an arbitrary subset C in the first filter.
  intro C hC
  -- Expand the definition for the first.
  rw [mem_DCs_sub] at hC
  -- Expand the definition for the second.
  rw [mem_DCs_sub]
  -- Use transitivity for the subset, and keep the property.
  apply And.intro (Finset.Subset.trans hC.left HS) hC.right
}
def DCs_sub' (S : Finset (List.Vector α n)) : Finset (Finset (List.Vector α n)) :=
  filter is_DelCode' (powerset S)

lemma DCs_sub'_eq :
  DCs_sub' S = DCs_sub S :=
by {
  -- Unfold the definitions.
  unfold DCs_sub' DCs_sub
  -- Prove by extensionality.
  ext C
  -- Expand filter membership.
  rw [Finset.mem_filter, Finset.mem_filter]
  -- The predicates are equivalent.
  rw [DelCode'_iff]
}
noncomputable def DCs_sub_len (S : Finset (List.Vector α n)) (k : Nat) : Finset (Finset (List.Vector α n)) :=
  filter is_DelCode (powersetCard k S)

lemma mem_DCs_sub_len (k : Nat) :
  C ∈ DCs_sub_len S k ↔ C ⊆ S ∧ card C = k ∧ is_DelCode C :=
by {
  -- Unfold the definition.
  unfold DCs_sub_len
  -- Rewrite filter membership.
  rw [Finset.mem_filter]
  -- Rewrite powersetCard membership.
  rw [Finset.mem_powersetCard]
  -- The order of ANDs needs adjusting.
  rw [and_assoc]
}
lemma mem_DCs_sub_len' (S : Finset (List.Vector α n)) (k : Nat) :
  C ∈ DCs_sub_len S k ↔ C ∈ DCs_sub S ∧ card C = k :=
by {
  -- We expand the length-constrained version.
  rw [mem_DCs_sub_len]
  -- We expand the unconstrained version.
  rw [mem_DCs_sub]
  -- Reassociate the AND.
  rw [_root_.and_right_comm]
  -- Reassociate the AND again.
  rw [and_assoc]
}
def DCs_sub_len' (S : Finset (List.Vector α n)) (k : Nat) : Finset (Finset (List.Vector α n)) :=
  filter is_DelCode' (powersetCard k S)

lemma DCs_sub_len'_eq (S : Finset (List.Vector α n)) (k : Nat) :
  DCs_sub_len' S k = DCs_sub_len S k :=
by {
  -- Unfold the definitions.
  unfold DCs_sub_len' DCs_sub_len
  -- We use Finset extensionality.
  ext C
  -- Expand filter membership.
  rw [Finset.mem_filter, Finset.mem_filter]
  -- The predicates are equivalent.
  rw [DelCode'_iff]
}
namespace B

def DCs_sub_DC_len_succ
  (S : Finset (List.Vector B n)) (C : Finset (List.Vector B n)) : Finset (Finset (List.Vector B n)) :=
  image (fun x => insert x C) (S \ union_dB C)

lemma mem_DCs_sub_DC_len_succ
  (S : Finset (List.Vector B n)) (C : Finset (List.Vector B n)) (C' : Finset (List.Vector B n)) :
  C' ∈ DCs_sub_DC_len_succ S C ↔ ∃ c ∈ S \ union_dB C, insert c C = C' :=
by {
  -- Unfold definition.
  unfold DCs_sub_DC_len_succ
  -- Use image membership.
  rw [Finset.mem_image]
}
def DCs_sub_DCs_len_succ
  (S : Finset (List.Vector B n)) (Cs : Finset (Finset (List.Vector B n))) : Finset (Finset (List.Vector B n)) :=
  Cs.biUnion (fun C => DCs_sub_DC_len_succ S C)

lemma mem_DCs_sub_DCs_len_succ
  (S : Finset (List.Vector B n)) (Cs : Finset (Finset (List.Vector B n))) (C' : Finset (List.Vector B n)) :
  C' ∈ DCs_sub_DCs_len_succ S Cs ↔ ∃ C ∈ Cs, C' ∈ DCs_sub_DC_len_succ S C :=
by {
  -- Unfold the definition.
  unfold DCs_sub_DCs_len_succ
  -- Finset biUnion membership gives exactly this existential.
  rw [Finset.mem_biUnion]
}
lemma mem_DCs_sub_DCs_len_succ'
  (S : Finset (List.Vector B n)) (Cs : Finset (Finset (List.Vector B n))) (C' : Finset (List.Vector B n)) :
  C' ∈ DCs_sub_DCs_len_succ S Cs ↔ ∃ C ∈ Cs, ∃ c ∈ S \ union_dB C, insert c C = C' :=
by {
  -- Start with the main membership equivalence.
  rw [mem_DCs_sub_DCs_len_succ]
  -- We can rewrite under the existential binder using congruence.
  apply exists_congr
  -- Introduce C.
  intro C
  -- We can rewrite under the AND binder.
  apply and_congr Iff.rfl
  -- Rewrite the inner membership.
  rw [mem_DCs_sub_DC_len_succ]
}
lemma DCs_sub_DCs_len_succ_eq
  (S : Finset (List.Vector B n)) (k : Nat) :
  DCs_sub_DCs_len_succ S (DCs_sub_len S k) = DCs_sub_len S (k + 1) :=
by {
  -- Prove equality by showing both inclusion directions.
  apply Finset.Subset.antisymm
  -- Left to right inclusion.
  · intro C hC
    -- Expand membership of the LHS.
    rw [mem_DCs_sub_DCs_len_succ'] at hC
    -- Destruct the existential quantifiers.
    rcases hC with ⟨C', hC', c, hc, hCC'c⟩
    -- Expand membership for the RHS.
    rw [mem_DCs_sub_len] at hC'
    -- Expand the set difference.
    rw [Finset.mem_sdiff] at hc
    -- We want to show the constructed set satisfies the constraints.
    rw [← hCC'c]
    -- Expand the membership constraint on the RHS.
    rw [mem_DCs_sub_len]
    -- We have to prove subset, cardinality, and property.
    apply And.intro
    -- 1. Subset
    · rw [Finset.insert_subset_iff]
      apply And.intro hc.left hC'.left
    -- 2. Cardinality and Property
    · apply And.intro
      -- Cardinality
      · rw [Finset.card_insert_of_notMem]
        -- The original cardinality is k.
        · rw [hC'.right.left]
        -- c is not in C' because it's not in the union of dB of C'.
        · exact not_mem_of_not_mem_dB C' c hc.right
      -- Property (DelCode)
      · rw [DelCode_insert_iff_not_mem_dB]
        -- It was a DelCode, and c is not in the union.
        · apply And.intro hC'.right.right hc.right
        -- Again, c is not in C'.
        · exact not_mem_of_not_mem_dB C' c hc.right
  -- Right to left inclusion.
  · intro C hC
    -- Expand membership for the RHS.
    rw [mem_DCs_sub_len] at hC
    -- We need to find an element c in C to remove.
    -- Since card C = k + 1 > 0, C is non-empty.
    have h_card_pos : 0 < card C := by {
      rw [hC.right.left]
      exact Nat.zero_lt_succ k
    }
    -- Get an element from the non-empty set.
    rcases Finset.card_pos.mp h_card_pos with ⟨c, hc⟩
    -- Now show it belongs to the LHS.
    rw [mem_DCs_sub_DCs_len_succ']
    -- We propose removing c from C.
    apply Exists.intro (erase C c)
    -- Prove that the erased set works.
    apply And.intro
    -- The erased set is in DCs_sub_len S k.
    · rw [mem_DCs_sub_len]
      apply And.intro
      -- Subset condition
      · exact Finset.Subset.trans (Finset.erase_subset c C) hC.left
      -- Cardinality and DelCode property
      · apply And.intro
        -- Cardinality
        · rw [Finset.card_erase_of_mem hc]
          rw [hC.right.left]
          rfl
        -- DelCode property
        · exact DelCode_erase C c hC.right.right
    -- The removed element c satisfies the conditions.
    · apply Exists.intro c
      apply And.intro
      -- c is in S \ union_dB (erase C c)
      · rw [Finset.mem_sdiff]
        apply And.intro
        -- c is in S
        · exact hC.left hc
        -- c is not in union_dB (erase C c)
        · exact not_mem_union_dB_erase hC.right.right c hc
      -- Re-inserting c gives C
      · exact Finset.insert_erase hc
}
end B
