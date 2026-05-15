import Mathlib

open Filter Topology

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
