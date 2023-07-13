;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s -all --strip-eh -S -o - | filecheck %s

;; Remove all EH instructions and tags. Converts 'throw's into 'unreachable's.

(module
  (tag $e-i32 (param i32))
  (tag $e-f32 (param f32))

  ;; CHECK:      (func $throw-i32 (type $none_=>_none)
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $throw-i32
    (throw $e-i32 (i32.const 0))
  )
  ;; CHECK:      (func $throw-f32 (type $none_=>_none)
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $throw-f32
    (throw $e-f32 (f32.const 0.0))
  )

  ;; CHECK:      (func $try-catch (type $none_=>_none)
  ;; CHECK-NEXT:  (call $throw-i32)
  ;; CHECK-NEXT: )
  (func $try-catch
    (try
      (do
        (call $throw-i32)
      )
      (catch $e-i32
        (drop (pop i32))
        (call $throw-f32)
      )
    )
  )

  ;; CHECK:      (func $try-catch2 (type $none_=>_none)
  ;; CHECK-NEXT:  (call $throw-i32)
  ;; CHECK-NEXT:  (call $throw-f32)
  ;; CHECK-NEXT: )
  (func $try-catch2
    (try
      (do
        (call $throw-i32)
        (call $throw-f32)
      )
      (catch $e-i32
        (drop (pop i32))
      )
    )
  )

  ;; CHECK:      (func $try-catch-all (type $none_=>_none)
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $try-catch-all
    (try
      (do
        (throw $e-i32 (i32.const 0))
      )
      (catch_all
        (call $throw-f32)
      )
    )
  )

  ;; CHECK:      (func $try-catch-nested (type $none_=>_none)
  ;; CHECK-NEXT:  (call $throw-i32)
  ;; CHECK-NEXT: )
  (func $try-catch-nested
    (try
      (do
        (try
          (do
            (call $throw-i32)
          )
          (catch $e-i32
            (drop (pop i32))
          )
        )
      )
      (catch_all
        (try
          (do
            (call $throw-f32)
          )
          (catch_all
            (call $throw-f32)
          )
        )
      )
    )
  )

  ;; CHECK:      (func $try-unreachable-body (type $none_=>_i32) (result i32)
  ;; CHECK-NEXT:  (i32.add
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $try-unreachable-body (result i32)
    (i32.add
      ;; This becomes unreachable while the parent expects i32, so this requires
      ;; refinalization.
      (try (result i32)
        (do
          (throw $e-i32 (i32.const 0))
        )
        (catch $e-i32
          (pop i32)
        )
      )
      (i32.const 0)
    )
  )
)