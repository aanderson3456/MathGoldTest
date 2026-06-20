import Mathlib
import Mathlib.Data.List.Basic
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

/-! # Varshamov-Tenengolts Formalization -/

/-! ## Day 1: Binary Strings and 1-Deletions
We define binary strings simply as lists of booleans. 
A 1-deletion at index `i` is defined by concatenating the prefix
before `i` and the suffix after `i`.
-/

abbrev BinString := List Bool

/-- Removes the `i`-th bit from a binary string. -/
def deleteIdx (s : BinString) (i : Nat) : BinString :=
  s.take i ++ s.drop (i + 1)

/-- Example: Deleting the 0th element of `[true, false]` yields `[false]`. -/
example : deleteIdx [true, false] 0 = [false] := by {
  rfl
}

/-! ## Day 2: All 1-Deletions of a String
We now define a function that generates all possible 1-deletions of a given string.
This is done by mapping our `deleteIdx` function over all valid indices of the string,
representing the deletion ball of radius 1 (with multiplicity).
-/

/-- Returns a list of all possible 1-deletions of a binary string `s`. -/
def allDeletions (s : BinString) : List BinString :=
  (List.range s.length).map (deleteIdx s)

/-- Example: The 1-deletions of `[true]` is a list containing the empty string. -/
example : allDeletions [true] = [[]] := by rfl

/-! ## Day 3: The VT Checksum
To define the Varshamov-Tenengolts code, we first need to compute the VT checksum of a string.
The checksum is defined as the sum of the 1-based indices of the bits that are `true` (or 1).
We use a recursive helper to track the current index.
-/

/-- Helper to compute the VT checksum recursively. -/
def vtChecksumAux (s : BinString) (idx : Nat) : Nat :=
  match s with
  | [] => 0
  | b :: bs => (if b then idx else 0) + vtChecksumAux bs (idx + 1)

/-- Computes the Varshamov-Tenengolts checksum of a binary string. -/
def vtChecksum (s : BinString) : Nat :=
  vtChecksumAux s 1

/-- Example: The VT checksum of `[true, false, true]` is 1 + 3 = 4. -/
example : vtChecksum [true, false, true] = 4 := by rfl

/-! ## Day 4: Defining the VT Code
With the checksum defined, we can now formally define the Varshamov-Tenengolts code.
A binary string `s` of length `n` belongs to the VT code with parameter `a` 
if its VT checksum is congruent to `a` modulo `n + 1`.
-/

/-- Predicate for whether a string `s` is in the VT code of length `n` with parameter `a`. -/
def isVTCodeword (s : BinString) (n a : Nat) : Prop :=
  s.length = n ∧ vtChecksum s % (n + 1) = a % (n + 1)

/-- Example: `[true, false, true]` (length 3, checksum 4) is a VT codeword for n=3, a=0. -/
example : isVTCodeword [true, false, true] 3 0 := by exact ⟨rfl, rfl⟩

/-! ## Day 5: Hamming Weight of a Binary String
To rigorously prove how the VT checksum changes when a bit is deleted, 
we must track the Hamming weight (number of `true` bits) of a string and its suffixes.
We define this fundamentally via structural recursion.
-/

/-- Computes the Hamming weight (number of `true` bits) of a binary string. -/
def weight (s : BinString) : Nat :=
  match s with
  | [] => 0
  | b :: bs => (if b then 1 else 0) + weight bs

/-- Example: The weight of `[true, false, true]` is 2. -/
example : weight [true, false, true] = 2 := by rfl


/-! ## The Append Lemma
Appending a bit 'b' increases the checksum by its positional index if true.
-/
theorem vtChecksumAux_append (s : BinString) (b : Bool) (idx : Nat) :
  vtChecksumAux (s ++ [b]) idx = vtChecksumAux s idx + if b then (idx + s.length) else 0 := by
  induction s generalizing idx with
  | nil =>
    cases b <;> rfl
  | cons h t ih =>
    unfold vtChecksumAux
    rw [ih (idx + 1)]
    cases h <;> cases b <;> simp <;> omega

/-! ## Day 6: Checksum Shift Lemma
A fundamental property of the VT checksum is that shifting the starting index
by 1 increases the total checksum by exactly the Hamming weight of the string.
This is because each `true` bit contributes exactly 1 more to the sum.
-/

/-- Shifting the starting index of the checksum by 1 adds the weight of the string. -/
theorem vtChecksumAux_shift (s : BinString) (idx : Nat) :
  vtChecksumAux s (idx + 1) = vtChecksumAux s idx + weight s := by
  induction s generalizing idx with
  | nil => rfl
  | cons b bs ih =>
    unfold vtChecksumAux weight
    rw [ih (idx + 1)]
    cases b <;> omega

/-! ## Day 7: Checksum Concatenation Lemma
To analyze how deletions affect the VT checksum, we must understand how 
the checksum behaves across the concatenation of two strings. The checksum 
of `s1 ++ s2` is the checksum of `s1` plus the checksum of `s2`, where the 
starting index for `s2` is shifted by the length of `s1`.
-/

/-- The VT checksum of concatenated strings splits additively, shifting the second index. -/
theorem vtChecksumAux_concat (s1 s2 : BinString) (idx : Nat) :
  vtChecksumAux (s1 ++ s2) idx = vtChecksumAux s1 idx + vtChecksumAux s2 (idx + s1.length) := by
  induction s1 generalizing idx with
  | nil => rfl
  | cons b bs ih =>
    unfold vtChecksumAux
    rw [ih (idx + 1)]
    cases b <;> simp <;> omega

/-! ## Day 8: Weight Concatenation Lemma
To reason about the VT checksum of a string after a deletion (which is essentially
concatenating a prefix and a suffix), we need to know that the Hamming weight 
is additive over concatenation.
-/

/-- The Hamming weight of concatenated strings is the sum of their weights. -/
theorem weight_concat (s1 s2 : BinString) :
  weight (s1 ++ s2) = weight s1 + weight s2 := by
  induction s1 with
  | nil => simp [weight]
  | cons b bs ih => simp [weight, ih, add_assoc]

/-! ## Day 9: Properties of Deleted Strings
Now we analyze how our core functions interact with `deleteIdx`.
Since `deleteIdx` is defined as a concatenation of a `take` prefix and a `drop` suffix,
we can apply our concatenation lemmas to both the weight and the VT checksum.
-/

/-- The weight of a deleted string splits into the weights of its prefix and suffix. -/
theorem weight_deleteIdx (s : BinString) (i : Nat) :
  weight (deleteIdx s i) = weight (s.take i) + weight (s.drop (i + 1)) := by
  unfold deleteIdx
  rw [weight_concat]

/-- The checksum of a deleted string splits similarly, shifting the starting index for the suffix. -/
theorem vtChecksumAux_deleteIdx (s : BinString) (i idx : Nat) :
    vtChecksumAux (s.take i) idx + vtChecksumAux (s.drop (i + 1)) (idx + (s.take i).length) := by
  unfold deleteIdx
  rw [vtChecksumAux_concat]

/-! ## Day 10: Length of a Deleted String
An important property of the `deleteIdx` function is that it reduces the length
of the binary string by exactly one, provided the deletion index is strictly within bounds.
We formalize this length property, which is crucial for proving that 1-deletions of
length `n` strings belong to the space of length `n-1` strings.
-/

/-- The length of a binary string after applying `deleteIdx` at a valid index `i` is `s.length - 1`. -/
theorem length_deleteIdx (s : BinString) (i : Nat) (h : i < s.length) :
  (deleteIdx s i).length = s.length - 1 := by
  unfold deleteIdx
  simp
  omega

/-! ## Day 11: Weight of Original vs Deleted String
To connect the checksum and weight of the original string to those of the 1-deleted string, 
we need to relate their weights. When a bit at index `i` is removed, the total weight
of the string is reduced exactly by the value of that bit (1 if `true`, 0 if `false`).
We express this additively to avoid natural number subtraction issues.
-/

/-- The weight of the original string is the weight of the deleted string plus the deleted bit. -/
theorem weight_eq_weight_deleteIdx_add (s : BinString) (i : Nat) (h : i < s.length) :
  weight s = weight (deleteIdx s i) + if s.get ⟨i, h⟩ then 1 else 0 := by
  unfold deleteIdx
  rw [weight_concat]
  have H : weight s = weight (s.take i) + weight (s.drop i) := by
    nth_rw 1 [← List.take_append_drop i s]
    rw [weight_concat]
  rw [H]
  have H2 : s.drop i = s.get ⟨i, h⟩ :: s.drop (i + 1) := by
    exact List.drop_eq_getElem_cons h
  rw [H2]
  unfold weight
  cases s.get ⟨i, h⟩ <;> omega

/-! ## Day 12: Checksum of Original vs Deleted String
We now connect the VT checksum of the original string to that of the 1-deleted string.
When the bit at index `i` is removed, the total checksum decreases by two components:
1. The contribution of the removed bit itself (if `true`, its index is `idx + i`).
2. The weight of the suffix after `i`, because the indices of all subsequent `true` 
   bits are shifted left and thus reduced by exactly 1.
-/

/-- The checksum of the original string equals the checksum of the deleted string 
plus the removed bit's contribution and the weight of the trailing suffix. -/
theorem vtChecksumAux_eq_deleteIdx_add (s : BinString) (i idx : Nat) (h : i < s.length) :
  vtChecksumAux s idx = vtChecksumAux (deleteIdx s i) idx + 
    (if s.get ⟨i, h⟩ then idx + i else 0) + 
    weight (s.drop (i + 1)) := by
  rw [vtChecksumAux_deleteIdx]
  have H : vtChecksumAux s idx = vtChecksumAux (s.take i) idx + vtChecksumAux (s.drop i) (idx + (s.take i).length) := by
    nth_rw 1 [← List.take_append_drop i s]
    rw [vtChecksumAux_concat]
  rw [H]
  have H2 : s.drop i = s.get ⟨i, h⟩ :: s.drop (i + 1) := by
    exact List.drop_eq_getElem_cons h
  rw [H2]
  unfold vtChecksumAux
  have H3 : (s.take i).length = i := List.length_take_of_le (by omega)
  rw [H3]
  cases s.get ⟨i, h⟩ <;> omega

/-! ## Day 13: Top-Level Checksum Difference Lemma
We now apply the checksum difference lemma to the top-level `vtChecksum` function, 
which sets the starting index to 1. This theorem gives us the exact formula 
for how the VT checksum changes after any 1-deletion, a crucial component for 
our final proofs about the VT code.
-/

/-- The VT checksum of the original string equals the checksum of the deleted string 
plus the removed bit's 1-based index (if true) and the weight of the trailing suffix. -/
theorem vtChecksum_eq_deleteIdx_add (s : BinString) (i : Nat) (h : i < s.length) :
  vtChecksum s = vtChecksum (deleteIdx s i) + 
    (if s.get ⟨i, h⟩ then 1 + i else 0) + 
    weight (s.drop (i + 1)) := by
  unfold vtChecksum
  exact vtChecksumAux_eq_deleteIdx_add s i 1 h

/-! ## Day 14: Bit Insertion
To reason about decoding a 1-deletion, we need the inverse operation: inserting a bit.
We define a function that inserts a bit `b` at index `i` by concatenating the prefix
before `i`, the new bit `b`, and the original suffix from `i` onwards.
-/

/-- Inserts a bit `b` at index `i` into a binary string `s`. -/
def insertIdx (s : BinString) (i : Nat) (b : Bool) : BinString :=
  s.take i ++ (b :: s.drop i)

/-- Example: Inserting `true` at index 1 of `[false, false]` yields `[false, true, false]`. -/
example : insertIdx [false, false] 1 true = [false, true, false] := by rfl

/-! ## Day 15: Length of an Inserted String
Just as `deleteIdx` decreases the length of a string by one, `insertIdx` increases 
its length by exactly one. This fundamental property will be necessary when proving 
that inserting a bit into a length `n-1` string results in a length `n` string.
-/

/-- The length of a binary string after applying `insertIdx` is `s.length + 1`. -/
theorem length_insertIdx (s : BinString) (i : Nat) (b : Bool) :
  (insertIdx s i b).length = s.length + 1 := by
  unfold insertIdx
  have h : s.length = (s.take i).length + (s.drop i).length := by
    nth_rw 1 [← List.take_append_drop i s]
    simp
    omega
  simp
  omega

/-! ## Day 16: Deletion-Insertion Identity
To prove that the Varshamov-Tenengolts code can perfectly correct a single deletion,
we must formally establish that inserting the correct bit at the correct index
perfectly reconstructs the original string. This is the deletion-insertion identity.
-/

/-- Inserting the deleted bit back at its original index recovers the original string. -/
theorem insertIdx_deleteIdx (s : BinString) (i : Nat) (h : i < s.length) :
  insertIdx (deleteIdx s i) i (s.get ⟨i, h⟩) = s := by
  induction i generalizing s with
  | zero =>
    cases s with
    | nil => contradiction
    | cons b bs =>
      unfold insertIdx deleteIdx
      simp
  | succ i ih =>
    cases s with
    | nil => contradiction
    | cons b bs =>
      unfold insertIdx deleteIdx
      simp
      apply ih

/-! ## Day 17: Weight of an Inserted String
Continuing our analysis of the `insertIdx` function, we now formally describe
how inserting a bit affects the Hamming weight of the binary string.
Because `insertIdx` builds the string by adding exactly one new bit `b`, the total
weight of the new string is simply the original string's weight plus the new bit's value.
-/

/-- The weight of a string after inserting a bit `b` is the original string's weight
plus the value of the inserted bit (1 if true, 0 if false). -/
theorem weight_insertIdx (s : BinString) (i : Nat) (b : Bool) :
  weight (insertIdx s i b) = weight s + if b then 1 else 0 := by
  unfold insertIdx
  rw [weight_concat]
  have h : weight s = weight (s.take i) + weight (s.drop i) := by
    nth_rw 1 [← List.take_append_drop i s]
    rw [weight_concat]
  simp [weight]
  omega

/-! ## Day 18: Checksum of an Inserted String
Similar to how we analyzed the checksum after deletion, we now analyze the 
checksum after insertion. Inserting a bit `b` at index `i` increases the 
total checksum by the new bit's positional contribution (if `true`) and by 
the weight of the suffix, as all subsequent bits are shifted to the right by one position.
-/

/-- The VT checksum of an inserted string equals the original checksum 
plus the inserted bit's contribution and the weight of the trailing suffix. -/
theorem vtChecksumAux_insertIdx (s : BinString) (i idx : Nat) (h : i ≤ s.length) (b : Bool) :
  vtChecksumAux (insertIdx s i b) idx = 
    vtChecksumAux s idx + (if b then idx + i else 0) + weight (s.drop i) := by
  unfold insertIdx
  rw [vtChecksumAux_concat]
  have H : vtChecksumAux s idx = vtChecksumAux (s.take i) idx + vtChecksumAux (s.drop i) (idx + (s.take i).length) := by
    nth_rw 1 [← List.take_append_drop i s]
    rw [vtChecksumAux_concat]
  rw [H]
  unfold vtChecksumAux
  have H3 : (s.take i).length = i := List.length_take_of_le h
  rw [H3]
  rw [vtChecksumAux_shift]
  cases b <;> omega

/-! ## Day 19: Top-Level Checksum Insertion Lemma
Now we apply our insertion checksum lemma to the top-level `vtChecksum` function. 
Setting the starting index to 1 gives us the exact formula for how the VT checksum 
changes when any bit is inserted. This completes the core additive properties 
needed to prove the exact error-correcting capabilities of the VT code.
-/

/-- The top-level VT checksum of an inserted string equals the original checksum 
plus the inserted bit's 1-based index (if true) and the weight of the trailing suffix. -/
theorem vtChecksum_insertIdx (s : BinString) (i : Nat) (h : i ≤ s.length) (b : Bool) :
  vtChecksum (insertIdx s i b) = vtChecksum s + 
    (if b then 1 + i else 0) + 
    weight (s.drop i) := by
  unfold vtChecksum
  exact vtChecksumAux_insertIdx s i 1 h b

/-! ## Day 20: The VT Defect
To decode a received string (which has suffered a 1-deletion), we need to compute 
how much the checksum is "missing" compared to the expected parameter `a` modulo `n + 1`.
This difference, called the defect, guides the decoding algorithm. We add `n + 1` 
before subtracting to avoid natural number underflow.
-/

/-- Computes the checksum defect of a received string modulo `n + 1`. -/
def vtDefect (s : BinString) (n a : Nat) : Nat :=
  (a + (n + 1) - (vtChecksum s % (n + 1))) % (n + 1)

/-- Example: If n=3, a=0, and the string is `[true, false]` (checksum 1), 
the defect is (0 + 4 - 1) % 4 = 3. -/
example : vtDefect [true, false] 3 0 = 3 := by rfl

/-! ## Day 21: Decoded Missing Bit
According to the Varshamov-Tenengolts decoding algorithm, the value of the 
deleted bit can be determined purely by comparing the checksum defect to the 
Hamming weight of the received (deleted) string. If the defect is less than 
or equal to the weight, the missing bit is `false` (0). If the defect is strictly 
greater than the weight, the missing bit is `true` (1).
-/

/-- Determines the boolean value of the deleted bit based on the defect and current weight. -/
def missingBit (s : BinString) (defect : Nat) : Bool :=
  defect > weight s

/-- Example: If defect is 3 and the weight of `[true, false, true]` is 2, the missing bit is `true`. -/
example : missingBit [true, false, true] 3 = true := by rfl

/-! ## Day 22: Zero Weight of a Binary String
In the Varshamov-Tenengolts decoding algorithm, determining the exact insertion index 
when the missing bit is `true` (1) requires counting the number of `false` (0) bits 
(e.g., finding the number of zeros to the left of the missing bit).
We define the `zeroWeight` of a string symmetrically to the Hamming weight.
-/

/-- Computes the number of `false` bits (zeros) in a binary string. -/
def zeroWeight (s : BinString) : Nat :=
  match s with
  | [] => 0
  | b :: bs => (if b then 0 else 1) + zeroWeight bs

/-- Example: The zero weight of `[true, false, false]` is 2. -/
example : zeroWeight [true, false, false] = 2 := by rfl

/-! ## Day 23: Sum of Weights Lemma
A fundamental property of binary strings is that every bit is either `true` (1) or `false` (0).
Therefore, the sum of the Hamming weight (number of ones) and the zero weight (number of zeros)
must perfectly equal the total length of the binary string.
-/

/-- The sum of the weight and zero-weight of a binary string equals its length. -/
theorem weight_add_zeroWeight (s : BinString) :
  weight s + zeroWeight s = s.length := by
  induction s with
  | nil => rfl
  | cons b bs ih =>
    cases b
    · simp [weight, zeroWeight]; omega
    · simp [weight, zeroWeight]; omega

/-! ## Day 24: Zero Weight Concatenation Lemma
Just as with the Hamming weight, the zero weight (number of `false` bits) is strictly additive 
over concatenation. This property will be necessary when decomposing the zero weight of a 
string into the zero weights of its prefix and suffix around an insertion point.
-/

/-- The zero weight of concatenated strings is the sum of their zero weights. -/
theorem zeroWeight_concat (s1 s2 : BinString) :
  zeroWeight (s1 ++ s2) = zeroWeight s1 + zeroWeight s2 := by
  induction s1 with
  | nil => simp [zeroWeight]
  | cons b bs ih => simp [zeroWeight, ih, add_assoc]

/-! ## Day 25: Zero Weight of an Inserted String
Continuing our analysis of the structural properties of binary strings, 
we now establish how inserting a bit affects the zero weight. 
Symmetrically to the Hamming weight, the total zero weight of the new 
string is simply the original string's zero weight plus 1 if the inserted bit is `false`, 
and remains unchanged if the inserted bit is `true`.
-/

/-- The zero weight of a string after inserting a bit `b` is the original string's zero weight
plus 1 if `b` is false, and 0 if `b` is true. -/
theorem zeroWeight_insertIdx (s : BinString) (i : Nat) (b : Bool) :
  zeroWeight (insertIdx s i b) = zeroWeight s + if b then 0 else 1 := by
  unfold insertIdx
  rw [zeroWeight_concat]
  have h : zeroWeight s = zeroWeight (s.take i) + zeroWeight (s.drop i) := by
    nth_rw 1 [← List.take_append_drop i s]
    rw [zeroWeight_concat]
  simp [zeroWeight]
  omega

/-! ## Day 26: Decoding Index for a Missing Zero
When the missing bit is `false` (0), the Varshamov-Tenengolts algorithm states that 
the defect perfectly equals the number of `true` (1) bits to the right of the 
deleted bit. We define a recursive function to find the earliest insertion 
index that leaves exactly `defect` number of `true` bits to its right.
-/

/-- Finds the insertion index for a missing `false` bit by matching the suffix weight. -/
def decodeIdxZero (s : BinString) (defect : Nat) : Nat :=
  match s with
  | [] => 0
  | b :: bs => 
    if weight (b :: bs) = defect then 0 
    else 1 + decodeIdxZero bs defect

/-- Example: If the defect is 1 and the string is `[true, true]`, 
we need 1 true bit to the right, so we insert at index 1. -/
example : decodeIdxZero [true, true] 1 = 1 := by rfl

/-! ## Day 27: Decoding Index for a Missing One
When the missing bit is `true` (1), the defect relates to the number of `false` (0) bits 
to the left of the deleted bit. Specifically, the number of zeros to the left 
is exactly `defect - weight s - 1`. We define a recursive function to find the 
insertion index that skips exactly this many zeros.
-/

/-- Finds the insertion index for a missing `true` bit by skipping `zerosLeft` zeros. -/
def decodeIdxOne (s : BinString) (zerosLeft : Nat) : Nat :=
  match s with
  | [] => 0
  | b :: bs => 
    if zerosLeft = 0 then 0 
    else if b = false then 1 + decodeIdxOne bs (zerosLeft - 1)
    else 1 + decodeIdxOne bs zerosLeft

/-- Example: Skipping 1 zero in `[true, false, true]` gives index 2. -/
example : decodeIdxOne [true, false, true] 1 = 2 := by rfl

/-! ## Day 28: Full VT Decoding Algorithm
We now combine our defect calculation, missing bit identification, and index 
decoding functions into the complete Varshamov-Tenengolts decoding algorithm.
Given a received string (which has suffered a 1-deletion) and the original 
length `n` and parameter `a`, it reconstructs the original string by inserting 
the correct bit at the computed index.
-/

/-- Reconstructs the original string from a 1-deleted string `s` using VT parameter `a` and original length `n`. -/
def vtDecode (s : BinString) (n a : Nat) : BinString :=
  let defect := vtDefect s n a
  let b := missingBit s defect
  let idx := if b then decodeIdxOne s (defect - weight s - 1) else decodeIdxZero s defect
  insertIdx s idx b

/-- Example: Decoding `[false]` (received length 1, original length 2, parameter a=0). -/
example : vtDecode [false] 2 0 = [false, false] := by rfl

/-! ## Day 29: Bounds for Zero Decoding Index
To prove that our `vtDecode` function is well-behaved, we must ensure that the 
computed insertion indices are valid. We start by proving that the index computed 
by `decodeIdxZero` is always less than or equal to the length of the string.
This guarantees that `insertIdx` will insert at a valid position.
-/

/-- The index returned by `decodeIdxZero` is at most the length of the string. -/
theorem decodeIdxZero_le_length (s : BinString) (defect : Nat) :
  decodeIdxZero s defect ≤ s.length := by
  induction s with
  | nil =>
    unfold decodeIdxZero
    simp
  | cons b bs ih =>
    unfold decodeIdxZero
    split
    · omega
    · simp; omega

/-! ## Day 30: Bounds for One Decoding Index
Similarly to the zero decoding index, we must ensure that the index computed 
by `decodeIdxOne` is bounded by the length of the string. This guarantees that 
inserting the missing `true` bit will occur at a valid position, preventing 
out-of-bounds operations during the final proof of the VT decoding algorithm.
-/

/-- The index returned by `decodeIdxOne` is at most the length of the string. -/
theorem decodeIdxOne_le_length (s : BinString) (zerosLeft : Nat) :
  decodeIdxOne s zerosLeft ≤ s.length := by
  induction s generalizing zerosLeft with
  | nil =>
    unfold decodeIdxOne
    simp
  | cons b bs ih =>
    unfold decodeIdxOne
    split
    · omega
    · split
      · have := ih (zerosLeft - 1); simp; omega
      · have := ih zerosLeft; simp; omega

/-! ## Day 31: Suffix Weight at Zero Decoding Index
To prove that `vtDecode` correctly reconstructs the missing `false` (0) bit,
we must establish that the suffix starting at `decodeIdxZero` has a Hamming weight
exactly equal to the `defect`. This formalizes the core logic of finding the right insertion point.
-/

/-- The weight of the suffix starting at the index chosen by `decodeIdxZero` perfectly equals the defect, assuming the defect is achievable. -/
theorem weight_drop_decodeIdxZero (s : BinString) (defect : Nat) (h : defect ≤ weight s) :
  weight (s.drop (decodeIdxZero s defect)) = defect := by
  induction s with
  | nil =>
    unfold decodeIdxZero
    simp at h
    simp [h]
  | cons b bs ih =>
    unfold decodeIdxZero
    split
    · next heq =>
      simp [heq]
    · next hneq =>
      have h_drop : (b :: bs).drop (1 + decodeIdxZero bs defect) = bs.drop (decodeIdxZero bs defect) := by
        rw [Nat.add_comm]
        rfl
      rw [h_drop]
      apply ih
      unfold weight at h
      cases b
      · simp at h; omega
      · simp at h; omega

/-! # VT Color Assignment Logic

We built this to fix a bug in the Snakey game where on rare days both players had the exact same color!
The game uses a 5-bit Varshamov-Tenengolts (VT) checksum to pick colors (modulo 12).
By proving `VT_no_collision`, we mathematically guarantee that complementary bit-strings 
(representing player 1 and player 2) will never share the same color.
-/

def S (n : ℕ) : ℕ :=
  (1 * (n % 2)) +
  (2 * ((n / 2) % 2)) +
  (3 * ((n / 4) % 2)) +
  (4 * ((n / 8) % 2)) +
  (5 * ((n / 16) % 2))

theorem S_comp (n : ℕ) (h : n < 32) : S n + S (31 - n) = 15 := by
  unfold S
  omega

theorem VT_no_collision (n : ℕ) (h : n < 32) : S n % 12 ≠ S (31 - n) % 12 := by
  unfold S
  omega

