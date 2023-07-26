;; NOTE: Assertions have been generated by update_lit_checks.py and should not be edited.

;; Test that BrOn expressions are still typed and emitted correctly when they
;; carry values.

;; RUN: wasm-opt %s -all -S -o - | filecheck %s
;; RUN: wasm-opt %s -all --roundtrip --vacuum --coalesce-locals --vacuum -S -o - | filecheck %s --check-prefix=RTRIP

(module
  ;; CHECK:      (func $br_on_null-i32 (type $none_=>_none)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 (ref none))
  ;; CHECK-NEXT:      (br_on_null $l
  ;; CHECK-NEXT:       (i32.const 0)
  ;; CHECK-NEXT:       (ref.null none)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_null-i32 (type $none_=>_none)
  ;; RTRIP-NEXT:  (local $0 (i32 nullref))
  ;; RTRIP-NEXT:  (local $1 i32)
  ;; RTRIP-NEXT:  (drop
  ;; RTRIP-NEXT:   (block $label$1 (result i32)
  ;; RTRIP-NEXT:    (local.set $0
  ;; RTRIP-NEXT:     (block $label$2 (result i32 (ref none))
  ;; RTRIP-NEXT:      (local.set $0
  ;; RTRIP-NEXT:       (br_on_null $label$1
  ;; RTRIP-NEXT:        (i32.const 0)
  ;; RTRIP-NEXT:        (ref.null none)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (ref.as_non_null
  ;; RTRIP-NEXT:        (tuple.extract 1
  ;; RTRIP-NEXT:         (local.get $0)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (drop
  ;; RTRIP-NEXT:     (ref.as_non_null
  ;; RTRIP-NEXT:      (tuple.extract 1
  ;; RTRIP-NEXT:       (local.get $0)
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_null-i32
    (drop
      (block $l (result i32)
        (drop
          (block $l2 (result i32 (ref none))
            (br_on_null $l
              (i32.const 0)
              (ref.null none)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_null-pair (type $none_=>_none)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 i32)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 i32 (ref none))
  ;; CHECK-NEXT:      (br_on_null $l
  ;; CHECK-NEXT:       (tuple.make
  ;; CHECK-NEXT:        (i32.const 0)
  ;; CHECK-NEXT:        (i32.const 1)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:       (ref.null none)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_null-pair (type $none_=>_none)
  ;; RTRIP-NEXT:  (local $0 (i32 i32 nullref))
  ;; RTRIP-NEXT:  (local $1 i32)
  ;; RTRIP-NEXT:  (local $2 (i32 i32))
  ;; RTRIP-NEXT:  (local.set $2
  ;; RTRIP-NEXT:   (block $label$1 (result i32 i32)
  ;; RTRIP-NEXT:    (local.set $0
  ;; RTRIP-NEXT:     (block $label$2 (result i32 i32 (ref none))
  ;; RTRIP-NEXT:      (local.set $0
  ;; RTRIP-NEXT:       (br_on_null $label$1
  ;; RTRIP-NEXT:        (tuple.make
  ;; RTRIP-NEXT:         (i32.const 0)
  ;; RTRIP-NEXT:         (i32.const 1)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:        (ref.null none)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (tuple.extract 1
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (ref.as_non_null
  ;; RTRIP-NEXT:        (tuple.extract 2
  ;; RTRIP-NEXT:         (local.get $0)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (drop
  ;; RTRIP-NEXT:     (ref.as_non_null
  ;; RTRIP-NEXT:      (tuple.extract 2
  ;; RTRIP-NEXT:       (local.get $0)
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_null-pair
    (drop
      (block $l (result i32 i32)
        (drop
          (block $l2 (result i32 i32 (ref none))
            (br_on_null $l
              (tuple.make
                (i32.const 0)
                (i32.const 1)
              )
              (ref.null none)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_non_null-i32 (type $none_=>_none)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 (ref none))
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32)
  ;; CHECK-NEXT:      (br_on_non_null $l
  ;; CHECK-NEXT:       (i32.const 0)
  ;; CHECK-NEXT:       (ref.null none)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_non_null-i32 (type $none_=>_none)
  ;; RTRIP-NEXT:  (local $0 (i32 nullref))
  ;; RTRIP-NEXT:  (local $1 i32)
  ;; RTRIP-NEXT:  (local.set $0
  ;; RTRIP-NEXT:   (block $label$1 (result i32 (ref none))
  ;; RTRIP-NEXT:    (drop
  ;; RTRIP-NEXT:     (br_on_non_null $label$1
  ;; RTRIP-NEXT:      (i32.const 0)
  ;; RTRIP-NEXT:      (ref.null none)
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT:  (drop
  ;; RTRIP-NEXT:   (ref.as_non_null
  ;; RTRIP-NEXT:    (tuple.extract 1
  ;; RTRIP-NEXT:     (local.get $0)
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_non_null-i32
    (drop
      (block $l (result i32 (ref none))
        (drop
          (block $l2 (result i32)
            (br_on_non_null $l
              (i32.const 0)
              (ref.null none)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_non_null-pair (type $none_=>_none)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 i32 (ref none))
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 i32)
  ;; CHECK-NEXT:      (br_on_non_null $l
  ;; CHECK-NEXT:       (tuple.make
  ;; CHECK-NEXT:        (i32.const 0)
  ;; CHECK-NEXT:        (i32.const 1)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:       (ref.null none)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_non_null-pair (type $none_=>_none)
  ;; RTRIP-NEXT:  (local $0 (i32 i32))
  ;; RTRIP-NEXT:  (local $1 i32)
  ;; RTRIP-NEXT:  (local $2 (i32 i32 nullref))
  ;; RTRIP-NEXT:  (local.set $2
  ;; RTRIP-NEXT:   (block $label$1 (result i32 i32 (ref none))
  ;; RTRIP-NEXT:    (local.set $0
  ;; RTRIP-NEXT:     (block $label$2 (result i32 i32)
  ;; RTRIP-NEXT:      (local.set $0
  ;; RTRIP-NEXT:       (br_on_non_null $label$1
  ;; RTRIP-NEXT:        (tuple.make
  ;; RTRIP-NEXT:         (i32.const 0)
  ;; RTRIP-NEXT:         (i32.const 1)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:        (ref.null none)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (tuple.extract 1
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT:  (drop
  ;; RTRIP-NEXT:   (ref.as_non_null
  ;; RTRIP-NEXT:    (tuple.extract 2
  ;; RTRIP-NEXT:     (local.get $2)
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_non_null-pair
    (drop
      (block $l (result i32 i32 (ref none))
        (drop
          (block $l2 (result i32 i32)
            (br_on_non_null $l
              (tuple.make
                (i32.const 0)
                (i32.const 1)
              )
              (ref.null none)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_cast-i32 (type $anyref_=>_none) (param $x anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 structref)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 (ref any))
  ;; CHECK-NEXT:      (br_on_cast $l anyref structref
  ;; CHECK-NEXT:       (i32.const 0)
  ;; CHECK-NEXT:       (local.get $x)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_cast-i32 (type $anyref_=>_none) (param $0 anyref)
  ;; RTRIP-NEXT:  (local $1 (i32 anyref))
  ;; RTRIP-NEXT:  (local $2 i32)
  ;; RTRIP-NEXT:  (local $3 (i32 structref))
  ;; RTRIP-NEXT:  (local.set $3
  ;; RTRIP-NEXT:   (block $label$1 (result i32 structref)
  ;; RTRIP-NEXT:    (local.set $1
  ;; RTRIP-NEXT:     (block $label$2 (result i32 (ref any))
  ;; RTRIP-NEXT:      (local.set $1
  ;; RTRIP-NEXT:       (br_on_cast $label$1 anyref structref
  ;; RTRIP-NEXT:        (i32.const 0)
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (ref.as_non_null
  ;; RTRIP-NEXT:        (tuple.extract 1
  ;; RTRIP-NEXT:         (local.get $1)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (drop
  ;; RTRIP-NEXT:     (ref.as_non_null
  ;; RTRIP-NEXT:      (tuple.extract 1
  ;; RTRIP-NEXT:       (local.get $1)
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_cast-i32 (param $x anyref)
    (drop
      (block $l (result i32 structref)
        (drop
          (block $l2 (result i32 (ref any))
            (br_on_cast $l anyref structref
              (i32.const 0)
              (local.get $x)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_cast-pair (type $anyref_=>_none) (param $x anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 i32 structref)
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 i32 (ref any))
  ;; CHECK-NEXT:      (br_on_cast $l anyref structref
  ;; CHECK-NEXT:       (tuple.make
  ;; CHECK-NEXT:        (i32.const 0)
  ;; CHECK-NEXT:        (i32.const 1)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:       (local.get $x)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_cast-pair (type $anyref_=>_none) (param $0 anyref)
  ;; RTRIP-NEXT:  (local $1 (i32 i32 anyref))
  ;; RTRIP-NEXT:  (local $2 i32)
  ;; RTRIP-NEXT:  (local $3 (i32 i32 structref))
  ;; RTRIP-NEXT:  (local.set $3
  ;; RTRIP-NEXT:   (block $label$1 (result i32 i32 structref)
  ;; RTRIP-NEXT:    (local.set $1
  ;; RTRIP-NEXT:     (block $label$2 (result i32 i32 (ref any))
  ;; RTRIP-NEXT:      (local.set $1
  ;; RTRIP-NEXT:       (br_on_cast $label$1 anyref structref
  ;; RTRIP-NEXT:        (tuple.make
  ;; RTRIP-NEXT:         (i32.const 0)
  ;; RTRIP-NEXT:         (i32.const 1)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (tuple.extract 1
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (ref.as_non_null
  ;; RTRIP-NEXT:        (tuple.extract 2
  ;; RTRIP-NEXT:         (local.get $1)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (drop
  ;; RTRIP-NEXT:     (ref.as_non_null
  ;; RTRIP-NEXT:      (tuple.extract 2
  ;; RTRIP-NEXT:       (local.get $1)
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_cast-pair (param $x anyref)
    (drop
      (block $l (result i32 i32 structref)
        (drop
          (block $l2 (result i32 i32 (ref any))
            (br_on_cast $l anyref structref
              (tuple.make
                (i32.const 0)
                (i32.const 1)
              )
              (local.get $x)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_cast_fail-i32 (type $anyref_=>_none) (param $x anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 (ref any))
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 structref)
  ;; CHECK-NEXT:      (br_on_cast_fail $l anyref structref
  ;; CHECK-NEXT:       (i32.const 0)
  ;; CHECK-NEXT:       (local.get $x)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_cast_fail-i32 (type $anyref_=>_none) (param $0 anyref)
  ;; RTRIP-NEXT:  (local $1 (i32 structref))
  ;; RTRIP-NEXT:  (local $2 i32)
  ;; RTRIP-NEXT:  (local $3 (i32 anyref))
  ;; RTRIP-NEXT:  (local.set $3
  ;; RTRIP-NEXT:   (block $label$1 (result i32 (ref any))
  ;; RTRIP-NEXT:    (local.set $1
  ;; RTRIP-NEXT:     (block $label$2 (result i32 structref)
  ;; RTRIP-NEXT:      (local.set $1
  ;; RTRIP-NEXT:       (br_on_cast_fail $label$1 anyref structref
  ;; RTRIP-NEXT:        (i32.const 0)
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (tuple.extract 1
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT:  (drop
  ;; RTRIP-NEXT:   (ref.as_non_null
  ;; RTRIP-NEXT:    (tuple.extract 1
  ;; RTRIP-NEXT:     (local.get $3)
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_cast_fail-i32 (param $x anyref)
    (drop
      (block $l (result i32 (ref any))
        (drop
          (block $l2 (result i32 structref)
            (br_on_cast_fail $l anyref structref
              (i32.const 0)
              (local.get $x)
            )
          )
        )
        (unreachable)
      )
    )
  )

  ;; CHECK:      (func $br_on_cast_fail-pair (type $anyref_=>_none) (param $x anyref)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (block $l (result i32 i32 (ref any))
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (block $l2 (result i32 i32 structref)
  ;; CHECK-NEXT:      (br_on_cast_fail $l anyref structref
  ;; CHECK-NEXT:       (tuple.make
  ;; CHECK-NEXT:        (i32.const 0)
  ;; CHECK-NEXT:        (i32.const 1)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:       (local.get $x)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  ;; RTRIP:      (func $br_on_cast_fail-pair (type $anyref_=>_none) (param $0 anyref)
  ;; RTRIP-NEXT:  (local $1 (i32 i32 structref))
  ;; RTRIP-NEXT:  (local $2 i32)
  ;; RTRIP-NEXT:  (local $3 (i32 i32 anyref))
  ;; RTRIP-NEXT:  (local.set $3
  ;; RTRIP-NEXT:   (block $label$1 (result i32 i32 (ref any))
  ;; RTRIP-NEXT:    (local.set $1
  ;; RTRIP-NEXT:     (block $label$2 (result i32 i32 structref)
  ;; RTRIP-NEXT:      (local.set $1
  ;; RTRIP-NEXT:       (br_on_cast_fail $label$1 anyref structref
  ;; RTRIP-NEXT:        (tuple.make
  ;; RTRIP-NEXT:         (i32.const 0)
  ;; RTRIP-NEXT:         (i32.const 1)
  ;; RTRIP-NEXT:        )
  ;; RTRIP-NEXT:        (local.get $0)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:      (tuple.make
  ;; RTRIP-NEXT:       (tuple.extract 0
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (tuple.extract 1
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:       (tuple.extract 2
  ;; RTRIP-NEXT:        (local.get $1)
  ;; RTRIP-NEXT:       )
  ;; RTRIP-NEXT:      )
  ;; RTRIP-NEXT:     )
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:    (unreachable)
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT:  (drop
  ;; RTRIP-NEXT:   (ref.as_non_null
  ;; RTRIP-NEXT:    (tuple.extract 2
  ;; RTRIP-NEXT:     (local.get $3)
  ;; RTRIP-NEXT:    )
  ;; RTRIP-NEXT:   )
  ;; RTRIP-NEXT:  )
  ;; RTRIP-NEXT: )
  (func $br_on_cast_fail-pair (param $x anyref)
    (drop
      (block $l (result i32 i32 (ref any))
        (drop
          (block $l2 (result i32 i32 structref)
            (br_on_cast_fail $l anyref structref
              (tuple.make
                (i32.const 0)
                (i32.const 1)
              )
              (local.get $x)
            )
          )
        )
        (unreachable)
      )
    )
  )
)
