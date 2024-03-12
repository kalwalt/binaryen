;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.
;; RUN: wasm-opt %s --remove-unused-names -all -S -o - | filecheck %s

(module
  ;; CHECK:      (tag $tag$0 (param i32))
  (tag $tag$0 (param i32))

  ;; CHECK:      (func $func0 (type $0)
  ;; CHECK-NEXT:  (try $__delegate__label$9
  ;; CHECK-NEXT:   (do
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (catch_all
  ;; CHECK-NEXT:    (try $__delegate__label$8
  ;; CHECK-NEXT:     (do
  ;; CHECK-NEXT:      (try
  ;; CHECK-NEXT:       (do
  ;; CHECK-NEXT:        (rethrow $__delegate__label$9)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:       (delegate $__delegate__label$8)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:     (catch $tag$0
  ;; CHECK-NEXT:      (drop
  ;; CHECK-NEXT:       (pop i32)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $func0
    (try $label$9 ;; needed due to a rethrow
      (do)
      (catch_all
        (try $label$8 ;; needed due to a delegate
          (do
            (try $label$6 ;; this one is not needed
              (do
                (rethrow $label$9)
              )
              (delegate $label$8)
            )
          )
          (catch $tag$0
            (drop
              (pop i32)
            )
          )
        )
      )
    )
  )

  ;; CHECK:      (func $func1 (type $0)
  ;; CHECK-NEXT:  (try
  ;; CHECK-NEXT:   (do
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (delegate 0)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $func1
    (try $label$3 ;; this one is not needed
      (do
        (nop)
      )
      (delegate 0) ;; delegates to the caller
    )
  )
)
