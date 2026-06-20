/- Copyright Manabu Hagiwara 2022, 2026 -/
import VTlean.DelCode

open Nat List.Vector Finset

variable {α : Type} [DecidableEq α] [Fintype α]
variable {n : Nat} (S S₁ S₂ C : Finset (List.Vector α n))

def is_optimal {n : Nat} (C : Finset (List.Vector α n)) (HC : is_DelCode C) : Prop :=
  ∀ C' : Finset (List.Vector α n), is_DelCode C' → Finset.card C' ≤ Finset.card C

def is_optimal' (C : Finset (List.Vector α n)) (HC : is_DelCode C) : Prop :=
  ∀ C' : Finset (List.Vector α n), is_DelCode' C' → Finset.card C' ≤ Finset.card C

noncomputable instance Decidableis_optimal (HC : is_DelCode C) :
  Decidable (is_optimal C HC) := by unfold is_optimal; infer_instance
noncomputable instance Decidableis_optimal' (HC : is_DelCode C) :
  Decidable (is_optimal' C HC) := by unfold is_optimal'; infer_instance
lemma optimal'_iff (HC : is_DelCode C) :
  is_optimal' C HC ↔ is_optimal C HC := by
  unfold is_optimal' is_optimal
  apply Iff.intro
  · intro h C' hC'; rw [← DelCode'_iff] at hC'; exact h C' hC'
  · intro h C' hC'; rw [DelCode'_iff] at hC'; exact h C' hC'
def is_optimal_sub (HC : is_DelCode C) : Prop :=
  ∀ C' ⊆ S, is_DelCode C' → Finset.card C' ≤ Finset.card C

def is_optimal_sub' (HC : is_DelCode C) : Prop :=
  ∀ C' ⊆ S, is_DelCode' C' → Finset.card C' ≤ Finset.card C

noncomputable instance Decidableis_optimal_sub (HC : is_DelCode C) :
  Decidable (is_optimal_sub S C HC) := by unfold is_optimal_sub; infer_instance
noncomputable instance Decidableis_optimal_sub' (HC : is_DelCode C) :
  Decidable (is_optimal_sub' S C HC) := by unfold is_optimal_sub'; infer_instance
lemma optimal_sub'_iff (HC : is_DelCode C) :
  is_optimal_sub' S C HC ↔ is_optimal_sub S C HC := by
  unfold is_optimal_sub' is_optimal_sub
  apply Iff.intro
  · intro h C' hS hC'; rw [← DelCode'_iff] at hC'; exact h C' hS hC'
  · intro h C' hS hC'; rw [DelCode'_iff] at hC'; exact h C' hS hC'
lemma is_optimal_sub_univ (HC : is_DelCode C) :
  is_optimal_sub univ C HC ↔ is_optimal C HC := by
  unfold is_optimal_sub is_optimal
  apply Iff.intro
  · intro h C' hC'; exact h C' (subset_univ C') hC'
  · intro h C' _ hC'; exact h C' hC'
lemma optimal_sub_of_supset
  (HS : S₁ ⊆ S₂) (HC : is_DelCode C) (HCS : is_optimal_sub S₂ C HC) :
  is_optimal_sub S₁ C HC := by
  intro C' hS hC'
  exact HCS _ (Finset.Subset.trans hS HS) hC'
lemma optimal_sub_of_ex
  (HC : is_DelCode C) (HCS : is_optimal_sub S₁ C HC)
  (Hex : ∀ C₂ ∈ DCs_sub S₂, ∃ C₁ ∈ DCs_sub S₁, Finset.card C₁ = Finset.card C₂) :
  is_optimal_sub S₂ C HC := by
  intro S' hSU hS'
  have h_mem : S' ∈ DCs_sub S₂ := by rw [mem_DCs_sub]; exact ⟨hSU, hS'⟩
  have Hex_S' := Hex S' h_mem
  rcases Hex_S' with ⟨C₁, HC₁, HC₁C₂⟩
  rw [← HC₁C₂]
  rw [mem_DCs_sub] at HC₁
  exact HCS C₁ HC₁.left HC₁.right
lemma exists_DelCode_erase
  (HC : C ∈ DCs_sub S)
  (X : List.Vector α n) (HX : ∃ X' ∈ S, X' ≠ X ∧ dS X' ⊆ dS X) :
  ∃ C' ∈ DCs_sub (erase S X), Finset.card C' = Finset.card C := by
  rw [mem_DCs_sub] at HC
  rcases HX with ⟨X', HX', HXX'_left, HXX'_right⟩
  cases Classical.em (X ∈ C) with
  | inl hXC =>
    use (replaceCode C X X')
    constructor
    · rw [mem_DCs_sub]
      constructor
      · rw [replaceCode, insert_subset_iff]
        constructor
        · rw [mem_erase]
          exact ⟨HXX'_left, HX'⟩
        · apply erase_subset_erase
          exact HC.left
      · exact DelCode_replaceCode _ _ _ HC.right hXC HXX'_right
    · exact card_replaceCode _ HC.right _ hXC X' HXX'_right
  | inr hnXC =>
    use C
    constructor
    · rw [mem_DCs_sub]
      constructor
      · intro z hzC
        rw [mem_erase]
        constructor
        · intro h
          rw [h] at hzC
          contradiction
        · exact HC.left hzC
      · exact HC.right
    · rfl
lemma exists_DelCode_sdiff
  (HC : C ∈ DCs_sub S)
  (X : Finset (List.Vector α n)) (HX : ∀ x ∈ X, ∃ x' ∈ S \ X, x' ≠ x ∧ dS x' ⊆ dS x) :
  ∃ C' ∈ DCs_sub (S \ X), Finset.card C' = Finset.card C := by
  revert S C
  induction X using Finset.induction with
  | empty =>
    intro S C HC HX
    use C
    constructor
    · rw [sdiff_empty]; exact HC
    · rfl
  | insert x X hx ihX =>
    intro S C HC HX
    have H_eq : S \ insert x X = (S.erase x) \ X := by ext a; simp [mem_sdiff, mem_insert, mem_erase]; tauto
    rw [H_eq]
    have Hex_erase : ∃ x' ∈ S, x' ≠ x ∧ dS x' ⊆ dS x := by
      rcases HX x (mem_insert_self x X) with ⟨x', hx', hxx'_ne, hxx'_sub⟩
      rw [mem_sdiff] at hx'
      exact ⟨x', hx'.left, hxx'_ne, hxx'_sub⟩
    rcases exists_DelCode_erase S C HC x Hex_erase with ⟨C', hC', hCC'⟩
    rw [← hCC']
    apply ihX (erase S x) C' hC'
    intro y hy
    rcases HX y (mem_insert_of_mem hy) with ⟨y', hy', hyy'_ne, hyy'_sub⟩
    use y'
    rw [H_eq] at hy'
    exact ⟨hy', hyy'_ne, hyy'_sub⟩
lemma exists_DelCode_sdiff'
  (HC : C ∈ DCs_sub S)
  (X : Finset (List.Vector α n)) (HX : ∀ x ∈ S ∩ X, ∃ x' ∈ S \ X, x' ≠ x ∧ dS x' ⊆ dS x) :
  ∃ C' ∈ DCs_sub (S \ X), Finset.card C' = Finset.card C := by
  have H_eq : S \ X = S \ (S ∩ X) := by
    ext a; simp only [mem_sdiff, mem_inter]; tauto
  rw [H_eq]
  apply exists_DelCode_sdiff S C HC
  intro x hx
  rcases HX x hx with ⟨x', hx'_mem, hx'_ne, hx'_sub⟩
  use x'
  rw [← H_eq]
  exact ⟨hx'_mem, hx'_ne, hx'_sub⟩
lemma optimal_sub_erase_iff
  (C : Finset (List.Vector α n)) (HC : is_DelCode C)
  (X : List.Vector α n) (HX : ∃ X' ∈ S, X' ≠ X ∧ dS X' ⊆ dS X) :
  is_optimal_sub (erase S X) C HC ↔ is_optimal_sub S C HC := by
  apply Iff.intro
  · intro h
    have Hex : ∀ C₂ ∈ DCs_sub S, ∃ C₁ ∈ DCs_sub (erase S X), Finset.card C₁ = Finset.card C₂ := by
      intro C₂ hC₂
      exact exists_DelCode_erase (HC := hC₂) (HX := HX)
    exact optimal_sub_of_ex (HCS := h) (Hex := Hex)
  · intro h
    exact optimal_sub_of_supset (HS := erase_subset X S) (HCS := h)
lemma optimal_sub_sdiff_iff
  (HC : is_DelCode C)
  (X : Finset (List.Vector α n)) (HX : ∀ x ∈ X, ∃ y ∈ S \ X, y ≠ x ∧ dS y ⊆ dS x) :
  is_optimal_sub (S \ X) C HC ↔ is_optimal_sub S C HC := by
  revert S
  induction X using Finset.induction with
  | empty =>
    intro S HX
    rw [sdiff_empty]
  | insert x X hx ihX =>
    intro S HX
    have H_eq : S \ insert x X = (S.erase x) \ X := by ext a; simp [mem_sdiff, mem_insert, mem_erase]; tauto
    rw [H_eq]
    have HX_erase : ∀ x' ∈ X, ∃ y ∈ S.erase x \ X, y ≠ x' ∧ dS y ⊆ dS x' := by
      intro x' hx'
      rcases HX x' (mem_insert_of_mem hx') with ⟨y, hy_mem, hy_ne, hy_sub⟩
      use y
      rw [H_eq] at hy_mem
      exact ⟨hy_mem, hy_ne, hy_sub⟩
    have ih := ihX (erase S x) HX_erase
    apply Iff.trans ih
    apply optimal_sub_erase_iff
    rcases HX x (mem_insert_self x X) with ⟨y, hy_mem, hy_ne, hy_sub⟩
    use y
    rw [mem_sdiff] at hy_mem
    exact ⟨hy_mem.left, hy_ne, hy_sub⟩
lemma optimal_sub_sdiff_iff'
  (HC : is_DelCode C)
  (X : Finset (List.Vector α n)) (HX : ∀ x ∈ S ∩ X, ∃ y ∈ S \ X, y ≠ x ∧ dS y ⊆ dS x) :
  is_optimal_sub (S \ X) C HC ↔ is_optimal_sub S C HC := by
  have H_eq : S \ X = S \ (S ∩ X) := by
    ext a; simp only [mem_sdiff, mem_inter]; tauto
  rw [H_eq]
  rw [optimal_sub_sdiff_iff S C HC]
  intro x hx
  rcases HX x hx with ⟨y, hy_mem, hy_ne, hy_sub⟩
  use y
  rw [← H_eq]
  exact ⟨hy_mem, hy_ne, hy_sub⟩
def is_card_DCs_sub_le (k : Nat) : Prop :=
  ∀ C' ⊆ S, is_DelCode C' → Finset.card C' ≤ k

noncomputable instance Decidableis_card_DCs_sub_le  (k : Nat) :
  Decidable (is_card_DCs_sub_le S k) := by unfold is_card_DCs_sub_le; infer_instance
def is_card_DCs_sub_le' (k : Nat) : Prop :=
  ∀ C' ⊆ S, is_DelCode' C' → Finset.card C' ≤ k

noncomputable instance Decidableis_card_DCs_sub_le'  (k : Nat) :
  Decidable (is_card_DCs_sub_le' S k) := by unfold is_card_DCs_sub_le'; infer_instance
lemma card_DCs_sub_le'_iff (k : Nat) :
  is_card_DCs_sub_le' S k ↔ is_card_DCs_sub_le S k := by
  unfold is_card_DCs_sub_le' is_card_DCs_sub_le
  apply Iff.intro
  · intro h C' hS hC'; rw [← DelCode'_iff] at hC'; exact h C' hS hC'
  · intro h C' hS hC'; rw [DelCode'_iff] at hC'; exact h C' hS hC'
lemma is_card_DCs_sub_le_DC (HC : is_DelCode C) :
  is_card_DCs_sub_le S (Finset.card C) ↔ is_optimal_sub S C HC := by
  rfl
lemma card_DCs_sub_le_of_supset
  {S₁ S₂ : Finset (List.Vector α n)} (HS : S₁ ⊆ S₂)
  (k : Nat) (HSk : is_card_DCs_sub_le S₂ k) :
  is_card_DCs_sub_le S₁ k := by
  intro C hCS hC
  exact HSk C (Finset.Subset.trans hCS HS) hC
lemma card_DCs_sub_le_of_ex
  {S₁ S₂ : Finset (List.Vector α n)}
  (k : Nat) (HSk : is_card_DCs_sub_le S₁ k)
  (Hex : ∀ C₂ ∈ DCs_sub S₂, ∃ C₁ ∈ DCs_sub S₁, Finset.card C₁ = Finset.card C₂) :
  is_card_DCs_sub_le S₂ k := by
  intro S' hSU hS'
  have h_mem : S' ∈ DCs_sub S₂ := by rw [mem_DCs_sub]; exact ⟨hSU, hS'⟩
  have Hex_S' := Hex S' h_mem
  rcases Hex_S' with ⟨C₁, HC₁, HC₁C₂⟩
  rw [← HC₁C₂]
  rw [mem_DCs_sub] at HC₁
  exact HSk C₁ HC₁.left HC₁.right
lemma card_DCs_sub_le_erase_iff
  {n : Nat} (S : Finset (List.Vector α n))
  (X : List.Vector α n) (Hx : ∃ X' ∈ S, X' ≠ X ∧ dS X' ⊆ dS X) (k : Nat) :
  is_card_DCs_sub_le (erase S X) k ↔ is_card_DCs_sub_le S k := by
  apply Iff.intro
  · intro h
    have Hex : ∀ C₂ ∈ DCs_sub S, ∃ C₁ ∈ DCs_sub (erase S X), Finset.card C₁ = Finset.card C₂ := by
      intro C₂ hC₂
      exact exists_DelCode_erase (HC := hC₂) (HX := Hx)
    exact card_DCs_sub_le_of_ex k h Hex
  · intro h
    exact card_DCs_sub_le_of_supset (erase_subset X S) k h
lemma card_DCs_sub_le_sdiff_iff
  (X : Finset (List.Vector α n)) (HX : ∀ x ∈ X, ∃ x' ∈ S \ X, x' ≠ x ∧ dS x' ⊆ dS x) (k : Nat) :
  is_card_DCs_sub_le (S \ X) k ↔ is_card_DCs_sub_le S k := by
  revert S
  induction X using Finset.induction with
  | empty =>
    intro S HX
    rw [sdiff_empty]
  | insert x X hx ihX =>
    intro S HX
    have H_eq : S \ insert x X = (S.erase x) \ X := by ext a; simp [mem_sdiff, mem_insert, mem_erase]; tauto
    rw [H_eq]
    have HX_erase : ∀ x' ∈ X, ∃ y ∈ S.erase x \ X, y ≠ x' ∧ dS y ⊆ dS x' := by
      intro x' hx'
      rcases HX x' (mem_insert_of_mem hx') with ⟨y, hy_mem, hy_ne, hy_sub⟩
      use y
      rw [H_eq] at hy_mem
      exact ⟨hy_mem, hy_ne, hy_sub⟩
    have ih := ihX (erase S x) HX_erase
    apply Iff.trans ih
    apply card_DCs_sub_le_erase_iff
    rcases HX x (mem_insert_self x X) with ⟨y, hy_mem, hy_ne, hy_sub⟩
    use y
    rw [mem_sdiff] at hy_mem
    exact ⟨hy_mem.left, hy_ne, hy_sub⟩
lemma card_DCs_sub_le_sdiff_iff'
  (X : Finset (List.Vector α n))
  (HX : ∀ x ∈ S ∩ X, ∃ x' ∈ S \ X, x' ≠ x ∧ dS x' ⊆ dS x) (k : Nat) :
  is_card_DCs_sub_le (S \ X) k ↔ is_card_DCs_sub_le S k := by
  have H_eq : S \ X = S \ (S ∩ X) := by
    ext a; simp only [mem_sdiff, mem_inter]; tauto
  rw [H_eq]
  rw [card_DCs_sub_le_sdiff_iff _ _ (HX := ?_)]
  · intro x hx
    rcases HX x hx with ⟨y, hy_mem, hy_ne, hy_sub⟩
    use y
    rw [← H_eq]
    exact ⟨hy_mem, hy_ne, hy_sub⟩
lemma exists_subset_card_le {α : Type} (s : Finset α) (k : Nat) (hk : k ≤ s.card) :
  ∃ s' ⊆ s, s'.card = k := Finset.exists_subset_card_eq hk

lemma card_DC_sub_le_of_succ_empty
  {n : Nat} (S : Finset (List.Vector α n)) (k : Nat) (Hk : DCs_sub_len S (k + 1) = ∅) :
  is_card_DCs_sub_le S k := by
  intro C hS hC
  cases Classical.em (Finset.card C ≤ k) with
  | inl hle =>
    exact hle
  | inr hnle =>
    rw [not_le] at hnle
    have hk : k + 1 ≤ Finset.card C := hnle
    rcases exists_subset_card_le C (k + 1) hk with ⟨C', hC'_sub, hC'_card⟩
    have h : C' ∈ DCs_sub_len S (k + 1) := by
      rw [mem_DCs_sub_len]
      constructor
      · exact Finset.Subset.trans hC'_sub hS
      · constructor
        · exact hC'_card
        · exact DelCode_subset _ _ hC hC'_sub
    have h_absurd : (DCs_sub_len S (k + 1)).Nonempty := ⟨C', h⟩
    rw [Hk] at h_absurd
    exact absurd h_absurd (by simp)
namespace B

lemma List.eq_replicate_O_of_num_Is_zero : ∀ (X : List B) (hx : List.num_Is X = 0), X = List.replicate X.length O
| [], _ => rfl
| O :: X', hx => by
  change O :: X' = O :: List.replicate X'.length O
  congr 1
  exact eq_replicate_O_of_num_Is_zero X' hx
| I :: X', hx => by
  change List.num_Is X' + 1 = 0 at hx
  contradiction

lemma list_sDel_of_wt_le : ∀ (X : List B) (hx : List.num_Is X ≤ 1),
  ∃ i, List.sDel X i = List.replicate (X.length - 1) O
| [], _ => ⟨0, rfl⟩
| O :: [], _ => ⟨0, rfl⟩
| O :: y :: Y', hx => by
  have hx' : List.num_Is (y :: Y') ≤ 1 := hx
  rcases list_sDel_of_wt_le (y :: Y') hx' with ⟨i, hi⟩
  use (i + 1)
  have H : y :: Y' ≠ [] := by intro h; contradiction
  rw [List.sDel_cons _ _ _ H]
  rw [hi]
  rfl
| I :: X', hx => by
  have hx' : List.num_Is X' = 0 := by
    change List.num_Is X' + 1 ≤ 1 at hx
    exact Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ hx)
  use 0
  have H1 : List.sDel (I :: X') 0 = X' := List.sDel_zero _ _
  rw [H1]
  have H2 : X' = List.replicate X'.length O := List.eq_replicate_O_of_num_Is_zero X' hx'
  have H3 : (I :: X').length - 1 = X'.length := rfl
  rw [H3]
  exact H2

lemma vector_sDel_of_wt_le {n : Nat} (X : List.Vector B n) (HX : wt X ≤ 1) :
  ∃ i, List.Vector.sDel X i = List.Vector.replicate (n - 1) O := by
  have h : List.num_Is X.val ≤ 1 := HX
  rcases list_sDel_of_wt_le X.val h with ⟨i, hi⟩
  use i
  apply Subtype.ext
  change List.sDel X.val i = List.replicate (n - 1) O
  have Hn : X.val.length = n := X.property
  rw [Hn] at hi
  exact hi

lemma repO_mem_dS (X  : List.Vector B n) (HX : wt X ≤ 1) :
  List.Vector.replicate (n - 1) O ∈ List.Vector.dS X := by
  rcases vector_sDel_of_wt_le X HX with ⟨i, hi⟩
  rw [List.Vector.mem_dS]
  cases List.Vector.exists_sDel_le X i with
  | intro j hj =>
    use j
    constructor
    · exact hj.1
    · rw [← hj.2, hi]

lemma List.eq_replicate_I_of_num_Os_zero : ∀ (X : List B) (hx : List.num_Os X = 0), X = List.replicate X.length I
| [], _ => rfl
| I :: X', hx => by
  change I :: X' = I :: List.replicate X'.length I
  congr 1
  exact eq_replicate_I_of_num_Os_zero X' hx
| O :: X', hx => by
  change List.num_Os X' + 1 = 0 at hx
  contradiction

lemma list_sDel_of_le_wt : ∀ (X : List B) (hx : List.num_Os X ≤ 1),
  ∃ i, List.sDel X i = List.replicate (X.length - 1) I
| [], _ => ⟨0, rfl⟩
| I :: [], _ => ⟨0, rfl⟩
| I :: y :: Y', hx => by
  have hx' : List.num_Os (y :: Y') ≤ 1 := hx
  rcases list_sDel_of_le_wt (y :: Y') hx' with ⟨i, hi⟩
  use (i + 1)
  have H : y :: Y' ≠ [] := by intro h; contradiction
  rw [List.sDel_cons _ _ _ H]
  rw [hi]
  rfl
| O :: X', hx => by
  have hx' : List.num_Os X' = 0 := by
    change List.num_Os X' + 1 ≤ 1 at hx
    exact Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ hx)
  use 0
  have H1 : List.sDel (O :: X') 0 = X' := List.sDel_zero _ _
  rw [H1]
  have H2 : X' = List.replicate X'.length I := List.eq_replicate_I_of_num_Os_zero X' hx'
  have H3 : (O :: X').length - 1 = X'.length := rfl
  rw [H3]
  exact H2

lemma vector_sDel_of_le_wt {n : Nat} (X : List.Vector B n) (HX : n - 1 ≤ wt X) :
  ∃ i, List.Vector.sDel X i = List.Vector.replicate (n - 1) I := by
  have h1 := List.num_Os_add_num_Is_eq_length X.val
  have h2 : X.val.length = n := X.property
  rw [h2] at h1
  have h3 : List.num_Os X.val ≤ 1 := by
    cases n with
    | zero => 
      have hl : X.val.length = 0 := X.property
      have hnil : X.val = [] := List.eq_nil_of_length_eq_zero hl
      rw [hnil]
      exact Nat.zero_le 1
    | succ n' =>
      change n' ≤ wt X at HX
      have h4 : List.num_Os X.val + List.num_Is X.val = n' + 1 := h1
      apply Nat.le_of_add_le_add_right
      calc
        List.num_Os X.val + n' ≤ List.num_Os X.val + List.num_Is X.val := Nat.add_le_add_left HX _
        _ = n' + 1 := h4
        _ = 1 + n' := Nat.add_comm n' 1
  rcases list_sDel_of_le_wt X.val h3 with ⟨i, hi⟩
  use i
  apply Subtype.ext
  change List.sDel X.val i = List.replicate (n - 1) I
  have Hn : X.val.length = n := X.property
  rw [Hn] at hi
  exact hi

lemma repI_mem_dS (X  : List.Vector B n) (HX : n - 1 ≤ wt X) :
  List.Vector.replicate (n - 1) I ∈ List.Vector.dS X := by
  rcases vector_sDel_of_le_wt X HX with ⟨i, hi⟩
  rw [List.Vector.mem_dS]
  cases List.Vector.exists_sDel_le X i with
  | intro j hj =>
    use j
    constructor
    · exact hj.1
    · rw [← hj.2, hi]

lemma card_Iic_wt_le
  {C : Finset (List.Vector B n)} (H : is_DelCode C):
  Finset.card (filter (Iic_wt 1) C) ≤ 1 := by
  cases Classical.em (Finset.card (filter (Iic_wt 1) C) ≤ 1) with
  | inl hle => exact hle
  | inr hnle =>
    rw [not_le] at hnle
    -- exists_distinct: Lean3 lemma ↔ Finset.one_lt_card in Lean4
    rw [Finset.one_lt_card] at hnle
    obtain ⟨X, hX, Y, hY, hXY⟩ := hnle
    have h : dS X ∩ dS Y ≠ ∅ := by
      apply Finset.ne_empty_of_mem (a := List.Vector.replicate (n - 1) O)
      rw [mem_inter]
      constructor
      · apply repO_mem_dS
        rw [mem_filter] at hX
        exact hX.right
      · apply repO_mem_dS
        rw [mem_filter] at hY
        exact hY.right
    have h_absurd := H X ?_ Y ?_ hXY
    · contradiction
    · rw [mem_filter] at hX; exact hX.left
    · rw [mem_filter] at hY; exact hY.left
lemma card_Ici_wt_le
  {C : Finset (List.Vector B n)} (HC : is_DelCode C):
  Finset.card (filter (Ici_wt (n - 1)) C) ≤ 1 := by
  cases Classical.em (Finset.card (filter (Ici_wt (n - 1)) C) ≤ 1) with
  | inl hle => exact hle
  | inr hnle =>
    rw [not_le] at hnle
    rw [Finset.one_lt_card] at hnle
    obtain ⟨X, hX, Y, hY, hXY⟩ := hnle
    have h : dS X ∩ dS Y ≠ ∅ := by
      apply Finset.ne_empty_of_mem (a := List.Vector.replicate (n - 1) I)
      rw [mem_inter]
      constructor
      · apply repI_mem_dS
        rw [mem_filter] at hX
        exact hX.right
      · apply repI_mem_dS
        rw [mem_filter] at hY
        exact hY.right
    have h_absurd := HC X ?_ Y ?_ hXY
    · contradiction
    · rw [mem_filter] at hX; exact hX.left
    · rw [mem_filter] at hY; exact hY.left
lemma card_le_filter_Icc
  {C : Finset (List.Vector B n)} (HC : is_DelCode C):
  Finset.card C ≤ Finset.card (filter (Icc_wt 2 (n - 2)) C) + 2 := by
  have h_Iic : card (filter (Iic_wt 1) C) ≤ 1 := card_Iic_wt_le HC
  have h_Ici : card (filter (Ici_wt (n - 1)) C) ≤ 1 := card_Ici_wt_le HC
  have h_part1 : card (filter (Iic_wt 1) C) + card (filter (fun x => ¬ Iic_wt 1 x) C) = card C :=
    Finset.card_filter_add_card_filter_not (Iic_wt 1)
  have h_part2 : card (filter (Ici_wt (n - 1)) (filter (fun x => ¬ Iic_wt 1 x) C)) + card (filter (fun x => ¬ Ici_wt (n - 1) x) (filter (fun x => ¬ Iic_wt 1 x) C)) = card (filter (fun x => ¬ Iic_wt 1 x) C) :=
    Finset.card_filter_add_card_filter_not (Ici_wt (n - 1))
  have h_Ici_sub : filter (Ici_wt (n - 1)) (filter (fun x => ¬ Iic_wt 1 x) C) ⊆ filter (Ici_wt (n - 1)) C := by
    intro x hx
    rw [mem_filter] at hx ⊢
    exact ⟨(mem_filter.mp hx.1).1, hx.2⟩
  have h_Ici_card_le : card (filter (Ici_wt (n - 1)) (filter (fun x => ¬ Iic_wt 1 x) C)) ≤ 1 :=
    le_trans (Finset.card_le_card h_Ici_sub) h_Ici
  have h_eq_Icc : filter (fun x => ¬ Ici_wt (n - 1) x) (filter (fun x => ¬ Iic_wt 1 x) C) = filter (Icc_wt 2 (n - 2)) C := by
    apply Finset.ext
    intro x
    rw [mem_filter, mem_filter, mem_filter]
    apply Iff.intro
    · rintro ⟨⟨hC, hnIic⟩, hnIci⟩
      change ¬ wt x ≤ 1 at hnIic
      change ¬ n - 1 ≤ wt x at hnIci
      have h1 : 1 < wt x := Nat.lt_of_not_ge hnIic
      have h2 : wt x < n - 1 := Nat.lt_of_not_ge hnIci
      exact ⟨hC, ⟨Nat.succ_le_of_lt h1, Nat.le_sub_one_of_lt h2⟩⟩
    · rintro ⟨hC, h2, hn2⟩
      change 2 ≤ wt x at h2
      change wt x ≤ n - 2 at hn2
      constructor
      · constructor
        · exact hC
        · intro h
          change wt x ≤ 1 at h
          have h_absurd := Nat.lt_of_le_of_lt h h2
          exact Nat.lt_irrefl _ h_absurd
      · intro h
        change n - 1 ≤ wt x at h
        cases n with
        | zero => 
          have h0 : wt x = 0 := Nat.eq_zero_of_le_zero hn2
          rw [h0] at h h2
          exact Nat.not_lt_zero _ h2
        | succ n' =>
          cases n' with
          | zero =>
            change 1 - 1 ≤ wt x at h
            change wt x ≤ 1 - 2 at hn2
            have h0 : wt x = 0 := Nat.eq_zero_of_le_zero hn2
            rw [h0] at h2
            have hz : ¬ 2 ≤ 0 := by decide
            contradiction
          | succ n'' =>
            change n'' + 2 - 1 ≤ wt x at h
            change wt x ≤ n'' + 2 - 2 at hn2
            change n'' + 1 ≤ wt x at h
            change wt x ≤ n'' at hn2
            have h_absurd := Nat.lt_of_le_of_lt hn2 h
            exact Nat.lt_irrefl _ h_absurd
  rw [h_eq_Icc] at h_part2
  rw [← h_part1]
  rw [← h_part2]
  calc
    card (filter (Iic_wt 1) C) + (card (filter (Ici_wt (n - 1)) (filter (fun x => ¬Iic_wt 1 x) C)) + card (filter (Icc_wt 2 (n - 2)) C))
      ≤ 1 + (1 + card (filter (Icc_wt 2 (n - 2)) C)) := Nat.add_le_add h_Iic (Nat.add_le_add h_Ici_card_le (Nat.le_refl _))
    _ = card (filter (Icc_wt 2 (n - 2)) C) + 2 := by
      have H1 : 1 + (1 + card (filter (Icc_wt 2 (n - 2)) C)) = 1 + 1 + card (filter (Icc_wt 2 (n - 2)) C) := (Nat.add_assoc _ _ _).symm
      have H2 : 1 + 1 = 2 := rfl
      rw [H1, H2, Nat.add_comm]
lemma optimal_of_div_wt
  {n : Nat} {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  (H : ∀ C' ⊆ filter (@Icc_wt n 2 (n - 2)) univ,
       is_DelCode C' → Finset.card C' + 2 ≤ Finset.card C) :
  is_optimal C HC := by
  intro C' hC'
  have hle := H (filter (Icc_wt 2 (n - 2)) C')
    (Finset.filter_subset_filter _ (subset_univ _))
    (DelCode_filter _ hC' _)
  exact le_trans (card_le_filter_Icc hC') hle
namespace List

open List

def mkIO (n k : Nat)  : List B :=
  List.replicate k I ++ List.replicate (n - k) O

lemma length_IO (n k : Nat) (Hnk : k ≤ n) :
  List.length (mkIO n k) = n :=
by {
  unfold mkIO
  rw [List.length_append, List.length_replicate, List.length_replicate]
  exact Nat.add_sub_cancel' Hnk
}
lemma length_IO' (n k : Nat) :
  List.length (mkIO n k) = k + (n - k) :=
by {
  unfold mkIO
  rw [List.length_append, List.length_replicate, List.length_replicate]
}
lemma num_Os_IO (n k : Nat) :
  List.num_Is (mkIO n k) = k :=
by {
  unfold mkIO
  rw [List.num_Is_append, List.num_Is_replicate_I, List.num_Is_replicate_O]
  exact Nat.add_zero k
}
lemma num_Is_IO (n k : Nat) :
  List.num_Is (mkIO n k) = k :=
by {
  unfold mkIO
  rw [List.num_Is_append, List.num_Is_replicate_I, List.num_Is_replicate_O]
  exact Nat.add_zero k
}
def mkIOIO (n k : Nat) : List B :=
  List.replicate k I ++ O::I::List.replicate (n - k - 2) O

lemma length_IOIO (n k : Nat) (Hk : k + 2 ≤ n) :
    List.length (mkIOIO n k) = n := by
  unfold mkIOIO
  rw [List.length_append, List.length_replicate, List.length_cons, List.length_cons, List.length_replicate]
  have h1 : n - k - 2 + 1 + 1 = n - k := by
    have H : n - k - 2 + 2 = n - k := Nat.sub_add_cancel (Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hk))
    exact H
  rw [h1]
  have h_k_le_n : k ≤ n := Nat.le_trans (Nat.le_add_right k 2) Hk
  exact Nat.add_sub_cancel' h_k_le_n
lemma num_Os_IOIO (n k : Nat) :
  List.num_Os (mkIOIO n k) = n - k - 2 + 1 := by
  unfold mkIOIO
  rw [List.num_Os_append, List.num_Os_replicate_I, Nat.zero_add]
  change List.num_Os (I :: List.replicate (n - k - 2) O) + 1 = _
  change List.num_Os (List.replicate (n - k - 2) O) + 1 = _
  rw [List.num_Os_replicate_O]
lemma num_Is_IOIO (n k : Nat) :
  List.num_Is (mkIOIO n k) = k + 1 := by
  unfold mkIOIO
  rw [List.num_Is_append, List.num_Is_replicate_I]
  change k + List.num_Is (I :: List.replicate (n - k - 2) O) = _
  change k + (List.num_Is (List.replicate (n - k - 2) O) + 1) = _
  rw [List.num_Is_replicate_O, Nat.zero_add]
lemma length_IOIO' (n k : Nat) (Hk : n ≤ k + 2) :
    List.length (mkIOIO n k) = k + 2 := by
  unfold mkIOIO
  rw [List.length_append, List.length_replicate, List.length_cons, List.length_cons, List.length_replicate]
  have h1 : n - k - 2 = 0 := by
    rw [Nat.sub_sub]
    exact Nat.sub_eq_zero_of_le Hk
  rw [h1]
lemma replicate_append_singleton {α : Type} (n : Nat) (a : α) :
  List.replicate n a ++ [a] = List.replicate (n + 1) a := by
  induction n with
  | zero => rfl
  | succ n' ih =>
    change a :: (List.replicate n' a ++ [a]) = a :: List.replicate (n' + 1) a
    rw [ih]

lemma sDel_IOIO_O (n k : Nat) :
  List.sDel (mkIOIO n k) k = mkIO (n - 1) (k + 1) := by
  unfold mkIOIO mkIO
  have h_len : List.length (List.replicate k I) = k := by rw [List.length_replicate]
  have h_ge : List.length (List.replicate k I) ≤ k := by rw [h_len]
  have h_ne : O :: I :: List.replicate (n - k - 2) O ≠ [] := by intro h; contradiction
  have H_rw := List.sDel_append_of_ge (List.replicate k I) (O :: I :: List.replicate (n - k - 2) O) k h_ge h_ne
  rw [H_rw]
  have h_sub : k - List.length (List.replicate k I) = 0 := by rw [h_len, Nat.sub_self]
  rw [h_sub]
  have h_sDel_0 : List.sDel (O :: I :: List.replicate (n - k - 2) O) 0 = I :: List.replicate (n - k - 2) O := by
    rw [List.sDel_zero]
  rw [h_sDel_0]
  have h_assoc : List.replicate k I ++ I :: List.replicate (n - k - 2) O = (List.replicate k I ++ [I]) ++ List.replicate (n - k - 2) O := by
    change List.replicate k I ++ ([I] ++ List.replicate (n - k - 2) O) = _
    rw [List.append_assoc]
  rw [h_assoc]
  rw [replicate_append_singleton]
  have h_n_1 : n - 1 - (k + 1) = n - k - 2 := by
    have H1 : 1 + (k + 1) = k + 2 := by rw [Nat.add_comm 1 (k + 1)]
    rw [Nat.sub_sub n 1 (k + 1)]
    rw [H1]
    exact (Nat.sub_sub n k 2).symm
  rw [h_n_1]

lemma sDel_IOIO_I (n k : Nat) (Hk : k + 2 ≤ n) :
  List.sDel (mkIOIO n k) (k + 1) = mkIO (n - 1) k := by
  unfold mkIOIO mkIO
  have h_len : List.length (List.replicate k I) = k := by rw [List.length_replicate]
  have h_ge : List.length (List.replicate k I) ≤ k + 1 := by rw [h_len]; exact Nat.le_succ _
  have h_ne : O :: I :: List.replicate (n - k - 2) O ≠ [] := by intro h; contradiction
  have H_rw := List.sDel_append_of_ge (List.replicate k I) (O :: I :: List.replicate (n - k - 2) O) (k + 1) h_ge h_ne
  rw [H_rw]
  have h_sub : k + 1 - List.length (List.replicate k I) = 1 := by rw [h_len, Nat.add_sub_cancel_left]
  rw [h_sub]
  have h_sDel_1 : List.sDel (O :: I :: List.replicate (n - k - 2) O) 1 = O :: List.replicate (n - k - 2) O := by
    change List.sDel (O :: (I :: List.replicate (n - k - 2) O)) (0 + 1) = _
    rw [List.sDel_cons]
    · rw [List.sDel_zero]
    · intro h; contradiction
  rw [h_sDel_1]
  have h_replicate_O : O :: List.replicate (n - k - 2) O = List.replicate (n - 1 - k) O := by
    have h_eq : n - k - 2 + 1 = n - 1 - k := by
      have H2 : 2 ≤ n - k := Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hk)
      have H3 : n - k - 2 + 1 = n - k - 1 := by
        have H4 : n - k = n - k - 2 + 2 := (Nat.sub_add_cancel H2).symm
        rw [H4]
        change n - k - 2 + 1 = n - k - 2 + 1 + 1 - 1
        rw [Nat.add_sub_cancel]
      rw [H3]
      exact Nat.sub_right_comm n k 1
    have h_rep_succ : O :: List.replicate (n - k - 2) O = List.replicate (n - k - 2 + 1) O := rfl
    rw [h_rep_succ, h_eq]
  rw [h_replicate_O]
def mkOI (n k : Nat)  : List B :=
  List.replicate k O ++ List.replicate (n - k) I

lemma length_OI (n k : Nat) (Hnk : k ≤ n) :
  List.length (mkOI n k) = n := by
  unfold mkOI
  rw [List.length_append, List.length_replicate, List.length_replicate]
  exact Nat.add_sub_cancel' Hnk
lemma length_OI' (n k : Nat) :
  List.length (mkOI n k) = k + (n - k) := by
  unfold mkOI
  rw [List.length_append, List.length_replicate, List.length_replicate]
lemma num_Os_OI (n k : Nat) :
  List.num_Os (mkOI n k) = k := by
  unfold mkOI
  rw [List.num_Os_append, List.num_Os_replicate_O, List.num_Os_replicate_I, Nat.add_zero]
lemma num_Is_OI (n k : Nat) :
  List.num_Is (mkOI n k) = n - k := by
  unfold mkOI
  rw [List.num_Is_append, List.num_Is_replicate_O, List.num_Is_replicate_I, Nat.zero_add]
def mkOIOI (n k : Nat) : List B :=
  List.replicate k O ++ I::O::List.replicate (n - k - 2) I

lemma length_OIOI (n k : Nat) (Hk : k + 2 ≤ n):
    List.length (mkOIOI n k) = n := by
  unfold mkOIOI
  rw [List.length_append, List.length_replicate, List.length_cons, List.length_cons, List.length_replicate]
  have h1 : n - k - 2 + 1 + 1 = n - k := by
    have H : n - k - 2 + 2 = n - k := Nat.sub_add_cancel (Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hk))
    exact H
  rw [h1]
  have h_k_le_n : k ≤ n := Nat.le_trans (Nat.le_add_right k 2) Hk
  exact Nat.add_sub_cancel' h_k_le_n
lemma length_OIOI' (n k : Nat) (Hk : n ≤ k + 2) :
    List.length (mkOIOI n k) = k + 2 := by
  unfold mkOIOI
  rw [List.length_append, List.length_replicate, List.length_cons, List.length_cons, List.length_replicate]
  have h1 : n - k - 2 = 0 := by
    rw [Nat.sub_sub]
    exact Nat.sub_eq_zero_of_le Hk
  rw [h1]
lemma num_Os_OIOI (n k : Nat) :
  List.num_Os (mkOIOI n k) = k + 1 := by
  unfold mkOIOI
  rw [List.num_Os_append, List.num_Os_replicate_O]
  change k + List.num_Os (O :: List.replicate (n - k - 2) I) = _
  change k + (List.num_Os (List.replicate (n - k - 2) I) + 1) = _
  rw [List.num_Os_replicate_I, Nat.zero_add]
lemma num_Is_OIOI (n k : Nat) :
  List.num_Is (mkOIOI n k) = n - k - 2 + 1 := by
  unfold mkOIOI
  rw [List.num_Is_append, List.num_Is_replicate_O, Nat.zero_add]
  change List.num_Is (O :: List.replicate (n - k - 2) I) + 1 = _
  change List.num_Is (List.replicate (n - k - 2) I) + 1 = _
  rw [List.num_Is_replicate_I]
lemma drop_replicate_append {α : Type} (k : Nat) (a : α) (L : List α) :
  List.drop k (List.replicate k a ++ L) = L := by
  induction k with
  | zero => rfl
  | succ k' ih => exact ih

lemma replicate_succ_append_eq_replicate_append_cons {α : Type} (k : Nat) (a : α) (L : List α) :
  List.replicate (k + 1) a ++ L = List.replicate k a ++ (a :: L) := by
  induction k with
  | zero => rfl
  | succ k' ih =>
    change a :: (List.replicate (k' + 1) a ++ L) = a :: (List.replicate k' a ++ (a :: L))
    rw [ih]

lemma sDel_OIOI_I (n k : Nat) :
  List.sDel (mkOIOI n k) k = mkOI (n - 1) (k + 1) := by
  unfold mkOIOI mkOI
  have h_len : List.length (List.replicate k O) = k := by rw [List.length_replicate]
  have h_ge : List.length (List.replicate k O) ≤ k := by rw [h_len]
  have h_ne : I :: O :: List.replicate (n - k - 2) I ≠ [] := by intro h; contradiction
  have H_rw := List.sDel_append_of_ge (List.replicate k O) (I :: O :: List.replicate (n - k - 2) I) k h_ge h_ne
  rw [H_rw]
  have h_sub : k - List.length (List.replicate k O) = 0 := by rw [h_len, Nat.sub_self]
  rw [h_sub]
  have h_sDel_0 : List.sDel (I :: O :: List.replicate (n - k - 2) I) 0 = O :: List.replicate (n - k - 2) I := by
    rw [List.sDel_zero]
  rw [h_sDel_0]
  have h_assoc : List.replicate k O ++ O :: List.replicate (n - k - 2) I = (List.replicate k O ++ [O]) ++ List.replicate (n - k - 2) I := by
    change List.replicate k O ++ ([O] ++ List.replicate (n - k - 2) I) = _
    rw [List.append_assoc]
  rw [h_assoc]
  rw [replicate_append_singleton]
  have h_n_1 : n - 1 - (k + 1) = n - k - 2 := by
    have H1 : 1 + (k + 1) = k + 2 := by rw [Nat.add_comm 1 (k + 1)]
    rw [Nat.sub_sub n 1 (k + 1)]
    rw [H1]
    exact (Nat.sub_sub n k 2).symm
  rw [h_n_1]
lemma sDel_OIOI_O (n k : Nat)  (Hk : k + 2 ≤ n) :
  List.sDel (mkOIOI n k) (k + 1) = mkOI (n - 1) k := by
  unfold mkOIOI mkOI
  have h_len : List.length (List.replicate k O) = k := by rw [List.length_replicate]
  have h_ge : List.length (List.replicate k O) ≤ k + 1 := by rw [h_len]; exact Nat.le_succ _
  have h_ne : I :: O :: List.replicate (n - k - 2) I ≠ [] := by intro h; contradiction
  have H_rw := List.sDel_append_of_ge (List.replicate k O) (I :: O :: List.replicate (n - k - 2) I) (k + 1) h_ge h_ne
  rw [H_rw]
  have h_sub : k + 1 - List.length (List.replicate k O) = 1 := by rw [h_len, Nat.add_sub_cancel_left]
  rw [h_sub]
  have h_sDel_1 : List.sDel (I :: O :: List.replicate (n - k - 2) I) 1 = I :: List.replicate (n - k - 2) I := by
    change List.sDel (I :: (O :: List.replicate (n - k - 2) I)) (0 + 1) = _
    rw [List.sDel_cons]
    · rw [List.sDel_zero]
    · intro h; contradiction
  rw [h_sDel_1]
  have h_replicate_O : I :: List.replicate (n - k - 2) I = List.replicate (n - 1 - k) I := by
    have h_eq : n - k - 2 + 1 = n - 1 - k := by
      have H2 : 2 ≤ n - k := Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hk)
      have H3 : n - k - 2 + 1 = n - k - 1 := by
        have H4 : n - k = n - k - 2 + 2 := (Nat.sub_add_cancel H2).symm
        rw [H4]
        change n - k - 2 + 1 = n - k - 2 + 1 + 1 - 1
        rw [Nat.add_sub_cancel]
      rw [H3]
      exact Nat.sub_right_comm n k 1
    have h_rep_succ : I :: List.replicate (n - k - 2) I = List.replicate (n - k - 2 + 1) I := rfl
    rw [h_rep_succ, h_eq]
  rw [h_replicate_O]
lemma OI_succ_ne_OIOI (n k : Nat) :
  mkOI n (k + 1) ≠ mkOIOI n k := by
  unfold mkOI mkOIOI
  intro h
  have h_drop : List.drop k (List.replicate (k + 1) O ++ List.replicate (n - (k + 1)) I) =
                List.drop k (List.replicate k O ++ I :: O :: List.replicate (n - k - 2) I) := by
    rw [h]
  rw [replicate_succ_append_eq_replicate_append_cons] at h_drop
  rw [drop_replicate_append] at h_drop
  rw [drop_replicate_append] at h_drop
  injection h_drop with h_head
  contradiction

lemma OI_ne_OIOI (n k₁ k₂ : Nat) :
  mkOI n k₁ ≠ mkOIOI n k₂ := by
  intro h
  by_cases hk : k₁ = k₂ + 1
  · subst hk
    exact OI_succ_ne_OIOI n k₂ h
  · have h_os : List.num_Os (mkOI n k₁) = List.num_Os (mkOIOI n k₂) := by rw [h]
    rw [num_Os_OI, num_Os_OIOI] at h_os
    contradiction
lemma drop_one_replicate_pos {α : Type} (k : Nat) (hk : 0 < k) (a : α) (L : List α) :
  List.drop 1 (List.replicate k a ++ L) = List.replicate (k - 1) a ++ L := by
  cases k with
  | zero => contradiction
  | succ k' =>
    change List.drop 1 (a :: (List.replicate k' a ++ L)) = _
    rw [List.drop]
    rfl

lemma head_replicate_pos {α : Type} (k : Nat) (hk : 0 < k) (a : α) (L : List α) :
  List.head? (List.replicate k a ++ L) = some a := by
  cases k with
  | zero => contradiction
  | succ k' => rfl

lemma head_replicate_pos_only {α : Type} (k : Nat) (hk : 0 < k) (a : α) :
  List.head? (List.replicate k a) = some a := by
  cases k with
  | zero => contradiction
  | succ k' => rfl



lemma OI_ne_IOIO (n k₁ k₂ : Nat) (H : 3 ≤ n) :
  mkOI n k₁ ≠ mkIOIO n k₂ := by
  intro h
  by_cases hk1 : k₁ = 0
  · subst hk1
    have h_drop : List.drop k₂ (mkOI n 0) = List.drop k₂ (mkIOIO n k₂) := by rw [h]
    unfold mkOI mkIOIO at h_drop
    change List.drop k₂ (List.replicate n I) = List.drop k₂ (List.replicate k₂ I ++ O :: I :: List.replicate (n - k₂ - 2) O) at h_drop
    rw [drop_replicate_append] at h_drop
    rw [List.drop_replicate] at h_drop
    have h_head := congrArg (@List.head? B) h_drop
    by_cases h_sub : n - k₂ = 0
    · rw [h_sub] at h_head
      change none = some O at h_head
      contradiction
    · have h_sub_pos : 0 < n - k₂ := Nat.pos_of_ne_zero h_sub
      rw [head_replicate_pos_only (n - k₂) h_sub_pos I] at h_head
      change some I = some O at h_head
      contradiction
  · have hk1_pos : 0 < k₁ := Nat.pos_of_ne_zero hk1
    by_cases hk2 : k₂ = 0
    · subst hk2
      have h_drop : List.drop 1 (mkOI n k₁) = List.drop 1 (mkIOIO n 0) := by rw [h]
      unfold mkOI mkIOIO at h_drop
      rw [drop_one_replicate_pos k₁ hk1_pos O (List.replicate (n - k₁) I)] at h_drop
      change List.replicate (k₁ - 1) O ++ List.replicate (n - k₁) I = I :: List.replicate (n - 2) O at h_drop
      by_cases hk1_eq_1 : k₁ - 1 = 0
      · have h_os : List.num_Os (List.replicate (k₁ - 1) O ++ List.replicate (n - k₁) I) =
                    List.num_Os (I :: List.replicate (n - 2) O) := by exact congrArg List.num_Os h_drop
        rw [hk1_eq_1] at h_os
        change List.num_Os (List.replicate (n - k₁) I) = List.num_Os (List.replicate (n - 2) O) at h_os
        rw [List.num_Os_replicate_I, List.num_Os_replicate_O] at h_os
        have h_n_2 : n - 2 = 0 := h_os.symm
        have h_n_le_2 : n ≤ 2 := Nat.le_of_sub_eq_zero h_n_2
        have h_contra : 3 ≤ 2 := Nat.le_trans H h_n_le_2
        contradiction
      · have hk1_sub_pos : 0 < k₁ - 1 := Nat.pos_of_ne_zero hk1_eq_1
        have h_head : List.head? (List.replicate (k₁ - 1) O ++ List.replicate (n - k₁) I) =
                      List.head? (I :: List.replicate (n - 2) O) := by exact congrArg List.head? h_drop
        rw [head_replicate_pos (k₁ - 1) hk1_sub_pos O (List.replicate (n - k₁) I)] at h_head
        change some O = some I at h_head
        contradiction
    · have hk2_pos : 0 < k₂ := Nat.pos_of_ne_zero hk2
      have h_head : List.head? (mkOI n k₁) = List.head? (mkIOIO n k₂) := by rw [h]
      unfold mkOI mkIOIO at h_head
      rw [head_replicate_pos k₁ hk1_pos O (List.replicate (n - k₁) I)] at h_head
      rw [head_replicate_pos k₂ hk2_pos I (O :: I :: List.replicate (n - k₂ - 2) O)] at h_head
      contradiction
lemma IO_succ_ne_IOIO (n k : Nat) :
  mkIO n (k + 1) ≠ mkIOIO n k := by
  unfold mkIO mkIOIO
  intro h
  have h_drop : List.drop k (List.replicate (k + 1) I ++ List.replicate (n - (k + 1)) O) =
                List.drop k (List.replicate k I ++ O :: I :: List.replicate (n - k - 2) O) := by
    rw [h]
  rw [replicate_succ_append_eq_replicate_append_cons] at h_drop
  rw [drop_replicate_append] at h_drop
  rw [drop_replicate_append] at h_drop
  injection h_drop with h_head
  contradiction

lemma IO_ne_IOIO (n k₁ k₂ : Nat) :
  mkIO n k₁ ≠ mkIOIO n k₂ := by
  intro h
  by_cases hk : k₁ = k₂ + 1
  · subst hk
    exact IO_succ_ne_IOIO n k₂ h
  · have h_is : List.num_Is (mkIO n k₁) = List.num_Is (mkIOIO n k₂) := by rw [h]
    rw [num_Is_IO, num_Is_IOIO] at h_is
    contradiction
lemma IO_ne_OIOI (n k₁ k₂ : Nat) (H : 3 ≤ n) :
  mkIO n k₁ ≠ mkOIOI n k₂ := by
  intro h
  by_cases hk1 : k₁ = 0
  · subst hk1
    have h_drop : List.drop k₂ (mkIO n 0) = List.drop k₂ (mkOIOI n k₂) := by rw [h]
    unfold mkIO mkOIOI at h_drop
    change List.drop k₂ (List.replicate n O) = List.drop k₂ (List.replicate k₂ O ++ I :: O :: List.replicate (n - k₂ - 2) I) at h_drop
    rw [drop_replicate_append] at h_drop
    rw [List.drop_replicate] at h_drop
    have h_head := congrArg (@List.head? B) h_drop
    by_cases h_sub : n - k₂ = 0
    · rw [h_sub] at h_head
      change none = some I at h_head
      contradiction
    · have h_sub_pos : 0 < n - k₂ := Nat.pos_of_ne_zero h_sub
      rw [head_replicate_pos_only (n - k₂) h_sub_pos O] at h_head
      change some O = some I at h_head
      contradiction
  · have hk1_pos : 0 < k₁ := Nat.pos_of_ne_zero hk1
    by_cases hk2 : k₂ = 0
    · subst hk2
      have h_drop : List.drop 1 (mkIO n k₁) = List.drop 1 (mkOIOI n 0) := by rw [h]
      unfold mkIO mkOIOI at h_drop
      rw [drop_one_replicate_pos k₁ hk1_pos I (List.replicate (n - k₁) O)] at h_drop
      change List.replicate (k₁ - 1) I ++ List.replicate (n - k₁) O = O :: List.replicate (n - 2) I at h_drop
      by_cases hk1_eq_1 : k₁ - 1 = 0
      · have h_is : List.num_Is (List.replicate (k₁ - 1) I ++ List.replicate (n - k₁) O) =
                    List.num_Is (O :: List.replicate (n - 2) I) := by exact congrArg List.num_Is h_drop
        rw [hk1_eq_1] at h_is
        change List.num_Is (List.replicate (n - k₁) O) = List.num_Is (List.replicate (n - 2) I) at h_is
        rw [List.num_Is_replicate_O, List.num_Is_replicate_I] at h_is
        have h_n_2 : n - 2 = 0 := h_is.symm
        have h_n_le_2 : n ≤ 2 := Nat.le_of_sub_eq_zero h_n_2
        have h_contra : 3 ≤ 2 := Nat.le_trans H h_n_le_2
        contradiction
      · have hk1_sub_pos : 0 < k₁ - 1 := Nat.pos_of_ne_zero hk1_eq_1
        have h_head : List.head? (List.replicate (k₁ - 1) I ++ List.replicate (n - k₁) O) =
                      List.head? (O :: List.replicate (n - 2) I) := by exact congrArg List.head? h_drop
        rw [head_replicate_pos (k₁ - 1) hk1_sub_pos I (List.replicate (n - k₁) O)] at h_head
        change some I = some O at h_head
        contradiction
    · have hk2_pos : 0 < k₂ := Nat.pos_of_ne_zero hk2
      have h_head : List.head? (mkIO n k₁) = List.head? (mkOIOI n k₂) := by rw [h]
      unfold mkIO mkOIOI at h_head
      rw [head_replicate_pos k₁ hk1_pos I (List.replicate (n - k₁) O)] at h_head
      rw [head_replicate_pos k₂ hk2_pos O (I :: O :: List.replicate (n - k₂ - 2) I)] at h_head
      contradiction
end List

namespace List.Vector

open List.Vector

def mkIO (n k : Nat) (Hk : k ≤ n) : List.Vector B n :=
  ⟨List.mkIO n k, List.length_IO n k Hk⟩

lemma wt_IO (n k : Nat) (Hk : k ≤ n) :
  wt (mkIO n k Hk) = k := by
  unfold wt mkIO
  exact List.num_Is_IO n k
def mkIOIO (n k : Nat) (Hkn : k + 2 ≤ n) : List.Vector B n :=
  ⟨List.mkIOIO n k, List.length_IOIO n k Hkn⟩

lemma length_IOIO_le (n k : Nat) (Hnk : k + 2 ≤ n) :
  2 ≤ List.length (List.mkIOIO n k) := by
  rw [List.length_IOIO n k Hnk]
  exact Nat.le_trans (Nat.le_add_left 2 k) Hnk
lemma wt_IOIO (n k : Nat) (Hkn : k + 2 ≤ n) :
  wt (mkIOIO n k Hkn) = k + 1 := by
  unfold wt mkIOIO
  exact List.num_Is_IOIO n k
lemma wt_IOIO_le
  (k : Nat) (Hnk : k + 2 ≤ n) (Hk : k < 1) :
  wt (mkIOIO n k Hnk) ≤ 1 := by
  rw [wt_IOIO n k Hnk]
  exact Hk
lemma le_wt_IOIO
  (k : Nat) (Hnk : k + 2 ≤ n) (Hk : n - 3 < k) :
  n - 1 ≤ wt (mkIOIO n k Hnk) := by
  rw [wt_IOIO n k Hnk]
  have hk_def : n - 3 + 1 ≤ k := Hk
  have hn3 : n - 3 + 1 = n - 2 := by
    have hn3_le : 3 ≤ n := by
      cases hn : n with
      | zero =>
        rw [hn] at Hnk Hk
        have h_k_zero : k = 0 := Nat.eq_zero_of_add_eq_zero_right (Nat.eq_zero_of_le_zero Hnk)
        rw [h_k_zero] at Hk
        contradiction
      | succ n' =>
        cases hn' : n' with
        | zero =>
          rw [hn, hn'] at Hnk Hk
          have h_k_zero : k = 0 := Nat.eq_zero_of_add_eq_zero_right (Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ Hnk))
          rw [h_k_zero] at Hk
          contradiction
        | succ n'' =>
          cases hn'' : n'' with
          | zero =>
            rw [hn, hn', hn''] at Hnk Hk
            have h_k_zero : k = 0 := Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ (Nat.le_of_succ_le_succ Hnk))
            rw [h_k_zero] at Hk
            contradiction
          | succ n''' => exact Nat.le_add_left 3 n'''
    have H_sub : n = n - 3 + 3 := (Nat.sub_add_cancel hn3_le).symm
    nth_rw 2 [H_sub]
    change n - 3 + 1 = n - 3 + 1 + 2 - 2
    rw [Nat.add_sub_cancel]
  rw [hn3] at hk_def
  have hk1 : n - 2 ≤ k := hk_def
  have hk2 : k ≤ n - 2 := Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hnk)
  have heq : k = n - 2 := Nat.le_antisymm hk2 hk1
  have heq2 : k + 1 = n - 2 + 1 := by rw [heq]
  have hn2 : 2 ≤ n := Nat.le_trans (Nat.add_comm 2 k ▸ Nat.le_add_left 2 k) Hnk
  have H3 : n - 2 + 1 = n - 1 := by
    have H4 : n = n - 2 + 2 := (Nat.sub_add_cancel hn2).symm
    nth_rw 2 [H4]
    have H5 : n - 2 + 2 = n - 2 + 1 + 1 := by
      change n - 2 + 2 = n - 2 + (1 + 1)
      rw [← Nat.add_assoc]
    rw [H5, Nat.add_sub_cancel]
  rw [H3] at heq2
  exact Nat.le_of_eq heq2.symm
lemma sDel_IOIO_O (n k : Nat) (Hkn : k + 2 ≤ n) :
  List.Vector.sDel (List.Vector.mkIOIO n k Hkn) k
  = List.Vector.mkIO (n - 1) (k + 1) (Nat.le_sub_of_add_le Hkn) := by
  apply Subtype.ext
  exact List.sDel_IOIO_O n k

lemma sDel_IOIO_I (n k : Nat) (Hkn : k + 2 ≤ n) :
  List.Vector.sDel (List.Vector.mkIOIO n k Hkn) (k + 1)
  = List.Vector.mkIO (n - 1) k (le_of_succ_le (Nat.le_sub_of_add_le Hkn)) := by
  apply Subtype.ext
  exact List.sDel_IOIO_I n k Hkn
lemma sDel_IO_succ_of_lt (n k i : Nat) (Hkn : k + 2 ≤ n) (Hki : i ≤ k) :
  List.Vector.sDel (List.Vector.mkIO n (k + 1) (le_trans (le_succ _) Hkn)) i
  = List.Vector.mkIO (n - 1) k (le_of_succ_le (Nat.le_sub_of_add_le Hkn)) := by
  apply Subtype.ext
  change List.sDel (List.mkIO n (k + 1)) i = List.mkIO (n - 1) k
  unfold List.mkIO
  have H : i < List.length (List.replicate (k + 1) B.I) := by
    rw [List.length_replicate]
    exact Nat.lt_succ_of_le Hki
  rw [List.sDel_append_of_lt (List.replicate (k + 1) B.I) (List.replicate (n - (k + 1)) B.O) i (Nat.succ_le_of_lt H)]
  rw [List.sDel_replicate i B.I (k + 1)]
  have h_sub_1 : k + 1 - 1 = k := Nat.add_sub_cancel k 1
  rw [h_sub_1]
  have h_sub_2 : n - (k + 1) = n - 1 - k := by
    have h1 : n - 1 - k = n - (1 + k) := Nat.sub_sub n 1 k
    rw [h1, Nat.add_comm 1 k]
  rw [h_sub_2]

lemma sDel_IO_succ_of_ge (n k i : Nat) (Hkn : k + 2 ≤ n) (Hki : k < i) (Hin : i < n) :
  List.Vector.sDel (List.Vector.mkIO n (k + 1) (le_trans (le_succ _) Hkn)) i
  = List.Vector.mkIO (n - 1) (k + 1) (Nat.le_sub_of_add_le Hkn) := by
  apply Subtype.ext
  change List.sDel (List.mkIO n (k + 1)) i = List.mkIO (n - 1) (k + 1)
  unfold List.mkIO
  have H : List.length (List.replicate (k + 1) B.I) ≤ i := by
    rw [List.length_replicate]
    exact Hki
  have HY : List.replicate (n - (k + 1)) B.O ≠ [] := by
    intro h
    have h_len : List.length (List.replicate (n - (k + 1)) B.O) = 0 := by rw [h]; rfl
    rw [List.length_replicate] at h_len
    have h_gt : n - (k + 1) > 0 := Nat.sub_pos_of_lt Hkn
    have h_contra := Nat.ne_of_gt h_gt
    exact h_contra h_len
  rw [List.sDel_append_of_ge (List.replicate (k + 1) B.I) (List.replicate (n - (k + 1)) B.O) i H HY]
  rw [List.length_replicate]
  rw [List.sDel_replicate (i - (k + 1)) B.O (n - (k + 1))]
  have h_sub2 : n - (k + 1) - 1 = n - 1 - (k + 1) := by
    have h1 : n - (k + 1) - 1 = n - (k + 1 + 1) := Nat.sub_sub n (k + 1) 1
    have h2 : n - 1 - (k + 1) = n - (1 + (k + 1)) := Nat.sub_sub n 1 (k + 1)
    rw [h1, h2, Nat.add_comm (k + 1) 1]
  rw [h_sub2]

lemma dS_IO_subset (n k : Nat) (Hkn : k + 2 ≤ n) :
  dS (List.Vector.mkIO n (k + 1) (le_trans (le_succ _) Hkn)) ⊆ dS (List.Vector.mkIOIO n k Hkn) := by
  intro X hX
  rw [mem_dS] at hX
  rcases hX with ⟨i, hi, hXi⟩
  by_cases hlt : i ≤ k
  · rw [sDel_IO_succ_of_lt _ _ _ Hkn hlt] at hXi
    rw [mem_dS]
    use k + 1
    have h_bounds : k + 1 ≤ n - 1 := by
      have hk1 : k + 2 ≤ n := Hkn
      exact Nat.le_sub_of_add_le hk1
    use h_bounds
    have h_sdel := sDel_IOIO_I n k Hkn
    rw [h_sdel]
    exact hXi
  · have hnlt : k < i := Nat.lt_of_not_le hlt
    have hn_pos : 0 < n := Nat.lt_of_lt_of_le (by decide) (Nat.le_trans (Nat.le_add_left 2 k) Hkn)
    have hn_sub : n - 1 < n := Nat.sub_lt hn_pos (by decide)
    have hin : i < n := Nat.lt_of_le_of_lt hi hn_sub
    rw [sDel_IO_succ_of_ge _ _ _ Hkn hnlt hin] at hXi
    rw [mem_dS]
    use k
    have h_bounds : k ≤ n - 1 := by
      have hk1 : k + 2 ≤ n := Hkn
      have hk2 : k + 1 ≤ n - 1 := Nat.le_sub_of_add_le hk1
      exact Nat.le_trans (Nat.le_succ _) hk2
    use h_bounds
    have h_sdel := sDel_IOIO_O n k Hkn
    rw [h_sdel]
    exact hXi
def mkOI (n k : Nat) (Hk : k ≤ n) : List.Vector B n :=
  ⟨List.mkOI n k, List.length_OI n k Hk⟩

lemma wt_OI (n k : Nat) (Hk : k ≤ n) :
  wt (mkOI n k Hk) = n - k := by
  unfold wt mkOI
  exact List.num_Is_OI n k
def mkOIOI (n k : Nat) (Hkn : k + 2 ≤ n) : List.Vector B n :=
  ⟨List.mkOIOI n k, List.length_OIOI n k Hkn⟩

lemma length_OIOI_le (n k : Nat) (Hnk : k + 2 ≤ n) :
  2 ≤ List.length (List.mkOIOI n k) := by
  rw [List.length_OIOI n k Hnk]
  exact Nat.le_trans (Nat.le_add_left 2 k) Hnk

lemma wt_OIOI (n k : Nat) (Hkn : k + 2 ≤ n) :
  wt (mkOIOI n k Hkn) = n - k - 1 := by
  have h1 : List.num_Is (List.mkOIOI n k) = n - k - 2 + 1 := List.num_Is_OIOI n k
  have h2 : n - k - 2 + 1 = n - k - 1 := by
    have h3 : 2 ≤ n - k := Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hkn)
    have h4 : n - k = n - k - 2 + 2 := (Nat.sub_add_cancel h3).symm
    nth_rw 2 [h4]
    change n - k - 2 + 1 = n - k - 2 + 1 + 1 - 1
    rw [Nat.add_sub_cancel]
  rw [h2] at h1
  exact h1

lemma le_wt_OIOI
  (k : Nat) (Hnk : k + 2 ≤ n) (Hk : k < 1) :
  n - 1 ≤ wt (mkOIOI n k Hnk) := by
  rw [wt_OIOI n k Hnk]
  have hk0 : k = 0 := Nat.eq_zero_of_le_zero (Nat.le_of_lt_succ Hk)
  rw [hk0, Nat.sub_zero]

lemma wt_OIOI_le
  (k : Nat) (Hnk : k + 2 ≤ n) (Hk : n - 3 < k) :
  wt (mkOIOI n k Hnk) ≤ 1 := by
  rw [wt_OIOI n k Hnk]
  have hk_def : n - 3 + 1 ≤ k := Hk
  have hn3 : n - 3 + 1 = n - 2 := by
    have hn3_le : 3 ≤ n := by
      cases hn : n with
      | zero =>
        rw [hn] at Hnk Hk
        have h_k_zero : k = 0 := Nat.eq_zero_of_add_eq_zero_right (Nat.eq_zero_of_le_zero Hnk)
        rw [h_k_zero] at Hk
        contradiction
      | succ n' =>
        cases hn' : n' with
        | zero =>
          rw [hn, hn'] at Hnk Hk
          have h_k_zero : k = 0 := Nat.eq_zero_of_add_eq_zero_right (Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ Hnk))
          rw [h_k_zero] at Hk
          contradiction
        | succ n'' =>
          cases hn'' : n'' with
          | zero =>
            rw [hn, hn', hn''] at Hnk Hk
            have h_k_zero : k = 0 := Nat.eq_zero_of_le_zero (Nat.le_of_succ_le_succ (Nat.le_of_succ_le_succ Hnk))
            rw [h_k_zero] at Hk
            contradiction
          | succ n''' => exact Nat.le_add_left 3 n'''
    have H_sub : n = n - 3 + 3 := (Nat.sub_add_cancel hn3_le).symm
    nth_rw 2 [H_sub]
    change n - 3 + 1 = n - 3 + 1 + 2 - 2
    rw [Nat.add_sub_cancel]
  rw [hn3] at hk_def
  have hk1 : n - 2 ≤ k := hk_def
  have hk2 : k ≤ n - 2 := Nat.le_sub_of_add_le (Nat.add_comm 2 k ▸ Hnk)
  have heq : k = n - 2 := Nat.le_antisymm hk2 hk1
  rw [heq]
  have hn2 : 2 ≤ n := Nat.le_trans (Nat.add_comm 2 k ▸ Nat.le_add_left 2 k) Hnk
  have H3 : n - (n - 2) - 1 = 1 := by
    have H4 : n = n - 2 + 2 := (Nat.sub_add_cancel hn2).symm
    nth_rw 1 [H4]
    rw [Nat.add_sub_cancel_left]
  rw [H3]
lemma sDel_OIOI_I (n k : Nat) (Hkn : k + 2 ≤ n) :
  List.Vector.sDel (List.Vector.mkOIOI n k Hkn) k
  = List.Vector.mkOI (n - 1) (k + 1) (Nat.le_sub_of_add_le Hkn) := by
  apply Subtype.ext
  exact List.sDel_OIOI_I n k
lemma sDel_OIOI_O (n k : Nat) (Hkn : k + 2 ≤ n) :
  List.Vector.sDel (List.Vector.mkOIOI n k Hkn) (k + 1)
  = List.Vector.mkOI (n - 1) k (le_of_succ_le (Nat.le_sub_of_add_le Hkn)) := by
  apply Subtype.ext
  exact List.sDel_OIOI_O n k Hkn
lemma sDel_OI_succ_of_lt (n k i : Nat) (Hkn : k + 2 ≤ n) (Hki : i ≤ k) :
  List.Vector.sDel (List.Vector.mkOI n (k + 1) (le_trans (le_succ _) Hkn)) i
  = List.Vector.mkOI (n - 1) k (le_of_succ_le (Nat.le_sub_of_add_le Hkn)) := by
  apply Subtype.ext
  change List.sDel (List.mkOI n (k + 1)) i = List.mkOI (n - 1) k
  unfold List.mkOI
  have H : i < List.length (List.replicate (k + 1) B.O) := by
    rw [List.length_replicate]
    exact Nat.lt_succ_of_le Hki
  rw [List.sDel_append_of_lt (List.replicate (k + 1) B.O) (List.replicate (n - (k + 1)) B.I) i (Nat.succ_le_of_lt H)]
  rw [List.sDel_replicate i B.O (k + 1)]
  have h_sub_1 : k + 1 - 1 = k := Nat.add_sub_cancel k 1
  rw [h_sub_1]
  have h_sub_2 : n - (k + 1) = n - 1 - k := by
    have h1 : n - 1 - k = n - (1 + k) := Nat.sub_sub n 1 k
    rw [h1, Nat.add_comm 1 k]
  rw [h_sub_2]

lemma sDel_OI_succ_of_ge (n k i : Nat) (Hkn : k + 2 ≤ n) (Hki : k < i) (Hin : i < n) :
  List.Vector.sDel (List.Vector.mkOI n (k + 1) (le_trans (le_succ _) Hkn)) i
  = List.Vector.mkOI (n - 1) (k + 1) (Nat.le_sub_of_add_le Hkn) := by
  apply Subtype.ext
  change List.sDel (List.mkOI n (k + 1)) i = List.mkOI (n - 1) (k + 1)
  unfold List.mkOI
  have H : List.length (List.replicate (k + 1) B.O) ≤ i := by
    rw [List.length_replicate]
    exact Hki
  have HY : List.replicate (n - (k + 1)) B.I ≠ [] := by
    intro h
    have h_len : List.length (List.replicate (n - (k + 1)) B.I) = 0 := by rw [h]; rfl
    rw [List.length_replicate] at h_len
    have h_gt : n - (k + 1) > 0 := Nat.sub_pos_of_lt Hkn
    have h_contra := Nat.ne_of_gt h_gt
    exact h_contra h_len
  rw [List.sDel_append_of_ge (List.replicate (k + 1) B.O) (List.replicate (n - (k + 1)) B.I) i H HY]
  rw [List.length_replicate]
  have h_sub : i - (k + 1) < n - (k + 1) := Nat.sub_lt_sub_right Hki Hin
  rw [List.sDel_replicate (i - (k + 1)) B.I (n - (k + 1))]
  have h_sub2 : n - (k + 1) - 1 = n - 1 - (k + 1) := by
    have h1 : n - (k + 1) - 1 = n - (k + 1 + 1) := Nat.sub_sub n (k + 1) 1
    have h2 : n - 1 - (k + 1) = n - (1 + (k + 1)) := Nat.sub_sub n 1 (k + 1)
    rw [h1, h2, Nat.add_comm (k + 1) 1]
  rw [h_sub2]

lemma dS_OI_subset (n k : Nat) (Hkn : k + 2 ≤ n) :
  dS (List.Vector.mkOI n (k + 1) (le_trans (le_succ _) Hkn)) ⊆ dS (List.Vector.mkOIOI n k Hkn) := by
  intro X hX
  rw [mem_dS] at hX
  rcases hX with ⟨i, hi, hXi⟩
  by_cases hlt : i ≤ k
  · rw [sDel_OI_succ_of_lt _ _ _ Hkn hlt] at hXi
    rw [mem_dS]
    use k + 1
    have h_bounds : k + 1 ≤ n - 1 := by
      have hk1 : k + 2 ≤ n := Hkn
      exact Nat.le_sub_of_add_le hk1
    use h_bounds
    have h_sdel := sDel_OIOI_O n k Hkn
    rw [← h_sdel] at hXi
    exact hXi
  · have hnlt : k < i := Nat.lt_of_not_le hlt
    have hn_pos : 0 < n := Nat.lt_of_lt_of_le (by decide) (Nat.le_trans (Nat.le_add_left 2 k) Hkn)
    have hn_sub : n - 1 < n := Nat.sub_lt hn_pos (by decide)
    have hin : i < n := Nat.lt_of_le_of_lt hi hn_sub
    rw [sDel_OI_succ_of_ge _ _ _ Hkn hnlt hin] at hXi
    rw [mem_dS]
    use k
    have h_bounds : k ≤ n - 1 := by
      have hk1 : k + 2 ≤ n := Hkn
      have hk2 : k + 1 ≤ n - 1 := Nat.le_sub_of_add_le hk1
      exact Nat.le_trans (Nat.le_succ _) hk2
    use h_bounds
    have h_sdel := sDel_OIOI_I n k Hkn
    rw [← h_sdel] at hXi
    exact hXi
lemma OI_ne_OIOI (n k₁ k₂ : Nat) (Hk₁ : k₁ ≤ n) (Hk₂ : k₂ + 2 ≤ n):
  List.Vector.mkOI n k₁ Hk₁ ≠ List.Vector.mkOIOI n k₂ Hk₂ := by
  intro h
  have h_val : List.mkOI n k₁ = List.mkOIOI n k₂ := congrArg Subtype.val h
  exact List.OI_ne_OIOI n k₁ k₂ h_val
lemma OI_ne_IOIO (n k₁ k₂ : Nat)
  (H : 3 ≤ n) (Hk₁ : k₁ ≤ n) (Hk₂ : k₂ + 2 ≤ n) :
  List.Vector.mkOI n k₁ Hk₁ ≠ List.Vector.mkIOIO n k₂ Hk₂ := by
  intro h
  have h_val : List.mkOI n k₁ = List.mkIOIO n k₂ := congrArg Subtype.val h
  exact List.OI_ne_IOIO n k₁ k₂ H h_val
lemma IO_ne_IOIO (n k₁ k₂ : Nat) (Hk₁ : k₁ ≤ n) (Hk₂ : k₂ + 2 ≤ n):
  List.Vector.mkIO n k₁ Hk₁ ≠ List.Vector.mkIOIO n k₂ Hk₂ := by
  intro h
  have h_val : List.mkIO n k₁ = List.mkIOIO n k₂ := congrArg Subtype.val h
  exact List.IO_ne_IOIO n k₁ k₂ h_val
lemma IO_ne_OIOI (n k₁ k₂ : Nat)
  (H : 3 ≤ n) (Hk₁ : k₁ ≤ n) (Hk₂ : k₂ + 2 ≤ n) :
  List.Vector.mkIO n k₁ Hk₁ ≠ List.Vector.mkOIOI n k₂ Hk₂ := by
  intro h
  have h_val : List.mkIO n k₁ = List.mkOIOI n k₂ := congrArg Subtype.val h
  exact List.IO_ne_OIOI n k₁ k₂ H h_val
lemma flip_append_list (X Y : List B) :
  B.List.flip (X ++ Y) = B.List.flip X ++ B.List.flip Y := by
  induction X with
  | nil => rfl
  | cons x X' ih =>
    change B.flip x :: B.List.flip (X' ++ Y) = (B.flip x :: B.List.flip X') ++ B.List.flip Y
    rw [ih]
    rfl

lemma flip_replicate_O (k : Nat) :
  B.List.flip (List.replicate k B.O) = List.replicate k B.I := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change B.flip B.O :: B.List.flip (List.replicate k B.O) = B.I :: List.replicate k B.I
    rw [ih]
    rfl

lemma flip_replicate_I (k : Nat) :
  B.List.flip (List.replicate k B.I) = List.replicate k B.O := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change B.flip B.I :: B.List.flip (List.replicate k B.I) = B.O :: List.replicate k B.O
    rw [ih]
    rfl

lemma flip_OIOI (n k : Nat) (Hkn : k + 2 ≤ n) :
  B.Vector.flip (List.Vector.mkOIOI n k Hkn) = List.Vector.mkIOIO n k Hkn := by
  apply Subtype.ext
  change B.List.flip (List.mkOIOI n k) = List.mkIOIO n k
  unfold List.mkOIOI List.mkIOIO
  rw [flip_append_list]
  rw [flip_replicate_O]
  change List.replicate k B.I ++ (B.flip B.I :: B.flip B.O :: B.List.flip (List.replicate (n - k - 2) B.I)) = _
  rw [flip_replicate_I]
  rfl

lemma flip_IOIO (n k : Nat) (Hkn : k + 2 ≤ n) :
  B.Vector.flip (List.Vector.mkIOIO n k Hkn) = List.Vector.mkOIOI n k Hkn := by
  apply Subtype.ext
  change B.List.flip (List.mkIOIO n k) = List.mkOIOI n k
  unfold List.mkIOIO List.mkOIOI
  rw [flip_append_list]
  rw [flip_replicate_I]
  change List.replicate k B.O ++ (B.flip B.O :: B.flip B.I :: B.List.flip (List.replicate (n - k - 2) B.O)) = _
  rw [flip_replicate_O]
  rfl
end List.Vector

namespace Finset

open Finset

noncomputable def insert_repO (C : Finset (List.Vector B n)) :=
  insert (List.Vector.replicate n O ) (filter (Ici_wt 2) C)

lemma repO_not_mem (C : Finset (List.Vector B n)):
  List.Vector.replicate n O ∉ filter (Ici_wt 2) C := by
  intro h
  rw [mem_filter] at h
  have h_wt := h.right
  unfold Ici_wt at h_wt
  change 2 ≤ List.num_Is (List.replicate n O) at h_wt
  rw [List.num_Is_replicate_O] at h_wt
  contradiction
lemma list_num_Is_sDel_le (X : List B) (i : Nat) :
  List.num_Is X ≤ List.num_Is (List.sDel X i) + 1 := by
  induction X generalizing i with
  | nil =>
    change 0 ≤ 0 + 1
    exact Nat.zero_le 1
  | cons x X' ih =>
    cases i with
    | zero =>
      rw [List.sDel_zero]
      cases x <;> simp [List.num_Is]
    | succ j =>
      by_cases hX' : X' = []
      · subst hX'
        rw [List.sDel_singleton]
        cases x <;> simp [List.num_Is]
      · rw [List.sDel_cons x X' j hX']
        cases x
        · change List.num_Is X' ≤ List.num_Is (List.sDel X' j) + 1
          apply ih j
        · change List.num_Is X' + 1 ≤ List.num_Is (List.sDel X' j) + 1 + 1
          exact Nat.add_le_add_right (ih j) 1

lemma list_num_Os_sDel_le (X : List B) (i : Nat) :
  List.num_Os X ≤ List.num_Os (List.sDel X i) + 1 := by
  induction X generalizing i with
  | nil =>
    change 0 ≤ 0 + 1
    exact Nat.zero_le 1
  | cons x X' ih =>
    cases i with
    | zero =>
      rw [List.sDel_zero]
      cases x <;> simp [List.num_Os]
    | succ j =>
      by_cases hX' : X' = []
      · subst hX'
        rw [List.sDel_singleton]
        cases x <;> simp [List.num_Os]
      · rw [List.sDel_cons x X' j hX']
        cases x
        · change List.num_Os X' + 1 ≤ List.num_Os (List.sDel X' j) + 1 + 1
          exact Nat.add_le_add_right (ih j) 1
        · change List.num_Os X' ≤ List.num_Os (List.sDel X' j) + 1
          apply ih j

lemma DelCode_insert_repO
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_DelCode (insert_repO C) := by
  unfold insert_repO
  apply DelCode_insert
  · exact DelCode_filter C HC _
  · intro c hc
    rw [mem_filter] at hc
    have hc_in := hc.left
    have hc_wt : 2 ≤ wt c := hc.right
    rw [← Finset.disjoint_iff_inter_eq_empty, Finset.disjoint_left]
    intro x hx_O hx_c
    rw [List.Vector.mem_dS] at hx_O hx_c
    rcases hx_O with ⟨i, hi, hx_eq_O⟩
    rcases hx_c with ⟨j, hj, hx_eq_c⟩
    have h_wt_x_O : wt x = 0 := by
      rw [hx_eq_O, wt]
      change List.num_Is (List.sDel (List.replicate n B.O) i) = 0
      rw [List.sDel_replicate i B.O n]
      exact List.num_Is_replicate_O (n - 1)
    have h_wt_x_c : 1 ≤ wt x := by
      rw [hx_eq_c, wt]
      have h1 : List.num_Is c.val ≤ List.num_Is (List.sDel c.val j) + 1 := list_num_Is_sDel_le c.val j
      have h2 : 2 ≤ List.num_Is c.val := hc_wt
      have h3 : 2 ≤ List.num_Is (List.sDel c.val j) + 1 := Nat.le_trans h2 h1
      exact Nat.le_of_succ_le_succ h3
    rw [h_wt_x_O] at h_wt_x_c
    contradiction
noncomputable def insert_repI (C : Finset (List.Vector B n)) :=
  insert (List.Vector.replicate n I ) (filter (Iic_wt (n - 2)) C)

lemma repI_not_mem (Hn : 2 ≤ n) (C : Finset (List.Vector B n)):
  List.Vector.replicate n I ∉ filter (Iic_wt (n - 2)) C := by
  intro h
  rw [mem_filter] at h
  have h_wt := h.right
  unfold Iic_wt at h_wt
  change List.num_Is (List.replicate n I) ≤ n - 2 at h_wt
  rw [List.num_Is_replicate_I] at h_wt
  have h_contra : ¬ (n ≤ n - 2) := by
    intro hn
    have hn_pos : 0 < n := Nat.lt_of_lt_of_le (by decide) Hn
    have h_n_2 : n - 2 < n := Nat.sub_lt hn_pos (by decide)
    exact Nat.lt_irrefl _ (Nat.lt_of_le_of_lt hn h_n_2)
  contradiction
lemma DelCode_insert_repI (Hn : 2 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_DelCode (insert_repI C) := by
  unfold insert_repI
  apply DelCode_insert
  · exact DelCode_filter C HC _
  · intro c hc
    rw [mem_filter] at hc
    have hc_in := hc.left
    have hc_wt : wt c ≤ n - 2 := hc.right
    rw [← Finset.disjoint_iff_inter_eq_empty, Finset.disjoint_left]
    intro x hx_I hx_c
    rw [List.Vector.mem_dS] at hx_I hx_c
    rcases hx_I with ⟨i, hi, hx_eq_I⟩
    rcases hx_c with ⟨j, hj, hx_eq_c⟩
    have h_wt_x_I : List.num_Os x.val = 0 := by
      have h_val : x.val = List.sDel (List.replicate n B.I) i := congrArg Subtype.val hx_eq_I
      rw [h_val]
      rw [List.sDel_replicate i B.I n]
      exact List.num_Os_replicate_I (n - 1)
    have h_wt_x_c : 1 ≤ List.num_Os x.val := by
      have h_val : x.val = List.sDel c.val j := congrArg Subtype.val hx_eq_c
      rw [h_val]
      have h1 : List.num_Os c.val ≤ List.num_Os (List.sDel c.val j) + 1 := list_num_Os_sDel_le c.val j
      have h2 : 2 ≤ List.num_Os c.val := by
        have hc_wt_val : List.num_Is c.val ≤ n - 2 := hc_wt
        have h_add : List.num_Is c.val + 2 ≤ n - 2 + 2 := Nat.add_le_add_right hc_wt_val 2
        have h_len : List.num_Is c.val + List.num_Os c.val = n := by
          have hl := List.num_Os_add_num_Is_eq_length c.val
          have hc_prop : c.val.length = n := c.property
          rw [hc_prop] at hl
          rw [Nat.add_comm] at hl
          exact hl
        have hn_eq : n - 2 + 2 = n := Nat.sub_add_cancel Hn
        rw [hn_eq] at h_add
        have h_eq_le : n ≤ List.num_Is c.val + List.num_Os c.val := Nat.le_of_eq h_len.symm
        have h_add3 : List.num_Is c.val + 2 ≤ List.num_Is c.val + List.num_Os c.val := Nat.le_trans h_add h_eq_le
        exact Nat.le_of_add_le_add_left h_add3
      have h3 : 2 ≤ List.num_Os (List.sDel c.val j) + 1 := Nat.le_trans h2 h1
      exact Nat.le_of_succ_le_succ h3
    rw [h_wt_x_I] at h_wt_x_c
    contradiction
lemma DC_insert_repI_repO (Hn : 2 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_DelCode (insert_repI (insert_repO C)) := by
  apply DelCode_insert_repI Hn
  apply DelCode_insert_repO C HC
lemma card_insert_repI_repO (Hn : 2 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  Finset.card (insert_repI (insert_repO C))
  = Finset.card (filter (Icc_wt 2 (n - 2)) C) + 2 := by
  unfold insert_repI
  rw [Finset.card_insert_of_notMem]
  · unfold insert_repO
    have h_filter_ext : filter (Iic_wt (n - 2)) (filter (Ici_wt 2) C) = filter (Icc_wt 2 (n - 2)) C := by
      apply Finset.ext
      intro x
      rw [mem_filter, mem_filter, mem_filter]
      apply Iff.intro
      · rintro ⟨⟨hC, h2⟩, hn2⟩
        exact ⟨hC, ⟨h2, hn2⟩⟩
      · rintro ⟨hC, h2, hn2⟩
        exact ⟨⟨hC, h2⟩, hn2⟩
    rw [Finset.filter_insert]
    have h_if : Iic_wt (n - 2) (List.Vector.replicate n B.O) := by
      unfold Iic_wt
      change List.num_Is (List.replicate n B.O) ≤ n - 2
      rw [List.num_Is_replicate_O]
      exact Nat.zero_le _
    rw [if_pos h_if]
    rw [Finset.card_insert_of_notMem]
    · rw [h_filter_ext]
    · rw [mem_filter]
      intro h
      have h_not_mem := repO_not_mem C
      exact h_not_mem h.1
  · exact repI_not_mem Hn (insert_repO C)
lemma le_card_insert_repI_repO (Hn : 2 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  Finset.card C ≤ Finset.card (insert_repI (insert_repO C)) := by
  rw [card_insert_repI_repO Hn C HC]
  exact card_le_filter_Icc HC
noncomputable def W22 (n : Nat) : Finset (List.Vector B n) :=
  filter (@Icc_wt n 2 (n - 2)) univ

lemma mem_W22 {n : Nat} (X : List.Vector B n) :
  X ∈ W22 n ↔ Icc_wt 2 (n - 2) X := by
  unfold W22
  rw [mem_filter]
  apply Iff.intro
  · intro h
    exact h.right
  · intro h
    exact ⟨mem_univ X, h⟩
lemma not_mem_W22_of_le
  {n : Nat} (X : List.Vector B n) (H : wt X ≤ 1):
  X ∉ W22 n := by
  intro h
  rw [mem_W22] at h
  have h2 : 2 ≤ wt X := h.left
  have h_absurd := Nat.lt_of_le_of_lt h2 (Nat.lt_succ_of_le H)
  exact Nat.lt_irrefl _ h_absurd
lemma not_mem_W22_of_ge
  {n : Nat} (Hn : 2 ≤ n) (X : List.Vector B n) (H : n - 1 ≤ wt X):
  X ∉ W22 n := by
  intro h
  rw [mem_W22] at h
  have hn2 : wt X ≤ n - 2 := h.right
  have h_absurd : n - 1 ≤ n - 2 := Nat.le_trans H hn2
  have h_lt : n - 2 < n - 1 := by
    have hn_pos : 0 < n := Nat.lt_of_lt_of_le (by decide) Hn
    have h_2_1 : n - 2 = n - 1 - 1 := by
      have hsub : n - 2 = n - (1 + 1) := rfl
      rw [hsub, Nat.sub_sub]
    rw [h_2_1]
    exact Nat.sub_lt (Nat.sub_pos_of_lt Hn) (by decide)
  have h_absurd2 := Nat.lt_of_le_of_lt h_absurd h_lt
  exact Nat.lt_irrefl _ h_absurd2
lemma W22_of_le_2 {n : Nat} (Hn : n ≤ 2) :
  W22 n = ∅ := by
  rw [← Finset.subset_empty]
  intro x hx
  rw [mem_W22] at hx
  unfold Icc_wt at hx
  have h2 : 2 ≤ wt x := hx.left
  have hn2 : wt x ≤ n - 2 := hx.right
  have h_zero : n - 2 = 0 := Nat.sub_eq_zero_of_le Hn
  rw [h_zero] at hn2
  have h_absurd := Nat.le_trans h2 hn2
  exact False.elim (Nat.not_le_of_gt (by decide) h_absurd)
lemma flip_W22 {n : Nat} (Hn : 2 ≤ n) :
  Finset.image B.Vector.flip (W22 n) = W22 n := by
  apply Finset.ext
  intro x
  rw [Finset.mem_image]
  apply Iff.intro
  · rintro ⟨y, hy, hyx⟩
    rw [mem_W22] at hy ⊢
    rw [← hyx]
    unfold Icc_wt at hy ⊢
    rw [wt_flip]
    have hy1 : 2 ≤ wt y := hy.left
    have hy2 : wt y ≤ n - 2 := hy.right
    constructor
    · have hn_eq : n = n - 2 + 2 := (Nat.sub_add_cancel Hn).symm
      have hsub : 2 ≤ n - (n - 2) := by
        nth_rw 1 [hn_eq]
        exact Nat.le_of_eq (Nat.add_sub_cancel_left (n - 2) 2).symm
      exact Nat.le_trans hsub (Nat.sub_le_sub_left hy2 n)
    · exact Nat.sub_le_sub_left hy1 n
  · intro hx
    use B.Vector.flip x
    constructor
    · rw [mem_W22] at hx ⊢
      unfold Icc_wt at hx ⊢
      rw [wt_flip]
      have hx1 : 2 ≤ wt x := hx.left
      have hx2 : wt x ≤ n - 2 := hx.right
      constructor
      · have hn_eq : n = n - 2 + 2 := (Nat.sub_add_cancel Hn).symm
        have hsub : 2 ≤ n - (n - 2) := by
          nth_rw 1 [hn_eq]
          exact Nat.le_of_eq (Nat.add_sub_cancel_left (n - 2) 2).symm
        exact Nat.le_trans hsub (Nat.sub_le_sub_left hx2 n)
      · exact Nat.sub_le_sub_left hx1 n
    · exact B.Vector.flip_flip x
lemma filter_Icc_wt
  (C : Finset (List.Vector B n)) (HC : C ⊆ W22 n) :
  filter (Icc_wt 2 (n - 2)) C = C := by
  apply Finset.Subset.antisymm
  · exact filter_subset _ _
  · intro c hc
    have h : c ∈ filter (Icc_wt 2 (n - 2)) univ := HC hc
    rw [mem_filter] at h ⊢
    exact ⟨hc, h.right⟩
lemma card_DCs_sub_W22_le (Hn : 2 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (HC' : is_optimal C HC) :
  is_card_DCs_sub_le (W22 n) (Finset.card C - 2) := by
  intro C' hCS hC'
  have h : Finset.card C' + 2 ≤ Finset.card C := by
    apply le_trans _ (HC' (insert_repI (insert_repO C')) (DC_insert_repI_repO Hn C' hC'))
    rw [card_insert_repI_repO Hn C' hC']
    rw [filter_Icc_wt C' hCS]
  exact Nat.le_sub_of_add_le h
lemma IO_mem_W22 (Hn : 3 ≤ n) (k : Fin (n - 1)) (Hk : 1 ≤ k.1) (Hk' : k.1 ≤ n - 3) :
  List.Vector.mkIO n (k + 1)  (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))) ∈ W22 n := by
  rw [mem_W22]
  apply And.intro
  · rw [List.Vector.wt_IO]
    exact Nat.succ_le_succ Hk
  · rw [List.Vector.wt_IO]
    have h1 : k.1 + 1 ≤ n - 3 + 1 := Nat.add_le_add_right Hk' 1
    have h2 : n - 3 + 1 = n - 2 := by
      have h3 : n = n - 3 + 3 := (Nat.sub_add_cancel Hn).symm
      nth_rw 2 [h3]
      rfl
    rw [h2] at h1
    exact h1
lemma IO_mem_W22' (Hn : 4 ≤ n) :
  List.Vector.mkIO n 2 (le_of_succ_le (le_of_succ_le Hn)) ∈ W22 n := by
  rw [mem_W22]
  apply And.intro
  · rw [List.Vector.wt_IO]
  · rw [List.Vector.wt_IO]
    have h3 : 2 ≤ n - 4 + 2 := by
      have h4 : 2 + (n - 4) = n - 4 + 2 := Nat.add_comm 2 (n - 4)
      rw [← h4]
      exact Nat.le_add_right 2 (n - 4)
    have hn_eq : n = n - 4 + 4 := (Nat.sub_add_cancel Hn).symm
    have h2 : n - 2 = n - 4 + 2 := by
      nth_rw 1 [hn_eq]
      rfl
    rw [h2]
    exact h3
lemma OI_mem_W22 (Hn : 3 ≤ n) (k : Fin (n - 1)) (Hk : 1 ≤ k.1) (Hk' : k.1 ≤ n - 3) :
  List.Vector.mkOI n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))) ∈ W22 n := by
  rw [mem_W22]
  apply And.intro
  · rw [List.Vector.wt_OI]
    have h1 : k.1 + 3 ≤ n := by
      have h2 : k.1 + 3 ≤ n - 3 + 3 := Nat.add_le_add_right Hk' 3
      have h3 : n - 3 + 3 = n := Nat.sub_add_cancel Hn
      rw [h3] at h2
      exact h2
    have h4 : k.1 + 1 + 2 ≤ n := by
      have h5 : k.1 + 1 + 2 = k.1 + 3 := rfl
      rw [h5]
      exact h1
    have h6 : 2 + (k.1 + 1) ≤ n := by
      rw [Nat.add_comm 2]
      exact h4
    exact Nat.le_sub_of_add_le h6
  · rw [List.Vector.wt_OI]
    have h1 : 2 ≤ k.1 + 1 := Nat.add_le_add_right Hk 1
    exact Nat.sub_le_sub_left h1 n
lemma optimal_of_W22
  {n : Nat} {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  (H : ∀ C' ⊆ W22 n, is_DelCode C' → Finset.card C' + 2 ≤ Finset.card C) :
  is_optimal C HC := by
  apply optimal_of_div_wt HC
  exact H
lemma optimal_of_div_wt' (Hn : 4 ≤ n)
  {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  (HC' : is_card_DCs_sub_le (W22 n) (Finset.card C - 2)) :
  is_optimal C HC := by
  have Hn' : 2 ≤ n := Nat.le_trans (by decide) Hn
  intro C' hC'
  apply Nat.le_trans (le_card_insert_repI_repO Hn' C' hC')
  rw [card_insert_repI_repO Hn' C' hC']
  have h : 1 ≤ Finset.card C - 2 := by
    have h_singleton_le : Finset.card {List.Vector.mkIO n 2 (Nat.le_trans (by decide) Hn)} ≤ Finset.card C - 2 := by
      apply HC'
      · intro x hx
        rw [Finset.mem_singleton] at hx
        rw [hx]
        exact IO_mem_W22' Hn
      · exact DelCode_singleton _
    rw [Finset.card_singleton] at h_singleton_le
    exact h_singleton_le
  have h2 : 2 ≤ Finset.card C := by
    cases hC_card : Finset.card C with
    | zero => rw [hC_card] at h; contradiction
    | succ n' =>
      cases hn' : n' with
      | zero => rw [hC_card, hn'] at h; contradiction
      | succ n'' => exact Nat.le_add_left 2 n''
  have h_A_le : Finset.card (filter (Icc_wt 2 (n - 2)) C') ≤ Finset.card C - 2 := by
    apply HC'
    · intro x hx
      unfold W22
      rw [mem_filter] at hx
      rw [mem_filter]
      exact ⟨Finset.mem_univ x, hx.right⟩
    · apply DelCode_filter _ hC'
  have hn_eq : Finset.card C = Finset.card C - 2 + 2 := (Nat.sub_add_cancel h2).symm
  rw [hn_eq]
  exact Nat.add_le_add_right h_A_le 2
lemma card_DCs_sub_le_of_optimal (Hn : 2 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) (HC' : is_optimal C HC) :
  is_card_DCs_sub_le (W22 n) (Finset.card C - 2) := by
  intro C' hCS hC'
  have h : Finset.card C' + 2 ≤ Finset.card C := by
    apply Nat.le_trans _ (HC' (insert_repI (insert_repO C')) (DC_insert_repI_repO Hn C' hC'))
    rw [card_insert_repI_repO Hn C' hC']
    rw [filter_Icc_wt _ hCS]
  exact Nat.le_sub_of_add_le h
lemma optimal_iff_W22 (Hn : 4 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_optimal C HC ↔ is_card_DCs_sub_le (W22 n) (Finset.card C - 2) := by
  apply Iff.intro
  · exact card_DCs_sub_le_of_optimal (Nat.le_trans (by decide) Hn) C HC
  · exact optimal_of_div_wt' Hn HC
def Repl_sub (n : Nat) (k : Fin (n - 1)) : Finset (List.Vector B n) :=
  { List.Vector.mkOIOI n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)),
   List.Vector.mkIOIO n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)) }

lemma flip_Repl_sub (n : Nat) (k : Fin (n - 1)) :
  Finset.image B.Vector.flip (Repl_sub n k) = Repl_sub n k := by
  unfold Repl_sub
  apply Finset.ext
  intro x
  rw [Finset.mem_image]
  apply Iff.intro
  · rintro ⟨y, hy, hyx⟩
    rw [Finset.mem_insert, Finset.mem_singleton] at hy
    rw [Finset.mem_insert, Finset.mem_singleton]
    cases hy with
    | inl h1 =>
      right
      rw [← hyx, h1, List.Vector.flip_OIOI]
    | inr h2 =>
      left
      rw [← hyx, h2, List.Vector.flip_IOIO]
  · intro hx
    rw [Finset.mem_insert, Finset.mem_singleton] at hx
    cases hx with
    | inl h1 =>
      use List.Vector.mkIOIO n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))
      constructor
      · rw [Finset.mem_insert, Finset.mem_singleton]
        right; rfl
      · rw [h1, List.Vector.flip_IOIO]
    | inr h2 =>
      use List.Vector.mkOIOI n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))
      constructor
      · rw [Finset.mem_insert, Finset.mem_singleton]
        left; rfl
      · rw [h2, List.Vector.flip_OIOI]
def Repl (n : Nat) : Finset (List.Vector B n) :=
  Finset.biUnion (@univ (Fin (n - 1)) _) (Repl_sub n)

lemma mem_Repl (X : List.Vector B n) :
  X ∈ Repl n ↔ ∃ k : Fin (n - 1), X ∈ Repl_sub n k := by
  unfold Repl
  rw [Finset.mem_biUnion]
  apply Iff.intro
  · rintro ⟨k, _, hk⟩
    exact ⟨k, hk⟩
  · rintro ⟨k, hk⟩
    exact ⟨k, Finset.mem_univ _, hk⟩
lemma mem_Repl'
  (X : List.Vector B n) (H : X ∈ Repl n) :
  ∃ k : Fin (n - 1),
  (X = List.Vector.mkOIOI n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))
  ∨ X = List.Vector.mkIOIO n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)) ) := by
  rw [mem_Repl] at H
  cases H with
  | intro k Hk =>
    unfold Repl_sub at Hk
    rw [Finset.mem_insert, Finset.mem_singleton] at Hk
    cases Hk with
    | inl h1 => exact ⟨k, Or.inl h1⟩
    | inr h2 => exact ⟨k, Or.inr h2⟩
lemma mem_W22_inter_Repl (Hn : 2 ≤ n)
  (X : List.Vector B n) (H : X ∈ W22 n ∩ Repl n) :
  ∃ k : Fin (n - 1), (1 ≤ k.1) ∧ (k.1 ≤ n - 3) ∧
  (X = List.Vector.mkOIOI n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))
  ∨ X = List.Vector.mkIOIO n k.1 (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)) ) := by
  rw [Finset.mem_inter] at H
  rw [mem_Repl] at H
  have hW22 := H.left
  have hRepl := H.right
  cases hRepl with
  | intro k hk =>
    unfold Repl_sub at hk
    rw [Finset.mem_insert, Finset.mem_singleton] at hk
    have H_not_lt_1 : ¬ (k.1 < 1) := by
      intro hlt
      cases hk with
      | inl h1 =>
        have h_wt : n - 1 ≤ wt X := by
          rw [h1]
          exact List.Vector.le_wt_OIOI _ _ hlt
        have h_not : X ∉ W22 n := not_mem_W22_of_ge Hn X h_wt
        exact h_not hW22
      | inr h2 =>
        have h_wt : wt X ≤ 1 := by
          rw [h2]
          exact List.Vector.wt_IOIO_le _ _ hlt
        have h_not : X ∉ W22 n := not_mem_W22_of_le X h_wt
        exact h_not hW22
    have H_not_gt_n3 : ¬ (n - 3 < k.1) := by
      intro hlt
      cases hk with
      | inl h1 =>
        have h_wt : wt X ≤ 1 := by
          rw [h1]
          exact List.Vector.wt_OIOI_le _ _ hlt
        have h_not : X ∉ W22 n := not_mem_W22_of_le X h_wt
        exact h_not hW22
      | inr h2 =>
        have h_wt : n - 1 ≤ wt X := by
          rw [h2]
          exact List.Vector.le_wt_IOIO _ _ hlt
        have h_not : X ∉ W22 n := not_mem_W22_of_ge Hn X h_wt
        exact h_not hW22
    have H1 : 1 ≤ k.1 := Nat.le_of_not_lt H_not_lt_1
    have H2 : k.1 ≤ n - 3 := Nat.le_of_not_lt H_not_gt_n3
    exact ⟨k, H1, H2, hk⟩
lemma flip_Repl (n : Nat) :
  Finset.image B.Vector.flip (Repl n) = Repl n := by
  apply Finset.Subset.antisymm
  · intro x hx
    rw [Finset.mem_image] at hx
    cases hx with
    | intro y hy =>
      cases hy with
      | intro hy1 hxy =>
        rw [mem_Repl] at hy1
        cases hy1 with
        | intro k hk =>
          rw [mem_Repl]
          use k
          rw [← hxy]
          have h_flip_sub : Finset.image B.Vector.flip (Repl_sub n k) = Repl_sub n k := flip_Repl_sub n k
          rw [← h_flip_sub]
          rw [Finset.mem_image]
          exact ⟨y, hk, rfl⟩
  · intro x hx
    rw [mem_Repl] at hx
    cases hx with
    | intro k hk =>
      rw [Finset.mem_image]
      use B.Vector.flip x
      constructor
      · rw [mem_Repl]
        use k
        have h_flip_sub : Finset.image B.Vector.flip (Repl_sub n k) = Repl_sub n k := flip_Repl_sub n k
        rw [← h_flip_sub]
        rw [Finset.mem_image]
        exact ⟨x, hk, rfl⟩
      · exact B.Vector.flip_flip x
lemma OI_not_mem_replace (Hn : 3 ≤ n) (k : Fin (n - 1)) :
  List.Vector.mkOI n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))) ∉ Repl n := by
  intro h
  rw [mem_Repl] at h
  cases h with
  | intro k' hk =>
    unfold Repl_sub at hk
    rw [Finset.mem_insert, Finset.mem_singleton] at hk
    cases hk with
    | inl h1 => exact List.Vector.OI_ne_OIOI _ _ _ _ _ h1
    | inr h2 => exact List.Vector.OI_ne_IOIO _ _ _ Hn _ _ h2
lemma IO_not_mem_replace (Hn : 3 ≤ n) (k : Fin (n - 1)) :
  List.Vector.mkIO n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))) ∉ Repl n := by
  intro h
  rw [mem_Repl] at h
  cases h with
  | intro k' hk =>
    unfold Repl_sub at hk
    rw [Finset.mem_insert, Finset.mem_singleton] at hk
    cases hk with
    | inl h1 => exact List.Vector.IO_ne_OIOI _ _ _ Hn _ _ h1
    | inr h2 => exact List.Vector.IO_ne_IOIO _ _ _ _ _ h2
lemma OI_mem_sdiff_replace
  (Hn : 3 ≤ n) (k : Fin (n - 1)) (Hk : 1 ≤ k.1) (Hk' : k.1 ≤ n - 3) :
  List.Vector.mkOI n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))) ∈ W22 n \ Repl n := by
  rw [Finset.mem_sdiff]
  apply And.intro
  · exact OI_mem_W22 Hn _ Hk Hk'
  · exact OI_not_mem_replace Hn k
lemma IO_mem_sdiff_replace
  (Hn : 3 ≤ n) (k : Fin (n - 1)) (Hk : 1 ≤ k.1) (Hk' : k.1 ≤ n - 3) :
  List.Vector.mkIO n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2))) ∈ W22 n \ Repl n := by
  rw [Finset.mem_sdiff]
  apply And.intro
  · exact IO_mem_W22 Hn _ Hk Hk'
  · exact IO_not_mem_replace Hn k
lemma exists_sdiff_Repl
  (Hn : 3 ≤ n) (X : List.Vector B n) (H : X ∈ W22 n ∩ Repl n) :
  ∃ X' ∈ W22 n \ Repl n, X' ≠ X ∧ dS X' ⊆ dS X := by
  cases mem_W22_inter_Repl (Nat.le_trans (by decide) Hn) X H with
  | intro k hk =>
    rcases hk with ⟨hk1, hk2, hk_or⟩
    cases hk_or with
    | inl hk_oioi =>
      use List.Vector.mkOI n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)))
      constructor
      · exact OI_mem_sdiff_replace Hn k hk1 hk2
      · constructor
        · rw [hk_oioi]
          exact List.Vector.OI_ne_OIOI _ _ _ _ _
        · rw [hk_oioi]
          exact List.Vector.dS_OI_subset _ _ _
    | inr hk_ioio =>
      use List.Vector.mkIO n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)))
      constructor
      · exact IO_mem_sdiff_replace Hn k hk1 hk2
      · constructor
        · rw [hk_ioio]
          exact List.Vector.IO_ne_IOIO _ _ _ _ _
        · rw [hk_ioio]
          exact List.Vector.dS_IO_subset _ _ _
lemma exists_sdiff_Repl'
  (X : List.Vector B n) (H : X ∈ W22 n ∩ Repl n) :
  ∃ X' ∈ W22 n \ Repl n, X' ≠ X ∧ dS X' ⊆ dS X := by
  if hle : 3 ≤ n then
    exact exists_sdiff_Repl hle _ H
  else
    have hn_lt : n < 3 := Nat.lt_of_not_ge hle
    have hn_le : n ≤ 2 := Nat.le_of_lt_succ hn_lt
    rw [Finset.mem_inter] at H
    have h_w22 : X ∈ W22 n := H.left
    rw [W22_of_le_2 hn_le] at h_w22
    simp at h_w22
lemma optimal_iff_sdiff_Repl (Hn : 3 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_optimal C HC ↔ is_optimal_sub (univ \ Repl n) C HC := by
  rw [← is_optimal_sub_univ]
  rw [Iff.comm]
  rw [optimal_sub_sdiff_iff]
  intro x hx
  cases mem_Repl' x hx with
  | intro k hk =>
    cases hk with
    | inl h1 =>
      use List.Vector.mkOI n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)))
      constructor
      · rw [Finset.mem_sdiff]
        constructor
        · exact Finset.mem_univ _
        · exact OI_not_mem_replace Hn k
      · constructor
        · rw [h1]
          exact List.Vector.OI_ne_OIOI _ _ _ _ _
        · rw [h1]
          exact List.Vector.dS_OI_subset _ _ _
    | inr h2 =>
      use List.Vector.mkIO n (k.1 + 1) (le_of_lt (succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)))
      constructor
      · rw [Finset.mem_sdiff]
        constructor
        · exact Finset.mem_univ _
        · exact IO_not_mem_replace Hn k
      · constructor
        · rw [h2]
          exact List.Vector.IO_ne_IOIO _ _ _ _ _
        · rw [h2]
          exact List.Vector.dS_IO_subset _ _ _
lemma Repl_of_le_one (Hn : n ≤ 1) : Repl n = ∅ := by
  rw [← Finset.subset_empty]
  intro x hx
  cases mem_Repl' x hx with
  | intro k hk =>
    cases hk with
    | inl h1 =>
      have hk_le : k.1 + 2 ≤ n := succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)
      have h_2_le : 2 ≤ k.1 + 2 := Nat.le_add_left 2 k.1
      have h : 2 ≤ n := Nat.le_trans h_2_le hk_le
      have h_not : ¬ (2 ≤ n) := Nat.not_le_of_gt (Nat.lt_of_le_of_lt Hn (by decide))
      exact False.elim (h_not h)
    | inr h2 =>
      have hk_le : k.1 + 2 ≤ n := succ_le_of_lt (Nat.add_lt_of_lt_sub k.2)
      have h_2_le : 2 ≤ k.1 + 2 := Nat.le_add_left 2 k.1
      have h : 2 ≤ n := Nat.le_trans h_2_le hk_le
      have h_not : ¬ (2 ≤ n) := Nat.not_le_of_gt (Nat.lt_of_le_of_lt Hn (by decide))
      exact False.elim (h_not h)
lemma Repl_two : Repl 2 = {⟨[I, O], rfl⟩, ⟨[O, I], rfl⟩} := by decide
lemma sdiff_Repl_two : univ \ Repl 2 = {⟨[I, I], rfl⟩, ⟨[O, O], rfl⟩} := by decide

def II : List.Vector B 2 := ⟨[I, I], rfl⟩
lemma II_ne_IO : II ≠ ⟨[I, O], rfl⟩ := by decide
lemma II_mem_sdiff : II ∈ univ \ Repl 2 := by decide
lemma dS_II_subset_IO : dS II ⊆ dS ⟨[I, O], rfl⟩ := by decide

def OO : List.Vector B 2 := ⟨[O, O], rfl⟩
lemma OO_ne_OI : OO ≠ ⟨[O, I], rfl⟩ := by decide
lemma OO_mem_sdiff : OO ∈ univ \ Repl 2 := by decide
lemma dS_OO_subset_OI : dS OO ⊆ dS ⟨[O, I], rfl⟩ := by decide

lemma optimal_iff_sdiff_Repl'
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_optimal C HC ↔ is_optimal_sub (univ \ Repl n) C HC := by
  rw [← is_optimal_sub_univ]
  cases n with
  | zero =>
    rw [Repl_of_le_one (by decide)]
    rw [Finset.sdiff_empty]
  | succ n' =>
    cases n' with
    | zero =>
      rw [Repl_of_le_one (by decide)]
      rw [Finset.sdiff_empty]
    | succ n'' =>
      cases n'' with
      | zero =>
        rw [Iff.comm]
        rw [optimal_sub_sdiff_iff]
        intro x hx
        rw [Repl_two] at hx
        rw [Finset.mem_insert, Finset.mem_singleton] at hx
        cases hx with
        | inl h_IO =>
          use II
          constructor
          · exact II_mem_sdiff
          · rw [h_IO]
            constructor
            · exact II_ne_IO
            · exact dS_II_subset_IO
        | inr h_OI =>
          use OO
          constructor
          · exact OO_mem_sdiff
          · rw [h_OI]
            constructor
            · exact OO_ne_OI
            · exact dS_OO_subset_OI
      | succ n''' =>
        rw [is_optimal_sub_univ]
        rw [optimal_iff_sdiff_Repl (Nat.le_add_left 3 n''') C HC]
lemma optimal_of_W22_sdiff_Repl
  {n : Nat} {C : Finset (List.Vector B n)} (HC : is_DelCode C)
  (H : ∀ C' ⊆ W22 n \ Repl n, is_DelCode C' → Finset.card C' + 2 ≤ Finset.card C) :
  is_optimal C HC := by
  apply optimal_of_W22
  intro C' hC hC'
  have hC_sub : C' ∈ DCs_sub (W22 n) := by
    rw [mem_DCs_sub]
    exact ⟨hC, hC'⟩
  have HX : ∀ x ∈ W22 n ∩ Repl n, ∃ x' ∈ W22 n \ Repl n, x' ≠ x ∧ dS x' ⊆ dS x := by
    intro x hx
    exact exists_sdiff_Repl' x hx
  cases exists_DelCode_sdiff' (W22 n) C' hC_sub (Repl n) HX with
  | intro C'' hC'' =>
    rcases hC'' with ⟨hC''_left, hC''_right⟩
    rw [mem_DCs_sub] at hC''_left
    rw [← hC''_right]
    apply H _ hC''_left.left hC''_left.right
lemma optimal_iff_W22_sdiff_Repl (Hn : 4 ≤ n)
  (C : Finset (List.Vector B n)) (HC : is_DelCode C) :
  is_optimal C HC ↔ is_card_DCs_sub_le (W22 n \ Repl n) (Finset.card C - 2) := by
  rw [optimal_iff_W22 Hn C HC]
  rw [← card_DCs_sub_le_sdiff_iff']
  intro x hx
  exact exists_sdiff_Repl' x hx
lemma flip_W22_sdiff_Repl (Hn : 2 ≤ n):
  Finset.image B.Vector.flip (W22 n \ Repl n) = W22 n \ Repl n := by
  apply Finset.ext
  intro x
  rw [Finset.mem_image]
  apply Iff.intro
  · rintro ⟨y, hy, hyx⟩
    rw [Finset.mem_sdiff] at hy ⊢
    constructor
    · have hw22 : y ∈ W22 n := hy.left
      have h_flip : B.Vector.flip y ∈ Finset.image B.Vector.flip (W22 n) := Finset.mem_image_of_mem _ hw22
      rw [flip_W22 Hn] at h_flip
      rw [hyx] at h_flip
      exact h_flip
    · have h_not : y ∉ Repl n := hy.right
      intro h_in
      have h_flip : B.Vector.flip x ∈ Finset.image B.Vector.flip (Repl n) := Finset.mem_image_of_mem _ h_in
      rw [flip_Repl n] at h_flip
      rw [← hyx] at h_flip
      rw [B.Vector.flip_flip] at h_flip
      exact h_not h_flip
  · intro hx
    use B.Vector.flip x
    rw [Finset.mem_sdiff] at hx
    constructor
    · rw [Finset.mem_sdiff]
      constructor
      · have h_inv : x ∈ W22 n := hx.left
        have h_flip_mem : B.Vector.flip x ∈ Finset.image B.Vector.flip (W22 n) := Finset.mem_image_of_mem _ h_inv
        rw [flip_W22 Hn] at h_flip_mem
        exact h_flip_mem
      · have h_not : x ∉ Repl n := hx.right
        intro h_in
        have h_flip_mem : B.Vector.flip (B.Vector.flip x) ∈ Finset.image B.Vector.flip (Repl n) := Finset.mem_image_of_mem _ h_in
        rw [flip_Repl n, B.Vector.flip_flip] at h_flip_mem
        exact h_not h_flip_mem
    · exact B.Vector.flip_flip x
end Finset

end B
