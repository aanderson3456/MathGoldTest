/- Copyright Manabu Hagiwara 2022, 2026 -/
import VTlean.Optimal
import VTlean.VTCode

open Nat Finset B B.Finset 

namespace Finset
noncomputable def VTCode (n a : Nat) : Finset (List.Vector B n) := sorry
end Finset
theorem DelCode_VTCode (n a : Nat) : is_DelCode (Finset.VTCode n a) := by {
  sorry
}

namespace length1

lemma optimal_VTCode_1_0 :
  is_optimal (Finset.VTCode 1 0) (DelCode_VTCode 1 0) := by {
  sorry
}

end length1

namespace length2

lemma optimal_VTCode_2_0 :
  is_optimal (Finset.VTCode 2 0) (DelCode_VTCode 2 0) := by {
  sorry
}

end length2


namespace length3

lemma optimal_VTCode_3_0 :
  is_optimal (Finset.VTCode 3 0) (DelCode_VTCode 3 0) := by {
  sorry
}

end length3

namespace length4

def W2 : Finset (List.Vector B 4) :=
{ ⟨[I, I, O, O], rfl⟩, ⟨[I, O, O, I], rfl⟩, ⟨[O, I, I, O], rfl⟩, ⟨[O, O, I, I], rfl⟩ }

lemma W2_eq : W2 = W22 4 \ Repl 4 := by sorry

lemma DCs_sub_W2_len3' : DCs_sub_len' W2 3 = ∅ := by sorry

lemma DCs_sub_W2_len3 : DCs_sub_len W2 3 = ∅ := 
by sorry
lemma card_le_of_sub_W2
  (C : Finset (List.Vector B 4)) (HS : C ⊆ W2) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 :=
by sorry
lemma optimal_of_card
  (C : Finset (List.Vector B 4)) (HC : is_DelCode C) (H : Finset.card C = 4) :
  is_optimal C HC :=
by sorry
lemma card_VTCode_4_0 : Finset.card (Finset.VTCode 4 0) = 4 := by sorry

lemma optimal_VTCode_4_0 : 
  is_optimal (Finset.VTCode 4 0) (DelCode_VTCode 4 0) := 
by sorry
end length4

namespace length5

def W23 : Finset (List.Vector B 5) :=
{ ⟨[I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, I], rfl⟩, ⟨[I, I, O, O, O], rfl⟩, ⟨[I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, I], rfl⟩, ⟨[I, O, O, I, I], rfl⟩, ⟨[I, O, O, I, O], rfl⟩, ⟨[I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O], rfl⟩, ⟨[O, I, I, O, I], rfl⟩, 
 ⟨[O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I], rfl⟩, ⟨[O, O, I, I, I], rfl⟩, ⟨[O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I], rfl⟩ }

lemma W23_eq : W23 = W22 5 \ Repl 5 := by sorry

lemma DCs_sub_W23_len5' : DCs_sub_len' W23 5 = ∅ := by sorry

lemma DCs_sub_W23_len5 : DCs_sub_len W23 5 = ∅ := 
by sorry
lemma card_le_of_sub_W23
  (C : Finset (List.Vector B 5)) (HS : C ⊆ W23) (HC : is_DelCode C) : 
  Finset.card C ≤ 4 :=
by sorry
lemma optimal_of_card
  (C : Finset (List.Vector B 5)) (HC : is_DelCode C) (H : Finset.card C = 6) :
  is_optimal C HC :=
by sorry
lemma card_VTCode_5_0 : Finset.card (Finset.VTCode 5 0) = 6 := by sorry

lemma optimal_VTCode_5_0 : 
  is_optimal (Finset.VTCode 5 0) (DelCode_VTCode 5 0) := 
by sorry
end length5


namespace length6

def W24 : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, 
 ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, 
 ⟨[I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, 
 ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩, ⟨[O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O], rfl⟩, 
 ⟨[O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩, ⟨[O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I], rfl⟩ }

lemma W24_eq : W24 = W22 6 \ Repl 6 := by sorry

lemma div_wt_of_sub_W24
  (C : Finset (List.Vector B 6)) (HC : C ⊆ W24) :
  filter (fun x => wt x = 2) C ∪ filter (Icc_wt 3 4) C = C :=
by sorry
lemma card_div_wt_of_sub_W24
  (C : Finset (List.Vector B 6)) (HC : C ⊆ W24) :
  Finset.card (filter (fun x => wt x = 2) C) + Finset.card (filter (Icc_wt 3 4) C) = Finset.card C :=
by sorry
def W2 : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O], rfl⟩, 
 ⟨[O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I], rfl⟩ }

lemma W2_eq : W2 = filter (fun x => wt x = 2) W24 := by sorry

lemma DCs_sub_W2_len5' : DCs_sub_len' W2 5 = ∅ := by sorry

lemma DCs_sub_W2_len5 : DCs_sub_len W2 5 = ∅ := 
by sorry
lemma card_le_of_sub_W2
  (C : Finset (List.Vector B 6)) (HS : C ⊆ W2) (HC : is_DelCode C) : 
  Finset.card C ≤ 4 :=
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 6)) (HS : C ⊆ W24) (HC : is_DelCode C) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 4 :=
by sorry
namespace card4

def DCs_sub_W2_len4 : Finset (Finset (List.Vector B 6)) :=
{{⟨[I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I], rfl⟩}}

lemma DCs_sub_W2_len4_eq' : DCs_sub_W2_len4 = DCs_sub_len' W2 4 := by sorry

lemma DCs_sub_W2_len4_eq : DCs_sub_W2_len4 = DCs_sub_len W2 4 := 
by sorry
def DC : Finset (List.Vector B 6) := 
{ ⟨[I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I], rfl⟩ }

def sdiff_dB : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, 
 ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }
 
lemma sdiff_dB_eq : sdiff_dB = W24 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_len5' : DCs_sub_len' sdiff_dB 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_len5 : DCs_sub_len sdiff_dB 5 = ∅ :=
by sorry
lemma card_le_of_sub_sdiff_dB
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB) (HC : is_DelCode C) :
  Finset.card C ≤ 4 :=
by sorry
lemma filter_wt34_subset
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W24) (HC : is_DelCode C) : 
  filter (Icc_wt 3 4) C ⊆ W24 \ union_dB (filter (fun x => wt x = 2) C) :=
by sorry
lemma card_filter_wt34_le_of_sup_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W24) (HC : is_DelCode C)
  (H : filter (fun x => wt x = 2) C = DC): 
  Finset.card (filter (Icc_wt 3 4) C) ≤ 4 :=
by sorry
lemma card_filter_wt34_le 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W24) (HC : is_DelCode C)
  (H : Finset.card (filter (fun x => wt x = 2) C) = 4): 
  Finset.card (filter (Icc_wt 3 4) C) ≤ 4 :=
by sorry
end card4

def W34 : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, 
 ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, 
 ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩, 
 ⟨[O, O, O, I, I, I], rfl⟩ }

lemma W34_eq : W34 = filter (Icc_wt 3 4) W24 := by sorry

namespace W34

lemma Cwr_W34_3_0 : Cwr W34 3 0 = ∅ := by sorry

lemma Cwr_3_0_of_sub_W34 
  (C : Finset (List.Vector B 6)) (HC : C ⊆ W34) : 
  Cwr C 3 0 = ∅ :=
by sorry
def Cwr_W34_3_1 : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

lemma Cwr_W34_3_1_eq : Cwr_W34_3_1  = Cwr W34 3 1 := by sorry

def Cwr_W34_3_ge2 : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, 
 ⟨[I, O, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, 
 ⟨[O, O, I, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma Cwr_W34_3_ge2_eq : Cwr_W34_3_ge2 = Cwr_ge W34 3 2 := by sorry

lemma card_wt3_univ :
  Finset.card (filter (fun x : List.Vector B 5 => wt x = 3) univ) = 10 := rfl

lemma Cwr_union_ge 
  (C : Finset (List.Vector B 6)) (H : C ⊆ W34) : 
  Cwr C 3 1 ∪ Cwr_ge C 3 2 = C :=
by sorry
lemma card_Cwr_add_ge 
  (C : Finset (List.Vector B 6)) (H : C ⊆ W34) : 
  Finset.card (Cwr C 3 1) + Finset.card (Cwr_ge C 3 2) = Finset.card C :=
by sorry
lemma Cwr_3_ge2_subset 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W34) (HC : is_DelCode C) : 
  Cwr_ge C 3 2 ⊆ Cwr_W34_3_ge2 \ union_dB (Cwr C 3 1) :=
by sorry
lemma Cwr_3_ge2_mem 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W34) (HC : is_DelCode C) : 
  Cwr_ge C 3 2 ∈ DCs_sub (Cwr_W34_3_ge2 \ union_dB (Cwr C 3 1)) :=
by sorry
lemma DCs_sub_Cwr_W34_3_1_len4' : DCs_sub_len' Cwr_W34_3_1 4 = ∅ := by sorry

lemma DCs_sub_Cwr_W34_3_1_len4 : DCs_sub_len Cwr_W34_3_1 4 = ∅ := 
by sorry
lemma card_le_of_sub_Cwr_W34_3_1 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ Cwr_W34_3_1) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_3_1_le
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W34) (HC : is_DelCode C) : 
  Finset.card (Cwr C 3 1) ≤ 3 := 
by sorry
namespace card3

def DCs : Finset (Finset (List.Vector B 6)) :=
{{⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}}

lemma DCs_eq' : DCs = DCs_sub_len' Cwr_W34_3_1 3 := by sorry

lemma DCs_eq : DCs = DCs_sub_len Cwr_W34_3_1 3 := 
by sorry
def DCs_List : List (Finset (List.Vector B 6)) :=
[{⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}]

lemma DCs_list_to_Finset : DCs_List.toFinset = DCs := by sorry

lemma mem_DCs_List (s : Finset (List.Vector B 6)) : 
  s ∈ DCs_List ↔ s ∈ DCs :=
by sorry
namespace DC1 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC1

namespace DC2 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC2

namespace DC3 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC3

namespace DC4 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC4

namespace DC5 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC5

namespace DC6 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC6

namespace DC7 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end DC7

lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Finset.card (Cwr C 3 1) = 3) : 
  Finset.card (Cwr_ge C 3 2) ≤ 2 :=
by sorry
end card3

namespace card2

def DCs : Finset (Finset (List.Vector B 6)) :=
{{⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}}

lemma DCs_eq' : DCs = DCs_sub_len' Cwr_W34_3_1 2 := by sorry

lemma DCs_eq : DCs = DCs_sub_len Cwr_W34_3_1 2 := 
by sorry
def DCs_List : List (Finset (List.Vector B 6)) :=
[{⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩}]

lemma DCs_list_to_Finset : DCs_List.toFinset = DCs := by sorry

lemma mem_DCs_List (s : Finset (List.Vector B 6)) : 
  s ∈ DCs_List ↔ s ∈ DCs :=
by sorry
namespace DC1 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, 
 ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC1

namespace DC2 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, 
 ⟨[O, O, I, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC2

namespace DC3 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, 
 ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC3

namespace DC4 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, 
 ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC4

namespace DC5 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, 
 ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC5

namespace DC6 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, 
 ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC6

namespace DC7 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, 
 ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC7

namespace DC8 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, 
 ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC8

namespace DC9 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC9

namespace DC10 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, 
 ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC10

namespace DC11 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, 
 ⟨[O, I, I, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC11

namespace DC12 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC12

namespace DC13 

def DC : Finset (List.Vector B 6) :=
{ ⟨[I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O], rfl⟩, 
 ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC13

namespace DC14 

def DC : Finset (List.Vector B 6) :=
{ ⟨[O, I, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 6) :=
{ ⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, 
 ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W34_3_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Cwr C 3 1 = DC) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end DC14

lemma card_Cwr_ge_le (C : Finset (List.Vector B 6)) 
  (HCS : C ⊆ W34) (HC : is_DelCode C) (H : Finset.card (Cwr C 3 1) = 2) : 
  Finset.card (Cwr_ge C 3 2) ≤ 3 :=
by sorry
end card2

def DCs_sub_Cwr_W34_3_ge2_len4 : Finset (Finset (List.Vector B 6)) :=
{{⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, O, I, I, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, I, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, I, I, O, I], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}, 
 {⟨[I, O, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}, 
 {⟨[I, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O], rfl⟩, ⟨[O, I, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, I], rfl⟩}}

lemma DCs_sub_Cwr_W34_3_ge2_len4_eq' : 
  DCs_sub_Cwr_W34_3_ge2_len4 = DCs_sub_len' Cwr_W34_3_ge2 4 := by sorry

lemma DCs_sub_Cwr_W34_3_ge2_len4_eq : 
  DCs_sub_Cwr_W34_3_ge2_len4 = DCs_sub_len Cwr_W34_3_ge2 4 := 
by sorry
lemma DCs_sub_Cwr_W34_3_ge2_len4_succ : 
  DCs_sub_DCs_len_succ Cwr_W34_3_ge2 DCs_sub_Cwr_W34_3_ge2_len4 = ∅ := by sorry

lemma DCs_sub_Cwr_W34_3_ge2_len5 : DCs_sub_len Cwr_W34_3_ge2 5 = ∅ := 
by sorry
lemma card_le_of_sub_Cwr_W34_3_ge2 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ Cwr_W34_3_ge2) (HC : is_DelCode C) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_3_2_le
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W34) (HC : is_DelCode C) : 
  Finset.card (Cwr_ge C 3 2) ≤ 4 := 
by sorry
lemma card_le_of_sub_W34 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W34) (HC : is_DelCode C) : 
  Finset.card C ≤ 5 :=
by sorry
end W34

lemma card_le_of_sub_W24 
  (C : Finset (List.Vector B 6)) (HCS : C ⊆ W24) (HC : is_DelCode C) : 
  Finset.card C ≤ 8 :=
by sorry
lemma optimal_of_card
  (C : Finset (List.Vector B 6)) (HC : is_DelCode C) (H : Finset.card C = 10) :
  is_optimal C HC :=
by sorry
lemma card_VTCode_6_0 : Finset.card (Finset.VTCode 6 0) = 10 := by sorry

lemma optimal_VTCode_6_0 : 
  is_optimal (Finset.VTCode 6 0) (DelCode_VTCode 6 0) := 
by sorry
end length6

namespace length7

def W25 : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, I, O, O, O], rfl⟩, ⟨[I, I, I, O, I, I, O], rfl⟩, ⟨[I, I, I, O, I, O, I], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, I, O, O, I, O], rfl⟩, ⟨[I, I, I, O, O, O, I], rfl⟩, ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, I, O, I, I, I, O], rfl⟩, 
 ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[I, I, O, I, I, O, O], rfl⟩, ⟨[I, I, O, I, O, I, I], rfl⟩, ⟨[I, I, O, I, O, I, O], rfl⟩, ⟨[I, I, O, I, O, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, I, O, O, I, I, O], rfl⟩, ⟨[I, I, O, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, I], rfl⟩, 
 ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[I, O, I, I, I, O, O], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[I, O, I, I, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, 
 ⟨[I, O, I, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, I, O, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, I], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[I, O, O, I, I, I, O], rfl⟩, ⟨[I, O, O, I, I, O, I], rfl⟩, 
 ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, I, I], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, I], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, 
 ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, I, I, O], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩, ⟨[O, I, I, I, I, O, O], rfl⟩, ⟨[O, I, I, I, O, I, I], rfl⟩, ⟨[O, I, I, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, I, I], rfl⟩, 
 ⟨[O, I, I, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, I, O], rfl⟩, ⟨[O, I, O, I, I, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, 
 ⟨[O, I, O, I, O, I, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩, 
 ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, 
 ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, I, O], rfl⟩, 
 ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma W25_eq : W25 = W22 7 \ Repl 7 := by sorry

lemma flip_W25 : flipCode W25 = W25 := 
by sorry
lemma div_wt_of_sub_W25
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) : 
  filter (Icc_wt 2 3) C ∪ filter (Icc_wt 4 5) C = C := 
by sorry
lemma filter_wt_inter_of_sub_W25
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) : 
  filter (Icc_wt 2 3) C ∩ filter (Icc_wt 4 5) C = ∅ := 
by sorry
lemma card_div_wt_of_sub_W25
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) : 
  Finset.card (filter (Icc_wt 2 3) C) + Finset.card (filter (Icc_wt 4 5) C) = Finset.card C := 
by sorry
lemma exists_DC_card_filter_wt_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) (HC : is_DelCode C) :
  ∃ C' : Finset (List.Vector B 7), is_DelCode C' ∧ C' ⊆ W25 
  ∧ Finset.card C' = Finset.card C ∧ Finset.card (filter (Icc_wt 4 5) C') ≤ Finset.card (filter (Icc_wt 2 3) C') :=
by sorry
def W23 : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, 
 ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, 
 ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, 
 ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, 
 ⟨[O, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, 
 ⟨[O, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma W23_eq : W23 = filter (Icc_wt 2 3) W25 := by sorry

namespace W23

lemma Cwr_W23_2_0 : Cwr W23 2 0 = ∅ := by sorry

lemma Cwr_2_0_of_sub_W23 
  (C : Finset (List.Vector B 7)) (HC : C ⊆ W23) : 
  Cwr C 2 0 = ∅ :=
by sorry
def Cwr_W23_2_1 : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma Cwr_W23_2_1_eq : Cwr_W23_2_1  = Cwr W23 2 1 := by sorry

def Cwr_W23_2_2  : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, 
 ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma Cwr_W23_2_2_eq : Cwr_W23_2_2 = Cwr W23 2 2 := by sorry

def Cwr_W23_2_ge2 : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, I], rfl⟩, 
 ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, 
 ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, 
 ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma Cwr_W23_2_ge2_eq : Cwr_W23_2_ge2 = Cwr_ge W23 2 2 := by sorry

def Cwr_W23_2_ge3 : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, 
 ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, I, O], rfl⟩ }

lemma Cwr_W23_2_ge3_eq : Cwr_W23_2_ge3 = Cwr_ge W23 2 3 := by sorry

lemma card_wt2_univ :
  Finset.card (filter (fun x : List.Vector B 6 => wt x = 2) univ) = 15 := rfl

lemma card_Cwr_2_1_ge_of_Finset.card (C : Finset (List.Vector B 7)) 
  (HC : is_DelCode C) (HCS : C ⊆ W23) (H : 8 ≤ Finset.card C) : 
  1 ≤ Finset.card (Cwr C 2 1) :=
by sorry
lemma card_Cwr_2_2_ge_of_Finset.card (C : Finset (List.Vector B 7)) 
  (HC : is_DelCode C) (HCS : C ⊆ W23) (H : 8 ≤ Finset.card C)
  (k : Nat) (Hk : Finset.card (Cwr C 2 1) = k) : 
  9 - 2 * k  ≤ Finset.card (Cwr C 2 2) :=
by sorry
lemma Cwr_union_ge 
  (C : Finset (List.Vector B 7)) (H : C ⊆ W23) : 
  Cwr C 2 1 ∪ Cwr_ge C 2 2 = C :=
by sorry
lemma card_Cwr_add_ge 
  (C : Finset (List.Vector B 7)) (H : C ⊆ W23) : 
  Finset.card (Cwr C 2 1) + Finset.card (Cwr_ge C 2 2) = Finset.card C :=
by sorry
lemma Cwr_ge_2_2_subset 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Cwr_ge C 2 2 ⊆ Cwr_W23_2_ge2 \ union_dB (Cwr C 2 1) :=
by sorry
lemma Cwr_ge_2_2_mem 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C): 
  Cwr_ge C 2 2 ∈ DCs_sub (Cwr_W23_2_ge2 \ union_dB (Cwr C 2 1)) :=
by sorry
lemma Cwr_union_union_ge 
  (C : Finset (List.Vector B 7)) (H : C ⊆ W23) : 
  Cwr C 2 1 ∪ Cwr C 2 2 ∪ Cwr_ge C 2 3 = C :=
by sorry
lemma card_Cwr_add_add_ge 
  (C : Finset (List.Vector B 7)) (H : C ⊆ W23) : 
  Finset.card (Cwr C 2 1) + Finset.card (Cwr C 2 2) + Finset.card (Cwr_ge C 2 3) = Finset.card C :=
by sorry
lemma Cwr_2_2_subset 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Cwr C 2 2 ⊆ Cwr_W23_2_2 \ union_dB (Cwr C 2 1) :=
by sorry
lemma Cwr_2_2_mem 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Cwr C 2 2 ∈ DCs_sub (Cwr_W23_2_2 \ union_dB (Cwr C 2 1)) :=
by sorry
lemma Cwr_ge_2_3_subset 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Cwr_ge C 2 3 ⊆ Cwr_W23_2_ge3 \ union_dB (Cwr C 2 1 ∪ Cwr C 2 2) :=
by sorry
lemma Cwr_ge_2_3_mem 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Cwr_ge C 2 3 ∈ DCs_sub (Cwr_W23_2_ge3 \ union_dB (Cwr C 2 1 ∪ Cwr C 2 2)) :=
by sorry
lemma DCs_sub_Cwr_W23_2_1_len5' : DCs_sub_len' Cwr_W23_2_1 5 = ∅ := by sorry

lemma DCs_sub_Cwr_W23_2_1_len5 : DCs_sub_len Cwr_W23_2_1 5 = ∅ := 
by sorry
lemma card_DC_sub_Cwr_W23_2_1_le 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ Cwr_W23_2_1) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_1_le
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Finset.card (Cwr C 2 1) ≤ 4 := 
by sorry
namespace card4

lemma card_Cwr_ge_ge
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 4) : 
  4 ≤ Finset.card (Cwr_ge C 2 2) :=
by sorry
def DCs : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}}

lemma DCs_eq' : DCs = DCs_sub_len' Cwr_W23_2_1 4 := by sorry

lemma DCs_eq : DCs = DCs_sub_len Cwr_W23_2_1 4 := 
by sorry
namespace DC1 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 4 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, 
 ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_ge2 \ union_dB DC := by sorry 

def DCs_sub_sdiff_dB_DC : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_eq' : 
   DCs_sub_sdiff_dB_DC = DCs_sub_len' sdiff_dB_DC 4 := by sorry

lemma DCs_sub_sdiff_dB_DC_eq : 
  DCs_sub_sdiff_dB_DC = DCs_sub_len sdiff_dB_DC 4 := 
by sorry
lemma DCs_sub_sdiff_dB_DC_succ : 
  DCs_sub_DCs_len_succ sdiff_dB_DC DCs_sub_sdiff_dB_DC = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC (C : Finset (List.Vector B 7)) 
  (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_ge_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr_ge C 2 2) ≤ 4 :=
by sorry
lemma card_Cwr_ge_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC): 
  Finset.card (Cwr_ge C 2 2) = 4 :=
by sorry
lemma DC_union_1 : 
  DC ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} 
  = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} := by sorry
lemma DC_union_2 : 
  DC ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} 
  = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} := by sorry
lemma DC_union_3 : 
  DC ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩} 
  = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩} := by sorry
lemma DC_union_4 : 
  DC ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} 
  = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} := by sorry
lemma DC_union_5 : 
  DC ∪ {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} 
  = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} := by sorry

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC1 

namespace DC2 

def DC : Finset (List.Vector B 7) :=
 { ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 4 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, 
 ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_ge2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_ge_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr_ge C 2 2) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 :=
by sorry
end DC2

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC1.DCs_sup_DC_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 4) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end card4

namespace card3

lemma card_Cwr_2_2_ge 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 3) : 
  3 ≤ Finset.card (Cwr C 2 2) :=
by sorry
def DCs : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}}

lemma DCs_eq' : DCs = DCs_sub_len' Cwr_W23_2_1 3 := by sorry

lemma DCs_eq : DCs = DCs_sub_len Cwr_W23_2_1 3 := 
by sorry
def DCs_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}]

lemma DCs_list_to_Finset : DCs_List.toFinset = DCs := by sorry

lemma mem_DCs_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs_List ↔ s ∈ DCs :=
by sorry
namespace DC1 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{⟨[I, O, I, O, I, O, O], rfl⟩} 

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC1 

namespace DC2

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}} 

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC1.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC2

namespace DC3

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, 
 ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC10

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC): 
  Finset.card C ≤ 7 := 
by sorry
end DC3 

namespace DC4

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
def DCs'_card4 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}}

lemma DCs'_card4_eq' : DCs'_card4 = DCs_sub_len' sdiff_dB_DC 4 := by sorry

lemma DCs'_card4_eq : DCs'_card4 = DCs_sub_len sdiff_dB_DC 4 := 
by sorry
namespace card4

namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 4 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 1 :=
by sorry
def DCs_sub_sdiff_dB_DC_len1 : Finset (Finset (List.Vector B 7)) :=
{{⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len1_eq' : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len' sdiff_dB_DC' 1 := rfl

lemma DCs_sub_sdiff_dB_DC_len1_eq : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len sdiff_dB_DC' 1 := 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 4 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 4 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 1 :=
by sorry
def DCs_sub_sdiff_dB_DC_len1 : Finset (Finset (List.Vector B 7)) :=
{{⟨[O, I, O, I, O, I, O], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len1_eq' : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len' sdiff_dB_DC' 1 := rfl

lemma DCs_sub_sdiff_dB_DC_len1_eq : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len sdiff_dB_DC' 1 := 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[O, I, O, I, O, I, O], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 4 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 4 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 1 :=
by sorry
def DCs_sub_sdiff_dB_DC_len1 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len1_eq' : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len' sdiff_dB_DC' 1 := rfl

lemma DCs_sub_sdiff_dB_DC_len1_eq : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len sdiff_dB_DC' 1 := 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC5

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC1.DCs_sup_DC'_len8 ∪ DC3.DCs_sup_DC'_len8 ∪ DC5.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Finset.card (Cwr C 2 2) = 4) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end card4

def DCs'_card3 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 { ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩},
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}}

lemma DCs'_card3_eq' : DCs'_card3 = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_card3_eq : DCs'_card3 = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_card3_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 { ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩},
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}]

lemma DCs'_card3_list_to_Finset : 
  DCs'_card3_List.toFinset = DCs'_card3 := by sorry

lemma mem_DCs'_card3_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_card3_List ↔ s ∈ DCs'_card3 :=
by sorry
namespace card3

namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC10

namespace DC11

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC11

namespace DC12

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC12

namespace DC13

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC13

namespace DC14

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC14

namespace DC15

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC15

namespace DC16

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC16

namespace DC17

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC17

namespace DC18

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC18

namespace DC19

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC19

namespace DC20

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC20

namespace DC21

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC21

namespace DC22

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC22

namespace DC23

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC23

namespace DC24

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC24

namespace DC25

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC25

namespace DC26

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC26

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC11.DCs_sup_DC'_len8 ∪ DC22.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Finset.card (Cwr C 2 2) = 3) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end card3

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  card4.DCs_sup_DC_len8 ∪ card3.DCs_sup_DC_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC4

namespace DC5 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC10

namespace DC11

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC10.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC5

namespace DC6

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC10

namespace DC11

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

namespace DC12

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC12

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC8.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC6

namespace DC7

def DC : Finset (List.Vector B 7) :=
{⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩} 

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩} = {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC10

namespace DC11

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

namespace DC12

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC12

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC10.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC8

namespace DC9 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC10

namespace DC11

def DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC7.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC10 

namespace DC11 

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

namespace DC12

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC12

namespace DC13

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC13

namespace DC14

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

lemma sdiff_dB_DC_eq : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 6 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC' 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC' 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 2 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 2 :=
by sorry
def DCs_sub_sdiff_dB_DC_len2 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len2_eq' : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len' sdiff_dB_DC' 2 := rfl

lemma DCs_sub_sdiff_dB_DC_len2_eq : 
  DCs_sub_sdiff_dB_DC_len2 = DCs_sub_len sdiff_dB_DC' 2:= 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩} = {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC9

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC9.DCs_sup_DC'_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC14

namespace DC15

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC15

namespace DC16

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 3 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 3 :=
by sorry
def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 3 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 3 := 
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, I, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 3 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC') : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC16

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC2.DCs_sup_DC_len8 ∪ DC4.DCs_sup_DC_len8 ∪ DC5.DCs_sup_DC_len8 
  ∪ DC6.DCs_sup_DC_len8 ∪ DC8.DCs_sup_DC_len8 ∪ DC10.DCs_sup_DC_len8 ∪ DC14.DCs_sup_DC_len8

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 3) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end card3

namespace card2

lemma card_Cwr_2_2_ge 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 2) : 
  5 ≤ Finset.card (Cwr C 2 2) :=
by sorry
def DCs : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩}, 
 { ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩},
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}}

lemma DCs_eq' : DCs = DCs_sub_len' Cwr_W23_2_1 2 := by sorry

lemma DCs_eq : DCs = DCs_sub_len Cwr_W23_2_1 2 := 
by sorry
def DCs_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩}, 
 { ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩},
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}]

lemma DCs_list_to_Finset : DCs_List.toFinset = DCs := by sorry

lemma mem_DCs_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs_List ↔ s ∈ DCs :=
by sorry
namespace DC1

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, 
 ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 5 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 5 := 
by sorry
lemma DCs'_succ : DCs_sub_DCs_len_succ sdiff_dB_DC DCs' = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len6 : DCs_sub_len sdiff_dB_DC 6 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 5 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 5 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 5 :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, 
 ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 5 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 5 := 
by sorry
lemma DCs'_succ : DCs_sub_DCs_len_succ sdiff_dB_DC DCs' = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len6 : DCs_sub_len sdiff_dB_DC 6 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 5 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 5 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 5 :=
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, 
 ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 5 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 5 := 
by sorry
lemma DCs'_succ : DCs_sub_DCs_len_succ sdiff_dB_DC DCs' = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len6 : DCs_sub_len sdiff_dB_DC 6 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 5 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 5 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 5 :=
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 1 :=
by sorry
def DCs_sub_sdiff_dB_DC_len1 : Finset (Finset (List.Vector B 7)) :=
{{⟨[O, O, I, O, I, O, I], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len1_eq' : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len' sdiff_dB_DC' 1 := rfl

lemma DCs_sub_sdiff_dB_DC_len1_eq : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len sdiff_dB_DC' 1 := 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[O, O, I, O, I, O, I], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC10

namespace DC11

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

namespace DC12

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC12

namespace DC13

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC13

namespace DC14

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC14

namespace DC15

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC15

namespace DC16

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

def sdiff_dB_DC' : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC' = Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') := by sorry

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC' 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC' 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC')  : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 1 :=
by sorry
lemma card_Cwr_ge_2_3
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) = 1 :=
by sorry
def DCs_sub_sdiff_dB_DC_len1 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, I, O, I, O, O], rfl⟩}}

lemma DCs_sub_sdiff_dB_DC_len1_eq' : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len' sdiff_dB_DC' 1 := rfl

lemma DCs_sub_sdiff_dB_DC_len1_eq : 
  DCs_sub_sdiff_dB_DC_len1 = DCs_sub_len sdiff_dB_DC' 1 := 
by sorry
lemma DC_union_DC'_union : 
  DC ∪ DC' ∪ {⟨[I, O, I, O, I, O, O], rfl⟩} = {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩} := by sorry

def DCs_sup_DC'_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma mem_DCs_sup_DC'_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) (H3 : Cwr C 2 2 = DC') : 
  C ∈ DCs_sup_DC'_len8 := 
by sorry
end DC16

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC7.DCs_sup_DC'_len8 ∪ DC16.DCs_sup_DC'_len8 

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end DC4

namespace DC5

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, 
 ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, 
 ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, 
 ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, 
 ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

namespace DC10

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC10

namespace DC11

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, 
 ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC11

namespace DC12

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, 
 ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC12

namespace DC13

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, 
 ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC13

namespace DC14

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, 
 ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC14

namespace DC15

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC15

namespace DC16

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, 
 ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 5 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 5 := 
by sorry
lemma DCs'_succ : DCs_sub_DCs_len_succ sdiff_dB_DC DCs' = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len6 : DCs_sub_len sdiff_dB_DC 6 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 5 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 5 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 5 :=
by sorry
def DCs'_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}]

lemma DCs'_list_to_Finset : 
  DCs'_List.toFinset = DCs' := by sorry

lemma mem_DCs'_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs'_List ↔ s ∈ DCs' :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

namespace DC6

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC6

namespace DC7

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC7

namespace DC8

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC8

namespace DC9

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC9

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC16

namespace DC17

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, 
 ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC17

namespace DC18

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, 
 ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

def DCs' : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}}

lemma DCs'_eq' : DCs' = DCs_sub_len' sdiff_dB_DC 5 := by sorry

lemma DCs'_eq : DCs' = DCs_sub_len sdiff_dB_DC 5 := 
by sorry
lemma DCs'_succ : DCs_sub_DCs_len_succ sdiff_dB_DC DCs' = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len6 : DCs_sub_len sdiff_dB_DC 6 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 5 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 5 :=
by sorry
lemma card_Cwr_2_2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : 8 ≤ Finset.card C) (H2 : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) = 5 :=
by sorry
namespace DC1

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC1

namespace DC2

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC2

namespace DC3

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC3

namespace DC4

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC4

namespace DC5

def DC' : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC' : Finset.card DC' = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_ge3 \ union_dB (DC ∪ DC') = ∅ := by sorry

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_ge3 \ union_dB (DC ∪ DC')) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_Cwr_ge_2_3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card (Cwr_ge C 2 3) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC'
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  
  (H1 : Cwr C 2 1 = DC) (H2 : Cwr C 2 2 = DC') : 
  Finset.card C ≤ 7 := 
by sorry
end DC5

lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card C ≤ 7 := 
by sorry
end DC18

namespace DC19

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, 
 ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC19

namespace DC20

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 2 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, 
 ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len5' : DCs_sub_len' sdiff_dB_DC 5 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len5 : DCs_sub_len sdiff_dB_DC 5 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_Cwr_2_2_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC) : 
  Finset.card (Cwr C 2 2) ≤ 4 :=
by sorry
lemma card_le_of_sup_DC (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Cwr C 2 1 = DC)   : 
  Finset.card C ≤ 7 := 
by sorry
end DC20

def DCs_sup_DC_len8 : Finset (Finset (List.Vector B 7)) :=
  DC4.DCs_sup_DC_len8 

lemma mem_DCs_sup_DC_len8
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 2) : 
  C ∈ DCs_sup_DC_len8 :=
by sorry
end card2

namespace card1

lemma card_Cwr_2_2_ge 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C) 
  (H1 : 8 ≤ Finset.card C) (H2 : Finset.card (Cwr C 2 1) = 1) : 
  7 ≤ Finset.card (Cwr C 2 2) :=
by sorry
lemma div_wt_of_sub_Cwr_W23_2_2
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2) : 
  filter (fun x => wt x = 2) C ∪ filter (fun x => wt x = 3) C = C := 
by sorry
lemma card_div_wt_of_sub_Cwr_W23_2_2
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2) : 
  Finset.card (filter (fun x => wt x = 2) C) + Finset.card (filter (fun x => wt x = 3) C) = Finset.card C := 
by sorry
lemma filter_wt3_subset
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) : 
  filter (fun x => wt x = 3) C ⊆ Cwr_W23_2_2 \ union_dB (filter (fun x => wt x = 2) C) :=
by sorry
lemma filter_wt2_subset
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) : 
  filter (fun x => wt x = 2) C ⊆ Cwr_W23_2_2 \ union_dB (filter (fun x => wt x = 3) C) :=
by sorry
namespace Cwr_W23_2_2_wt2

def Cwr_W23_2_2_wt2  : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma Cwr_W23_2_2_wt2_eq : Cwr_W23_2_2_wt2 = filter (fun x => wt x = 2) Cwr_W23_2_2 := by sorry

lemma DCs_Cwr_W23_2_2_wt2_len5' : DCs_sub_len' Cwr_W23_2_2_wt2 5 = ∅ := by sorry

lemma DCs_Cwr_W23_2_2_wt2_len5 : DCs_sub_len Cwr_W23_2_2_wt2 5 = ∅ := 
by sorry
lemma card_le_of_sub_Cwr_W23_2_2_wt2 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2_wt2) (HC : is_DelCode C) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_filter_wt2_le
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 4 := 
by sorry
namespace card4

def DCs_Cwr_W23_2_2_wt2_len4  : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}}

lemma DCs_Cwr_W23_2_2_wt2_len4_eq' : DCs_Cwr_W23_2_2_wt2_len4 = DCs_sub_len' Cwr_W23_2_2_wt2 4 := by sorry

lemma DCs_Cwr_W23_2_2_wt2_len4_eq : DCs_Cwr_W23_2_2_wt2_len4 = DCs_sub_len Cwr_W23_2_2_wt2 4 := 
by sorry
namespace DC1

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 4 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC1

namespace DC2

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 4 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC2

namespace DC3

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 4 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card C ≤ 4 := 
by sorry
end DC3

namespace DC4

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 4 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card C ≤ 4 := 
by sorry
end DC4

lemma card_le_of_card4 (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) 
  (H : Finset.card (filter (fun x => wt x = 2) C) = 4) : 
  Finset.card C ≤ 5 := 
by sorry
end card4

namespace card3

def DCs_Cwr_W23_2_2_wt2_len3  : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}}

lemma DCs_Cwr_W23_2_2_wt2_len3_eq' : DCs_Cwr_W23_2_2_wt2_len3 = DCs_sub_len' Cwr_W23_2_2_wt2 3 := by sorry

lemma DCs_Cwr_W23_2_2_wt2_len3_eq : DCs_Cwr_W23_2_2_wt2_len3 = DCs_sub_len Cwr_W23_2_2_wt2 3 := 
by sorry
def DCs_Cwr_W23_2_2_wt2_len3_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩}, 
 {⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}, 
 {⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩}]

lemma DCs_Cwr_W23_2_2_wt2_len3_list_to_Finset : 
  DCs_Cwr_W23_2_2_wt2_len3_List.toFinset = DCs_Cwr_W23_2_2_wt2_len3 := by sorry

lemma mem_DCs_Cwr_W23_2_2_wt2_len3_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs_Cwr_W23_2_2_wt2_len3_List ↔ s ∈ DCs_Cwr_W23_2_2_wt2_len3 :=
by sorry
namespace DC1

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 4 := 
by sorry
end DC1

namespace DC2

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC2

namespace DC3

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC3

namespace DC4

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC4

namespace DC5

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC5

namespace DC6

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC6

namespace DC7

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC7

namespace DC8

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC8

namespace DC9

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC9

namespace DC10

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC10

namespace DC11

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 4 := 
by sorry
end DC11

namespace DC12

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC12

namespace DC13

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC13

namespace DC14

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 4 := 
by sorry
end DC14

namespace DC15

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC15

namespace DC16

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len4' : DCs_sub_len' sdiff_dB_DC 4 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len4 : DCs_sub_len sdiff_dB_DC 4 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 3 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 3 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 6 := 
by sorry
end DC16

namespace DC17

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC17

namespace DC18

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, I, O, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 4 := 
by sorry
end DC18

namespace DC19

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC19

namespace DC20

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 2 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 5 := 
by sorry
end DC20

namespace DC21

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 4 := 
by sorry
end DC21

namespace DC22

def DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, I, O, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 3 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt3_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)  : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C) (H : filter (fun x => wt x = 2) C = DC)   : 
  Finset.card C ≤ 4 := 
by sorry
end DC22

lemma card_le_of_card3 (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) 
  (H : Finset.card (filter (fun x => wt x = 2) C) = 3) : 
  Finset.card C ≤ 6 := 
by sorry
end card3

end Cwr_W23_2_2_wt2

namespace Cwr_W23_2_2_wt3

def Cwr_W23_2_2_wt3  : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, 
 ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma Cwr_W23_2_2_wt3_eq : Cwr_W23_2_2_wt3 = filter (fun x => wt x = 3) Cwr_W23_2_2 := by sorry

def DCs_Cwr_W23_2_2_wt3_len5 : Finset (Finset (List.Vector B 7)) := 
{{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}}

lemma DCs_Cwr_W23_2_2_wt3_len5_eq' : DCs_Cwr_W23_2_2_wt3_len5 = DCs_sub_len' Cwr_W23_2_2_wt3 5 := by sorry

lemma DCs_Cwr_W23_2_2_wt3_len5_eq : DCs_Cwr_W23_2_2_wt3_len5 = DCs_sub_len Cwr_W23_2_2_wt3 5 := 
by sorry
lemma DCs_Cwr_W23_2_2_wt3_len5_succ : 
  DCs_sub_DCs_len_succ Cwr_W23_2_2_wt3 DCs_Cwr_W23_2_2_wt3_len5 = ∅ := by sorry

lemma DCs_Cwr_W23_2_2_wt3_len6 : DCs_sub_len Cwr_W23_2_2_wt3 6 = ∅ := 
by sorry
lemma card_DC_sub_Cwr_W23_2_2_wt3_le 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ Cwr_W23_2_2_wt3) : 
  Finset.card C ≤ 5 := 
by sorry
lemma card_filter_wt3_le
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) : 
  Finset.card (filter (fun x => wt x = 3) C) ≤ 5 := 
by sorry
def DCs_Cwr_W23_2_2_wt3_len5_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩}]

lemma DCs_Cwr_W23_2_2_wt3_len5_list_to_Finset : 
  DCs_Cwr_W23_2_2_wt3_len5_List.toFinset = DCs_Cwr_W23_2_2_wt3_len5 := by sorry

lemma mem_DCs_Cwr_W23_2_2_wt3_len5_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs_Cwr_W23_2_2_wt3_len5_List ↔ s ∈ DCs_Cwr_W23_2_2_wt3_len5 :=
by sorry
namespace DC1

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC1

namespace DC2

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC2

namespace DC3

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC3

namespace DC4

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC4

namespace DC5

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC5

namespace DC6

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC6

namespace DC7

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC7

namespace DC8

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC8

namespace DC9

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC9

namespace DC10

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, O, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC10

namespace DC11

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC11

namespace DC12

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC12

namespace DC13

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC13

namespace DC14

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC14

namespace DC15

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC15

namespace DC16

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC16

namespace DC17

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC17

namespace DC18

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC18

namespace DC19

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, O, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC19

namespace DC20

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC20

namespace DC21

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, O, O, O, I, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC21

namespace DC22

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC22

namespace DC23

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC23

namespace DC24

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC24

namespace DC25

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC25

namespace DC26

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC26

namespace DC27

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC27

namespace DC28

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, O, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC28

namespace DC29

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC29

namespace DC30

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

lemma sdiff_dB_DC : Cwr_W23_2_2 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 0 := 
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card C ≤ 5 := 
by sorry
end DC30

namespace DC31

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC31

namespace DC32

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC32

namespace DC33

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC33

namespace DC34

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, I], rfl⟩, ⟨[O, O, O, I, I, O, I], rfl⟩ }

lemma card_DC : Finset.card DC = 5 := by sorry

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = Cwr_W23_2_2 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC 
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (HCS : C ⊆ sdiff_dB_DC) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 2) C) ≤ 1 :=
by sorry
lemma card_le_of_sup_DC 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ Cwr_W23_2_2)
  (HC : is_DelCode C)  (H : filter (fun x => wt x = 3) C = DC)  : 
  Finset.card C ≤ 6 := 
by sorry
end DC34

lemma card_le_of_filter_wt3 (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ Cwr_W23_2_2) (HC : is_DelCode C) 
  (H : Finset.card (filter (fun x => wt x = 3) C) = 5) : 
  Finset.card C ≤ 6 := 
by sorry
end Cwr_W23_2_2_wt3

lemma card_Cwr_2_2_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W23) (HC : is_DelCode C)  : 
  Finset.card (Cwr C 2 2) ≤ 6 :=
by sorry
lemma card_DCs_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : Finset.card (Cwr C 2 1) = 1) : 
  Finset.card C ≤ 7 :=
by sorry
end card1

def DCs_sub_W23_len8 :Finset (Finset (List.Vector B 7)) :=
  card4.DCs_sup_DC_len8 ∪ card3.DCs_sup_DC_len8 ∪ card2.DCs_sup_DC_len8

lemma mem_DCs_sub_W23_len8 (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : 8 ≤ Finset.card C) : 
  C ∈ DCs_sub_W23_len8 :=
by sorry
end W23

def DCs_sub_W23_len8 : Finset (Finset (List.Vector B 7)) :=
{{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}}

lemma DCs_sub_W23_len8_eq : DCs_sub_W23_len8 = W23.DCs_sub_W23_len8 := by sorry

def DCs_sub_W23_len8_List : List (Finset (List.Vector B 7)) :=
[{⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}, 
 {⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩}]

lemma DCs_sub_W23_len8_list_to_Finset : 
  DCs_sub_W23_len8_List.toFinset = DCs_sub_W23_len8 := by sorry

lemma mem_DCs_sub_W23_len8_List (s : Finset (List.Vector B 7)) : 
  s ∈ DCs_sub_W23_len8_List ↔ s ∈ DCs_sub_W23_len8 :=
by sorry
lemma card_DCs_sub_W23_len8 
  (C : Finset (List.Vector B 7)) (H : C ∈ DCs_sub_W23_len8) : Finset.card C = 8 := 
by sorry
lemma card_of_sub_W23_of_ge (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W23) (HC : is_DelCode C) (H : 8 ≤ Finset.card C) : 
  Finset.card C = 8 :=
by sorry
lemma filter_wt_mem_DCs_sub_W23_len8 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) (HC : is_DelCode C) 
  (H : 8 ≤ Finset.card (filter (Icc_wt 2 3) C)) : 
  filter (Icc_wt 2 3) C ∈ DCs_sub_W23_len8 :=
by sorry
lemma card_filter_wt_of_ge
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) (HC : is_DelCode C) 
  (H : 8 ≤ Finset.card (filter (Icc_wt 2 3) C)) : 
  Finset.card (filter (Icc_wt 2 3) C) = 8 :=
by sorry
lemma div_filter_wt45 (C : Finset (List.Vector B 7)) : 
  filter (fun x => wt x = 4) C ∪ filter (fun x => wt x = 5) C = filter (Icc_wt 4 5) C := 
by sorry
lemma card_div_filter_wt45 (C : Finset (List.Vector B 7)) : 
  Finset.card (filter (fun x => wt x = 4) C) + Finset.card (filter (fun x => wt x = 5) C) = Finset.card (filter (Icc_wt 4 5) C) := 
by sorry
def W4 : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, I, O, O, O], rfl⟩, ⟨[I, I, I, O, O, I, O], rfl⟩, ⟨[I, I, I, O, O, O, I], rfl⟩, ⟨[I, I, O, I, I, O, O], rfl⟩, ⟨[I, I, O, I, O, I, O], rfl⟩, ⟨[I, I, O, I, O, O, I], rfl⟩, ⟨[I, I, O, O, I, I, O], rfl⟩, ⟨[I, I, O, O, I, O, I], rfl⟩, ⟨[I, I, O, O, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O, O], rfl⟩, 
 ⟨[I, O, I, I, O, I, O], rfl⟩, ⟨[I, O, I, I, O, O, I], rfl⟩, ⟨[I, O, I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, I, O, I], rfl⟩, ⟨[I, O, I, O, O, I, I], rfl⟩, ⟨[I, O, O, I, I, I, O], rfl⟩, ⟨[I, O, O, I, I, O, I], rfl⟩, ⟨[I, O, O, I, O, I, I], rfl⟩, ⟨[I, O, O, O, I, I, I], rfl⟩, ⟨[O, I, I, I, I, O, O], rfl⟩, 
 ⟨[O, I, I, I, O, I, O], rfl⟩, ⟨[O, I, I, I, O, O, I], rfl⟩, ⟨[O, I, I, O, I, I, O], rfl⟩, ⟨[O, I, I, O, I, O, I], rfl⟩, ⟨[O, I, I, O, O, I, I], rfl⟩, ⟨[O, I, O, I, I, I, O], rfl⟩, ⟨[O, I, O, I, I, O, I], rfl⟩, ⟨[O, I, O, I, O, I, I], rfl⟩, ⟨[O, I, O, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, O], rfl⟩, 
 ⟨[O, O, I, I, I, O, I], rfl⟩, ⟨[O, O, I, I, O, I, I], rfl⟩, ⟨[O, O, O, I, I, I, I], rfl⟩ }

lemma W4_eq : W4 = filter (fun x => wt x = 4) W25 := by sorry

lemma filter_wt4_subset_sdiff
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) (HC : is_DelCode C) : 
  filter (fun x => wt x = 4) C ⊆ W4 \ union_dB (filter (Icc_wt 2 3) C) :=
by sorry
namespace W4

namespace DC1

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC1

namespace DC2

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 1 :=
by sorry
end DC2

namespace DC3

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, O, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[O, I, I, O, I, I, O], rfl⟩, ⟨[O, I, O, I, I, O, I], rfl⟩, ⟨[O, I, O, I, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 1 :=
by sorry
end DC3

namespace DC4

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC4

namespace DC5

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC5

namespace DC6

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, O, I, I, I], rfl⟩, ⟨[O, O, O, I, I, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 1 :=
by sorry
end DC6

namespace DC7

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, I, I], rfl⟩, ⟨[O, O, I, I, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 1 :=
by sorry
end DC7

namespace DC8

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, O, O, I, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 2 :=
by sorry
end DC8

namespace DC9

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC9

namespace DC10

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, I, O], rfl⟩, ⟨[I, O, O, I, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, I, O, O], rfl⟩, ⟨[O, I, O, O, O, I, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC10

namespace DC11

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, I, O, O, O, I], rfl⟩, ⟨[I, O, O, O, I, O, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, I, I, I, O], rfl⟩, ⟨[O, O, O, O, O, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC11

namespace DC12

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, I, I, O, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, I, O, O, I], rfl⟩, ⟨[O, O, I, I, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 2 :=
by sorry
end DC12

namespace DC13

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, I, I, O, O], rfl⟩, ⟨[I, I, O, I, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 1 :=
by sorry
end DC13

namespace DC14

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, I, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, I, O, I, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, O, I, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, I, I, O, O], rfl⟩, ⟨[O, O, I, I, O, I, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 2 :=
by sorry
end DC14

namespace DC15

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, O, O, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, O, O, O, I], rfl⟩, ⟨[O, I, O, O, I, O, O], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, I, I, O, O], rfl⟩, ⟨[I, I, O, I, O, I, O], rfl⟩, ⟨[I, O, I, I, O, I, O], rfl⟩, ⟨[O, I, I, O, I, I, O], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len3' : DCs_sub_len' sdiff_dB_DC 3 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len3 : DCs_sub_len sdiff_dB_DC 3 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 2 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 2 :=
by sorry
end DC15

namespace DC16

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, I, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, O, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, O, I], rfl⟩, ⟨[O, O, I, I, O, O, I], rfl⟩, ⟨[O, O, I, O, I, I, O], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC16

namespace DC17

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, I, O], rfl⟩, ⟨[O, I, I, O, O, I, O], rfl⟩, ⟨[O, I, O, O, O, O, I], rfl⟩, ⟨[O, O, I, I, I, O, O], rfl⟩, ⟨[O, O, I, O, I, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

def sdiff_dB_DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, I, O, O, O], rfl⟩, ⟨[I, I, I, O, O, O, I], rfl⟩ }

lemma sdiff_dB_DC_eq : sdiff_dB_DC = W4 \ union_dB DC := by sorry 

lemma DCs_sub_sdiff_dB_DC_len2' : DCs_sub_len' sdiff_dB_DC 2 = ∅ := by sorry

lemma DCs_sub_sdiff_dB_DC_len2 : DCs_sub_len sdiff_dB_DC 2 = ∅ := 
by sorry
lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ sdiff_dB_DC) (HC : is_DelCode C) : 
  Finset.card C ≤ 1 := 
by sorry
lemma card_filter_wt4_le 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25)
  (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 1 :=
by sorry
end DC17

namespace DC18

def DC : Finset (List.Vector B 7) :=
{ ⟨[I, I, O, O, O, O, O], rfl⟩, ⟨[I, O, I, O, I, O, O], rfl⟩, ⟨[I, O, O, O, I, O, I], rfl⟩, ⟨[O, I, I, I, O, O, O], rfl⟩, ⟨[O, I, O, O, I, I, O], rfl⟩, ⟨[O, O, I, I, O, I, O], rfl⟩, ⟨[O, O, I, O, O, O, I], rfl⟩, ⟨[O, O, O, O, I, I, I], rfl⟩ }

lemma sdiff_dB_DC : W4 \ union_dB DC = ∅ := by sorry 

lemma card_le_of_sub_sdiff_dB_DC
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W4 \ union_dB DC) : 
  Finset.card C ≤ 0 := 
by sorry
lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) (H : filter (Icc_wt 2 3) C = DC): 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 0 := 
by sorry
end DC18

lemma card_filter_wt4_le (C : Finset (List.Vector B 7)) 
  (HCS : C ⊆ W25) (HC : is_DelCode C) 
  (H : 8 ≤ Finset.card (filter (Icc_wt 2 3) C)) : 
  Finset.card (filter (fun x => wt x = 4) C) ≤ 2 := 
by sorry
end W4

def W5 : Finset (List.Vector B 7) :=
{ ⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, O, I, I, O], rfl⟩, ⟨[I, I, I, O, I, O, I], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, I, I, I, O], rfl⟩, ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[I, I, O, I, O, I, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, 
 ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[I, O, I, O, I, I, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, I, I, O], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩, ⟨[O, I, I, I, O, I, I], rfl⟩, ⟨[O, I, I, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩ }

lemma W5_eq : W5 = filter (fun x => wt x = 5) W25 := by sorry

def DCs_sub_W5_len4 : Finset (Finset (List.Vector B 7)) := 
{{⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, I, O, I], rfl⟩, ⟨[I, O, I, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, I, O, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[O, I, I, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, O, I, I, I], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, O, I, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, O, I, I], rfl⟩}, 
 { ⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩},
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, I, O, I, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, I, I, O, O], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, O, I, I, O], rfl⟩, ⟨[I, O, I, O, I, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, I, O, I, I, O], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, O, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, I, O], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, I, I, O], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, O, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, O, I, I], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, I, O, I, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, ⟨[O, I, I, I, O, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[O, I, I, I, I, I, O], rfl⟩}, 
 {⟨[I, I, I, I, O, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, O, I, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, I, I, O], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, I, O, I], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, I, O, I], rfl⟩, ⟨[I, I, O, O, I, I, I], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, I, I, I, O], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, I, O, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[I, O, I, I, I, I, O], rfl⟩, ⟨[O, O, I, I, I, I, I], rfl⟩}, 
 {⟨[I, I, I, O, O, I, I], rfl⟩, ⟨[I, I, O, I, I, O, I], rfl⟩, ⟨[I, O, O, I, I, I, I], rfl⟩, ⟨[O, I, I, I, I, I, O], rfl⟩}}

lemma DCs_sub_W5_len4_eq' : 
  DCs_sub_W5_len4 = DCs_sub_len' W5 4 := by sorry

lemma DCs_sub_W5_len4_eq : 
  DCs_sub_W5_len4 = DCs_sub_len W5 4 := 
by sorry
lemma DCs_sub_W5_len4_succ : 
  DCs_sub_DCs_len_succ W5 DCs_sub_W5_len4 = ∅ := by sorry

lemma DCs_sub_W5_len5 : DCs_sub_len W5 5 = ∅ := 
by sorry
lemma card_le_of_sub_W5
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W5) (HC : is_DelCode C) : 
  Finset.card C ≤ 4 := 
by sorry
lemma card_filter_wt5_le
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) (HC : is_DelCode C) : 
  Finset.card (filter (fun x => wt x = 5) C) ≤ 4 := 
by sorry
lemma card_le_of_sub_W25 
  (C : Finset (List.Vector B 7)) (HCS : C ⊆ W25) (HC : is_DelCode C) : 
  Finset.card C ≤ 14 :=
by sorry
lemma optimal_of_card
  (C : Finset (List.Vector B 7)) (HC : is_DelCode C) (H : Finset.card C = 16) :
  is_optimal C HC :=
by sorry
lemma card_VTCode_7_0 : Finset.card (Finset.VTCode 7 0) = 16 := by sorry

lemma optimal_VTCode_7_0 : 
  is_optimal (Finset.VTCode 7 0) (DelCode_VTCode 7 0) := 
by sorry
end length7

