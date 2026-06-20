namespace list 
def moment: List B → Nat := sorry

namespace hidden 
def moment_sub : List B → Nat → Nat := sorry

lemma moment_sub_succ
  (X : List B) (n : Nat) :
  moment_sub X (n + 1) = moment_sub X n + num_Is X := by {
  sorry
}

def moment :=  moment_sub X 1

lemma moment_nil :
  moment [] = 0 := sorry

lemma moment_singleton :
  moment [x] = num_Is [x] := by {
  sorry
}

lemma moment_cons :
  moment (x::X) = moment X + num_Is (x::X) := by {
  sorry
}

lemma moment_iff_moment :
  moment X = List.moment X := by {
  sorry
}

end hidden 
lemma moment_nil : (moment []) = 0 := by {
  sorry
}

lemma moment_zero : (moment [O]) = 0 := by {
  sorry
}

lemma moment_one : (moment [I]) = 1 := by {
  sorry
}

lemma moment_cons :
  (moment x::X) = (moment X) + num_Is (x::X) := by {
  sorry
}

lemma moment_le_cons :
  (moment X) ≤  (moment x::X) := by {
  sorry
}

lemma moment_sDel_le : 
  (moment sDel X i) ≤ (moment X) := by {
  sorry
}

lemma moment_le_sIns :
  (moment X) ≤ (moment sIns X i b) := by {
  sorry
}

lemma moment_sIns_zero :
  (moment sIns X i O) = (moment X) + num_RIs X i := by {
  sorry
}

lemma moment_sIns_one :
  (moment sIns X i I) = (moment X) + num_LOs X i + num_Is X + 1 := by {
  sorry
}

lemma moment_sub_sDel_of_sDel_O 
  (H : sIns (sDel X i) i O = X) :
  (moment X) - (moment sDel X i) = num_RIs (sDel X i) i := by {
  sorry
}

lemma moment_sub_sDel_of_sDel_I 
  (H : sIns (sDel X i) i I = X) :
  (moment X) - (moment sDel X i) = num_LOs (sDel X i) i + num_Is (sDel X i) + 1 := by {
  sorry
}

lemma moment_sub_sDel_le :
  (moment X) - (moment sDel X i) ≤ length X := by {
  sorry
}

lemma sIns_fig_of_pos_of_moment
    (H1 : 1 ≤ length X)
    (H2 : (moment X) - (moment sDel X i) ≤ num_Is (sDel X i)) :
    sIns (sDel X i) i O = X := by {
  sorry
}

lemma sIns_fig_of_neg_of_moment
    (H1 : 1 ≤ length X)
    (H2 : ¬ (moment X) - (moment sDel X i) ≤ num_Is (sDel X i)) :
    sIns (sDel X i) i I = X:= by {
  sorry
}

end list 
namespace vector
def moment : Nat := sorry

lemma moment_nil : 
  (moment Vector.nil) = 0 := by {
  sorry
}

lemma moment_sDel_le : 
  (moment sDel X i) ≤ (moment X) := by {
  sorry
}

lemma moment_le_sIns :
  (moment X) ≤ (moment sIns X i b) := by {
  sorry
}

lemma moment_sIns_zero :
  (moment sIns X i O) = (moment X) + num_RIs X i := by {
  sorry
}

lemma moment_sIns_one :
  (moment sIns X i I) = (moment X) + num_LOs X i + wt X + 1 := by {
  sorry
}

lemma moment_sub_sDel_of_sDel_O 
  (X : Vector B (n + 1))
  (H : sIns (sDel X i) i O = X) :
  (moment X) - (moment sDel X i) = num_RIs (sDel X i) i := by {
  sorry
}

lemma moment_sub_sDel_of_sDel_I 
  (X : Vector B (n + 1))
  (H : sIns (sDel X i) i I = X) :
  (moment X) - (moment sDel X i) = num_LOs (sDel X i) i + wt (sDel X i) + 1 := by {
  sorry
}

lemma moment_sub_sDel_le :
  (moment X) - (moment sDel X i) ≤ n := by {
  sorry
}

lemma sIns_fig_of_pos_of_moment
    (X : Vector B (n + 1))
    (H : (moment X) - (moment sDel X i) ≤ wt (sDel X i)) :
    sIns (sDel X i) i O = X := by {
  sorry
}

lemma sIns_fig_of_neg_of_moment
    (X : Vector B (n + 1))
    (H : ¬ (moment X) - (moment sDel X i) ≤ wt (sDel X i)) :
    sIns (sDel X i) i I = X := by {
  sorry
}

end vector
namespace set 
def VTCode (n a : Nat) : Set (Vector B n) := sorry

def mem_VTCode :
  X ∈ VTCode n a ↔ (moment X) % (n + 1) = a % (n + 1) := sorry

namespace decoding_alg
namespace list 
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
  sub_mod (n + 1) a (sDel X i) = (moment X) - (moment sDel X i) := by {
  sorry
}

lemma sub_mod_sDel_of_pos
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : sub_mod (n + 1) a (sDel X i) ≤ num_Is (sDel X i)) :
    sub_mod (n + 1) a (sDel X i) = num_RIs (sDel X i) i := by {
  sorry
}

lemma sub_mod_sDel_of_neg
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : ¬ sub_mod (n + 1) a (sDel X i) ≤ num_Is (sDel X i)) :
    sub_mod (n + 1) a (sDel X i) = num_LOs (sDel X i) i + num_Is (sDel X i) + 1 := by {
  sorry
}

lemma sIns_fig_of_pos
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : sub_mod (n + 1) a (sDel X i) ≤ num_Is (sDel X i))   :
  sIns (sDel X i) i O = X := by {
  sorry
}

lemma sIns_fig_of_neg
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (H : ¬ sub_mod (n + 1) a (sDel X i) ≤ num_Is (sDel X i))   :
  sIns (sDel X i) i I = X := by {
  sorry
}

def min_num_LOs : List B → Nat → Nat 
|[]     _       := 0
|(x::X) 0       := 0
|(O::X) (n + 1) := min_num_LOs X n + 1
|(I::X) (n + 1) := min_num_LOs X (n + 1) + 1

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

def decoding_alg (n a : Nat) (X : List B) := sorry

lemma length_decoding_alg 
  (n a : Nat) (X : List B) (H : length X = n - 1) :
  length (decoding_alg n a X) = n := by {
  sorry
}

lemma sDelErr_correctable_of_pos
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (Hr : sub_mod (n + 1) a (sDel X i) ≤ num_Is (sDel X i)) :
    decoding_alg n a (sDel X i) = X := by {
  sorry
}

lemma sDelErr_correctable_of_neg
    {n a : Nat} {X : List B} (HX : 1 ≤ length X) 
    (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) 
    (i : Nat) (Hr : ¬ sub_mod (n + 1) a (sDel X i) ≤ num_Is (sDel X i)) :
    decoding_alg n a (sDel X i) = X := by {
  sorry
}

lemma sDelErr_correctable
  {n a : Nat} {X : List B} 
  (HXn : length X = n) (HXa : (moment X) % (n + 1) = a % (n + 1)) (i : Nat) :
  decoding_alg n a (sDel X i) = X := by {
  sorry
}

end list 
namespace vector
def sub_mod (m a : Nat) (X : Vector B n) : Nat := sorry

lemma sub_mod_zero (m : Nat) :
    sub_mod m 0 X = (m - (moment X) % m) % m := by {
  sorry
}

lemma sub_mod_mod_self (m : Nat) :
  sub_mod m m X = sub_mod m 0 X := by {
  sorry
}

lemma sub_mod_nil (m : Nat) :
    sub_mod m a Vector.nil = a % m := by {
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
  {n a : Nat} {X : Vector B n} (H : X ∈ VTCode n a) (i : Nat) : 
  sub_mod (n + 1) a (sDel X i) = (moment X) - (moment sDel X i) := by {
  sorry
}

lemma sub_mod_sDel_of_pos
  {n a : Nat} {X : Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
  (i : Nat) (H : sub_mod (n + 2) a (sDel X i) ≤ wt (sDel X i)) : 
  sub_mod (n + 2) a (sDel X i) = num_RIs (sDel X i) i := by {
  sorry
}

lemma sub_mod_sDel_of_neg
  {n a : Nat} {X : Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
  (i : Nat) (H : ¬ sub_mod (n + 2) a (sDel X i) ≤ wt (sDel X i)) : 
  sub_mod (n + 2) a (sDel X i) = num_LOs (sDel X i) i + wt (sDel X i) + 1 := by {
  sorry
}

lemma sIns_fig_of_pos
  {n a : Nat} {c : Vector B (n + 1)} (Hc : c ∈ VTCode (n + 1) a) 
  (i : Nat) (H : sub_mod (n + 2) a (sDel c i) ≤ wt (sDel c i))  :
  sIns (sDel c i) i O = c := by {
  sorry
}

lemma sIns_fig_of_neg
  {n a : Nat} {c : Vector B (n + 1)} (Hc : c ∈ VTCode (n + 1) a) 
  (i : Nat) (H : ¬ sub_mod (n + 2) a (sDel c i) ≤ wt (sDel c i))  :
  sIns (sDel c i) i I = c := by {
  sorry
}

def min_num_LOs (i : Nat) : Nat := sorry

lemma min_num_LOs_zero :
  min_num_LOs X 0 = 0 := by {
  sorry
}

lemma num_LOs_min_num_LOs (i : Nat) (H : i ≤ n - wt X) :
  num_LOs X (min_num_LOs X i) = i := by {
  sorry
}

def max_num_RIs (i : Nat) : Nat := sorry

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

def decoding_alg (n a : Nat) (X : Vector B (n - 1)) : Vector B n := sorry

lemma decoding_alg_to_list (n a : Nat) (X : Vector B (n - 1)) : 
  toList (decoding_alg n a X) = List.decoding_alg n a (toList X) := by {
  sorry
}

lemma sDelErr_correctable_of_nil
    {a : Nat} {X : Vector B 0} (H : X ∈ VTCode 0 a) (i : Nat) :
    decoding_alg 0 a (sDel X i) = X := by {
  sorry
}

lemma sDelErr_correctable_of_pos
    {n a : Nat} {X : Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
    (i : Nat) (Hr : sub_mod (n + 2) a (sDel X i) ≤ wt (sDel X i)) :
    decoding_alg (n + 1) a (sDel X i) = X := by {
  sorry
}

lemma sDelErr_correctable_of_neg
    {n a : Nat} {X : Vector B (n + 1)} (HX : X ∈ VTCode (n + 1) a) 
    (i : Nat) (Hr : ¬ sub_mod (n + 2) a (sDel X i) ≤ wt (sDel X i)) :
    decoding_alg (n + 1) a (sDel X i) = X := by {
  sorry
}

theorem sDelErr_correctable
  {n a : Nat} {c : Vector B n} 
  (Hc : c ∈ VTCode n a) (i : Nat) :
  decoding_alg n a (sDel c i) = c := by {
  sorry
}

end vector
end decoding_alg
end set 
namespace finset
def VTCode (n a : Nat) : Finset (Vector B n) := sorry

lemma mem_VTCode (n a : Nat) (x : Vector B n) :
  x ∈ Finset.VTCode n a ↔ x ∈ Set.VTCode n a := by {
  sorry
}

theorem DelCode_VTCode (n a : Nat) :
  is_DelCode (VTCode n a) := by {
  sorry
}

end finset
