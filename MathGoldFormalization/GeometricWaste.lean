import Mathlib

open Filter Topology

/-- In Bitcoin, each hash is an independent Bernoulli trial with success probability `p`.
  `p` is defined as `Target / 2^256`.
  
  The number of hashes required to find a valid block follows a Geometric Distribution.
  The expected value (mean) of a geometric distribution is exactly `1 / p`.
  
  This theorem formalizes the "Waste Factor". It mathematically guarantees that 
  as `p` gets smaller (difficulty increases), the expected number of discarded, 
  useless hashes `(1/p) - 1` grows linearly. -/
theorem expected_hashes_geometric
    (p : ℝ) (hp1 : 0 < p) (hp2 : p < 1) :
    HasSum (fun (k : ℕ) => (k : ℝ) * p * (1 - p)^(k - 1)) (1 / p) := by
  let r := 1 - p
  have hr : ‖r‖ < 1 := by
    rw [Real.norm_eq_abs, abs_lt]
    constructor <;> linarith
  have H := hasSum_coe_mul_geometric_of_norm_lt_one hr
  have h_r_pos : r ≠ 0 := by linarith
  have H2 := H.div_const r
  have H3 := H2.mul_left p
  convert H3 using 1
  · ext k
    cases k with
    | zero => simp
    | succ k =>
      simp only [Nat.cast_succ, Nat.succ_sub_succ_eq_sub, tsub_zero]
      have Hpow : r ^ (k + 1) / r = r ^ k := by rw [pow_succ, mul_div_cancel_right₀ _ h_r_pos]
      calc (↑k + 1 : ℝ) * p * (1 - p) ^ k
        _ = p * ((↑k + 1) * r ^ k) := by ring
        _ = p * ((↑k + 1) * (r ^ (k + 1) / r)) := by rw [← Hpow]
        _ = p * ((↑k + 1) * r ^ (k + 1) / r) := by ring
  · have h_1_minus_r : 1 - r = p := by ring
    have Hdiv : r / p ^ 2 / r = 1 / p ^ 2 := by
      rw [div_div, mul_comm, ← div_div, div_self h_r_pos, one_div]
    have hp0 : p ≠ 0 := by linarith
    symm
    calc p * (r / (1 - r) ^ 2 / r)
      _ = p * (r / p ^ 2 / r) := by rw [h_1_minus_r]
      _ = p * (1 / p ^ 2) := by rw [Hdiv]
      _ = p / (p * p) := by ring
      _ = 1 / p := by rw [div_mul_eq_div_div, div_self hp0, one_div]


open Function

/-- State of the SHA-8 registers (using 8-bit words): a, b, c, d, e, f, g, h. -/
@[ext]
structure ShaState8 where
  a : Fin 256
  b : Fin 256
  c : Fin 256
  d : Fin 256
  e : Fin 256
  f : Fin 256
  g : Fin 256
  h : Fin 256
  deriving DecidableEq

/-- The step function of the SHA-8 block cipher round.
  This represents a single round of the block cipher, which acts on state `s` with
  round key `K` and message word `W`.
  
  `rest` represents the portion of the T1 calculation excluding `h`.
  `T2_func` represents `Σ0(a) + Maj(a, b, c)`. -/
def sha8_step
    (rest : Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (T2_func : Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (K W : Fin 256) (s : ShaState8) : ShaState8 :=
  let T1 := s.h + rest s.e s.f s.g K W
  let T2 := T2_func s.a s.b s.c
  {
    a := T1 + T2,
    b := s.a,
    c := s.b,
    d := s.c,
    e := s.d + T1,
    f := s.e,
    g := s.f,
    h := s.g
  }

/-- The inverse of the SHA-8 round function. -/
def sha8_step_inv
    (rest : Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (T2_func : Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (K W : Fin 256) (s : ShaState8) : ShaState8 :=
  let a := s.b
  let b := s.c
  let c := s.d
  let e := s.f
  let f := s.g
  let g := s.h
  let T2 := T2_func a b c
  let T1 := s.a - T2
  let d := s.e - T1
  let h := T1 - rest e f g K W
  {
    a := a,
    b := b,
    c := c,
    d := d,
    e := e,
    f := f,
    g := g,
    h := h
  }

theorem sha8_step_left_inv
    (rest : Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (T2_func : Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (K W : Fin 256) (s : ShaState8) :
    sha8_step_inv rest T2_func K W (sha8_step rest T2_func K W s) = s := by
  dsimp [sha8_step, sha8_step_inv]
  ext <;> simp

theorem sha8_step_right_inv
    (rest : Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (T2_func : Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (K W : Fin 256) (s : ShaState8) :
    sha8_step rest T2_func K W (sha8_step_inv rest T2_func K W s) = s := by
  dsimp [sha8_step, sha8_step_inv]
  ext <;> simp

theorem sha8_step_bijective
    (rest : Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (T2_func : Fin 256 → Fin 256 → Fin 256 → Fin 256)
    (K W : Fin 256) :
    Bijective (sha8_step rest T2_func K W) := by
  constructor
  · intro s1 s2 h
    have H := congr_arg (sha8_step_inv rest T2_func K W) h
    rw [sha8_step_left_inv, sha8_step_left_inv] at H
    exact H
  · intro s
    use sha8_step_inv rest T2_func K W s
    exact sha8_step_right_inv rest T2_func K W s


/-- State of the SHA registers (generic over any type α): a, b, c, d, e, f, g, h. -/
@[ext]
structure ShaState (α : Type*) where
  a : α
  b : α
  c : α
  d : α
  e : α
  f : α
  g : α
  h : α
  deriving DecidableEq

/-- The step function of a generic SHA block cipher round over any commutative additive group. -/
def sha_step {α : Type*} [AddCommGroup α]
    (rest : α → α → α → α → α → α)
    (T2_func : α → α → α → α)
    (K W : α) (s : ShaState α) : ShaState α :=
  let T1 := s.h + rest s.e s.f s.g K W
  let T2 := T2_func s.a s.b s.c
  {
    a := T1 + T2,
    b := s.a,
    c := s.b,
    d := s.c,
    e := s.d + T1,
    f := s.e,
    g := s.f,
    h := s.g
  }

/-- The inverse of the generic SHA round function. -/
def sha_step_inv {α : Type*} [AddCommGroup α]
    (rest : α → α → α → α → α → α)
    (T2_func : α → α → α → α)
    (K W : α) (s : ShaState α) : ShaState α :=
  let a := s.b
  let b := s.c
  let c := s.d
  let e := s.f
  let f := s.g
  let g := s.h
  let T2 := T2_func a b c
  let T1 := s.a - T2
  let d := s.e - T1
  let h := T1 - rest e f g K W
  {
    a := a,
    b := b,
    c := c,
    d := d,
    e := e,
    f := f,
    g := g,
    h := h
  }

theorem sha_step_left_inv {α : Type*} [AddCommGroup α]
    (rest : α → α → α → α → α → α)
    (T2_func : α → α → α → α)
    (K W : α) (s : ShaState α) :
    sha_step_inv rest T2_func K W (sha_step rest T2_func K W s) = s := by
  dsimp [sha_step, sha_step_inv]
  ext <;> simp

theorem sha_step_right_inv {α : Type*} [AddCommGroup α]
    (rest : α → α → α → α → α → α)
    (T2_func : α → α → α → α)
    (K W : α) (s : ShaState α) :
    sha_step rest T2_func K W (sha_step_inv rest T2_func K W s) = s := by
  dsimp [sha_step, sha_step_inv]
  ext <;> simp

theorem sha_step_bijective {α : Type*} [AddCommGroup α]
    (rest : α → α → α → α → α → α)
    (T2_func : α → α → α → α)
    (K W : α) :
    Bijective (sha_step rest T2_func K W) := by
  constructor
  · intro s1 s2 h
    have H := congr_arg (sha_step_inv rest T2_func K W) h
    rw [sha_step_left_inv, sha_step_left_inv] at H
    exact H
  · intro s
    use sha_step_inv rest T2_func K W s
    exact sha_step_right_inv rest T2_func K W s


/-- A 2-bit word facsimile of the SHA state (8 registers of 2-bit words = 16-bit total state) -/
abbrev ShaState2 := ShaState (Fin 4)

/-- The step function of a 2-bit word facsimile. -/
def sha2_step
    (rest : Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (T2_func : Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (K W : Fin 4) (s : ShaState2) : ShaState2 :=
  sha_step rest T2_func K W s

/-- The round function for the 2-bit word facsimile is bijective. -/
theorem sha2_step_bijective
    (rest : Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (T2_func : Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (K W : Fin 4) :
    Bijective (sha2_step rest T2_func K W) :=
  sha_step_bijective rest T2_func K W

/-- The 4-round function of the 2-bit facsimile (applying 4 rounds sequentially). -/
def sha2_four_rounds
    (rest : Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (T2_func : Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (Ks Ws : Fin 4 → Fin 4) (s : ShaState2) : ShaState2 :=
  sha2_step rest T2_func (Ks 3) (Ws 3) (
    sha2_step rest T2_func (Ks 2) (Ws 2) (
      sha2_step rest T2_func (Ks 1) (Ws 1) (
        sha2_step rest T2_func (Ks 0) (Ws 0) s
      )
    )
  )

/-- Proving that the 4-round 2-bit facsimile is bijective. -/
theorem sha2_four_rounds_bijective
    (rest : Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (T2_func : Fin 4 → Fin 4 → Fin 4 → Fin 4)
    (Ks Ws : Fin 4 → Fin 4) :
    Bijective (sha2_four_rounds rest T2_func Ks Ws) := by
  change Bijective (fun s => sha2_four_rounds rest T2_func Ks Ws s)
  dsimp [sha2_four_rounds]
  apply Bijective.comp
  · exact sha2_step_bijective rest T2_func (Ks 3) (Ws 3)
  · apply Bijective.comp
    · exact sha2_step_bijective rest T2_func (Ks 2) (Ws 2)
    · apply Bijective.comp
      · exact sha2_step_bijective rest T2_func (Ks 1) (Ws 1)
      · exact sha2_step_bijective rest T2_func (Ks 0) (Ws 0)




