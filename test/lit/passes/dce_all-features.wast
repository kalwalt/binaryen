;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; NOTE: This test was ported using port_passes_tests_to_lit.py and could be cleaned up.

;; RUN: foreach %s %t wasm-opt --dce --all-features -S -o - | filecheck %s

(module
  (memory 10)
  ;; CHECK:      (type $0 (func (result i32)))

  ;; CHECK:      (type $1 (func))

  ;; CHECK:      (type $2 (func (param i32) (result i32)))

  ;; CHECK:      (type $ii (func (param i32 i32)))
  (type $ii (func (param i32 i32)))
  (type $1 (func))
  (table 1 1 funcref)
  (elem (i32.const 0) $call-me)
  ;; CHECK:      (type $4 (func (param i64 i64) (result i64)))

  ;; CHECK:      (type $5 (func (param f32 i64)))

  ;; CHECK:      (type $6 (func (param f32 i64) (result i32)))

  ;; CHECK:      (global $x (mut i32) (i32.const 0))
  (global $x (mut i32) (i32.const 0))
  ;; CHECK:      (memory $0 10)

  ;; CHECK:      (table $0 1 1 funcref)

  ;; CHECK:      (elem $0 (i32.const 0) $call-me)

  ;; CHECK:      (func $call-me (type $ii) (param $0 i32) (param $1 i32)
  ;; CHECK-NEXT:  (nop)
  ;; CHECK-NEXT: )
  (func $call-me (type $ii) (param $0 i32) (param $1 i32)
    (nop)
  )
  ;; CHECK:      (func $code-to-kill (type $1)
  ;; CHECK-NEXT:  (local $x i32)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (br $out)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (block $out1
  ;; CHECK-NEXT:     (return)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out2
  ;; CHECK-NEXT:   (br_table $out2 $out2 $out2 $out2
  ;; CHECK-NEXT:    (i32.const 4)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out3
  ;; CHECK-NEXT:   (br_if $out3
  ;; CHECK-NEXT:    (i32.const 3)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (drop
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (block $block4
  ;; CHECK-NEXT:     (if
  ;; CHECK-NEXT:      (i32.const 0)
  ;; CHECK-NEXT:      (then
  ;; CHECK-NEXT:       (unreachable)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:      (else
  ;; CHECK-NEXT:       (unreachable)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out9
  ;; CHECK-NEXT:   (block $in
  ;; CHECK-NEXT:    (br_if $out9
  ;; CHECK-NEXT:     (i32.const 1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (block $block11
  ;; CHECK-NEXT:     (block $out10
  ;; CHECK-NEXT:      (block $in0
  ;; CHECK-NEXT:       (br_if $in0
  ;; CHECK-NEXT:        (i32.const 1)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:      (unreachable)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out11
  ;; CHECK-NEXT:   (block $in1
  ;; CHECK-NEXT:    (br_table $out11 $in1
  ;; CHECK-NEXT:     (i32.const 1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out12
  ;; CHECK-NEXT:   (block $in2
  ;; CHECK-NEXT:    (br_table $in2 $out12
  ;; CHECK-NEXT:     (i32.const 1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (block $block13
  ;; CHECK-NEXT:     (block $out13
  ;; CHECK-NEXT:      (block $in3
  ;; CHECK-NEXT:       (br_table $in3 $in3
  ;; CHECK-NEXT:        (i32.const 1)
  ;; CHECK-NEXT:       )
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:      (unreachable)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (block $block15
  ;; CHECK-NEXT:     (drop
  ;; CHECK-NEXT:      (i32.const 10)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:     (drop
  ;; CHECK-NEXT:      (i32.const 42)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:     (unreachable)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (block $out14
  ;; CHECK-NEXT:   (loop $in4
  ;; CHECK-NEXT:    (br_if $out14
  ;; CHECK-NEXT:     (i32.const 1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (block $block20
  ;; CHECK-NEXT:     (loop $in5
  ;; CHECK-NEXT:      (br_if $in5
  ;; CHECK-NEXT:       (i32.const 1)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:      (unreachable)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 1)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 123)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 2)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 3)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const -1)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 123)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 456)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const -2)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 139)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const -3)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 246)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const -4)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 11)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 22)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 33)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 44)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 55)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 66)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 77)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 88)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 99)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 100)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 123)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 456)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 101)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (i32.const 123)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 102)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.const 1337)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $code-to-kill (type $1)
    (local $x i32)
    (block $out
      (br $out)
      (drop
        (i32.const 0)
      )
      (if
        (i32.const 1)
        (then
          (drop
            (i32.const 2)
          )
        )
      )
      (br_table $out $out $out $out
        (i32.const 3)
      )
      (call $code-to-kill)
    )
    (if
      (i32.const 0)
      (then
        (block $out
          (unreachable)
          (drop
            (i32.const 0)
          )
        )
      )
    )
    (if
      (i32.const 0)
      (then
        (block $out
          (return)
          (drop
            (i32.const 0)
          )
        )
      )
    )
    (block $out
      (br_table $out $out $out $out
        (i32.const 4)
      )
      (drop
        (i32.const 0)
      )
    )
    (block $out
      (br_if $out
        (i32.const 3)
      )
      (drop
        (i32.const 0)
      )
    )
    (if
      (i32.const 0)
      (then
        (block $block4
          (if
            (i32.const 0)
            (then
              (block $out
                (unreachable)
                (drop
                  (i32.const 0)
                )
              )
            )
            (else
              (block $out
                (unreachable)
                (drop
                  (i32.const 0)
                )
              )
            )
          )
          (drop
            (i32.const 0)
          )
        )
      )
    )
    (if
      (i32.const 0)
      (then
        (drop
          (block $out (result i32)
            (br $out
              (unreachable)
            )
            (drop
              (i32.const 0)
            )
            (unreachable)
          )
        )
      )
    )
    (if
      (i32.const 0)
      (then
        (drop
          (block $out (result i32)
            (br_if $out
              (unreachable)
              (i32.const 0)
            )
            (drop
              (i32.const 0)
            )
            (unreachable)
          )
        )
      )
    )
    (if
      (i32.const 0)
      (then
        (drop
          (block $out (result i32)
            (br_if $out
              (unreachable)
              (unreachable)
            )
            (drop
              (i32.const 0)
            )
            (unreachable)
          )
        )
      )
    )
    (block $out
      (block $in
        (br_if $out
          (i32.const 1)
        )
      )
      (unreachable)
    )
    (if
      (i32.const 0)
      (then
        (block $block11
          (block $out
            (block $in
              (br_if $in
                (i32.const 1)
              )
            )
            (unreachable)
          )
          (drop
            (i32.const 10)
          )
        )
      )
    )
    (block $out
      (block $in
        (br_table $out $in
          (i32.const 1)
        )
      )
      (unreachable)
    )
    (block $out
      (block $in
        (br_table $in $out
          (i32.const 1)
        )
      )
      (unreachable)
    )
    (if
      (i32.const 0)
      (then
        (block $block13
          (block $out
            (block $in
              (br_table $in $in
                (i32.const 1)
              )
            )
            (unreachable)
          )
          (drop
            (i32.const 10)
          )
        )
      )
    )
    (if
      (i32.const 0)
      (then
        (block $block15
          (drop
            (i32.const 10)
          )
          (drop
            (i32.const 42)
          )
          (unreachable)
          (return
            (unreachable)
          )
          (unreachable)
          (return)
        )
      )
    )
    (if
      (i32.const 0)
      (then
        (loop $loop-in18
          (unreachable)
        )
      )
    )
    (block $out
    (loop $in
      (br_if $out
        (i32.const 1)
      )
      (unreachable)
    )
    )
    (if
      (i32.const 0)
      (then
        (block $block20
          (loop $in
            (br_if $in
              (i32.const 1)
            )
            (unreachable)
          )
          (drop
            (i32.const 10)
          )
        )
      )
    )
    (if
      (i32.const 1)
      (then
        (call $call-me
          (i32.const 123)
          (unreachable)
        )
      )
    )
    (if
      (i32.const 2)
      (then
        (call $call-me
          (unreachable)
          (i32.const 0)
        )
      )
    )
    (if
      (i32.const 3)
      (then
        (call $call-me
          (unreachable)
          (unreachable)
        )
      )
    )
    (if
      (i32.const -1)
      (then
        (call_indirect (type $ii)
          (i32.const 123)
          (i32.const 456)
          (unreachable)
        )
      )
    )
    (if
      (i32.const -2)
      (then
        (call_indirect (type $ii)
          (i32.const 139)
          (unreachable)
          (i32.const 0)
        )
      )
    )
    (if
      (i32.const -3)
      (then
        (call_indirect (type $ii)
          (i32.const 246)
          (unreachable)
          (unreachable)
        )
      )
    )
    (if
      (i32.const -4)
      (then
        (call_indirect (type $ii)
          (unreachable)
          (unreachable)
          (unreachable)
        )
      )
    )
    (if
      (i32.const 11)
      (then
        (local.set $x
          (unreachable)
        )
      )
    )
    (if
      (i32.const 22)
      (then
        (drop
          (i32.load
            (unreachable)
          )
        )
      )
    )
    (if
      (i32.const 33)
      (then
        (i32.store
          (i32.const 0)
          (unreachable)
        )
      )
    )
    (if
      (i32.const 44)
      (then
        (i32.store
          (unreachable)
          (i32.const 0)
        )
      )
    )
    (if
      (i32.const 55)
      (then
        (i32.store
          (unreachable)
          (unreachable)
        )
      )
    )
    (if
      (i32.const 66)
      (then
        (drop
          (i32.eqz
            (unreachable)
          )
        )
      )
    )
    (if
      (i32.const 77)
      (then
        (drop
          (i32.add
            (unreachable)
            (i32.const 0)
          )
        )
      )
    )
    (if
      (i32.const 88)
      (then
        (drop
          (i32.add
            (i32.const 0)
            (unreachable)
          )
        )
      )
    )
    (if
      (i32.const 99)
      (then
        (i32.add
          (unreachable)
          (unreachable)
        )
      )
    )
    (if
      (i32.const 100)
      (then
        (drop
          (select
            (i32.const 123)
            (i32.const 456)
            (unreachable)
          )
        )
      )
    )
    (if
      (i32.const 101)
      (then
        (drop
          (select
            (i32.const 123)
            (unreachable)
            (i32.const 456)
          )
        )
      )
    )
    (if
      (i32.const 102)
      (then
        (drop
          (select
            (unreachable)
            (i32.const 123)
            (i32.const 456)
          )
        )
      )
    )
    (drop
      (i32.const 1337)
    )
  )
  ;; CHECK:      (func $killer (type $1)
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $killer (type $1)
    (unreachable)
    (drop
      (i32.const 1000)
    )
  )
  ;; CHECK:      (func $target (type $1)
  ;; CHECK-NEXT:  (drop
  ;; CHECK-NEXT:   (i32.const 2000)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $target (type $1)
    (drop
      (i32.const 2000)
    )
  )
  ;; CHECK:      (func $typed-block-none-then-unreachable (type $0) (result i32)
  ;; CHECK-NEXT:  (block $top-typed
  ;; CHECK-NEXT:   (block $switch$0
  ;; CHECK-NEXT:    (return
  ;; CHECK-NEXT:     (i32.const 0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $typed-block-none-then-unreachable (result i32)
    (block $top-typed (result i32)
      (block $switch$0 ;; this looks like it can be broken to, so it gets type 'none'
        (return
          (i32.const 0)
        )
        (br $switch$0) ;; this is not reachable, so dce cleans it up, changing $switch$0's type
      )
      (return ;; and this is cleaned up as well, leaving $top-typed in need of a type change
        (i32.const 1)
      )
    )
  )
  ;; CHECK:      (func $typed-block-remove-br-changes-type (type $2) (param $$$0 i32) (result i32)
  ;; CHECK-NEXT:  (block $switch$7
  ;; CHECK-NEXT:   (block $switch-default$10
  ;; CHECK-NEXT:    (block $switch-case$9
  ;; CHECK-NEXT:     (block $switch-case$8
  ;; CHECK-NEXT:      (br_table $switch-case$9 $switch-case$8 $switch-default$10
  ;; CHECK-NEXT:       (i32.const -1)
  ;; CHECK-NEXT:      )
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (return
  ;; CHECK-NEXT:     (local.get $$$0)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (return
  ;; CHECK-NEXT:    (local.get $$$0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $typed-block-remove-br-changes-type (param $$$0 i32) (result i32)
    (block $switch$7
      (block $switch-default$10
        (block $switch-case$9
          (block $switch-case$8
            (br_table $switch-case$9 $switch-case$8 $switch-default$10
              (i32.const -1)
            )
          )
        )
        (return
          (local.get $$$0)
        )
        (br $switch$7)
      )
      (return
        (local.get $$$0)
      )
    )
    (return
      (i32.const 0)
    )
  )
  ;; CHECK:      (func $global (type $1)
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $global
    (unreachable)
    (drop (global.get $x))
    (global.set $x (i32.const 1))
  )
  ;; CHECK:      (func $ret (type $0) (result i32)
  ;; CHECK-NEXT:  (return
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $ret (result i32)
    (return
      (i32.const 0)
    )
    (nop)
    (i32.const 0)
  )
  ;; CHECK:      (func $unreachable-br (type $0) (result i32)
  ;; CHECK-NEXT:  (block $out (result i32)
  ;; CHECK-NEXT:   (br $out
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unreachable-br (result i32)
    (block $out (result i32)
      (br $out
        (br $out (i32.const 0))
      )
    )
  )
  ;; CHECK:      (func $unreachable-br-loop (type $0) (result i32)
  ;; CHECK-NEXT:  (loop $out
  ;; CHECK-NEXT:   (br $out)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unreachable-br-loop (result i32)
    (loop $out
      (br $out)
    )
  )
 ;; CHECK:      (func $unreachable-block-ends-switch (type $0) (result i32)
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (block $label$3
 ;; CHECK-NEXT:    (nop)
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $unreachable-block-ends-switch (result i32)
  (block $label$0 (result i32)
   (block $label$3
    (nop)
    (br_table $label$3
     (unreachable)
    )
    (unreachable)
   )
   (i32.const 19)
  )
 )
 ;; CHECK:      (func $unreachable-block-ends-br_if (type $0) (result i32)
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (block $label$2
 ;; CHECK-NEXT:    (nop)
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $unreachable-block-ends-br_if (result i32)
  (block $label$0 (result i32)
   (block $label$2
    (nop)
    (br_if $label$2
     (unreachable)
    )
    (unreachable)
   )
   (i32.const 19)
  )
 )
 ;; CHECK:      (func $unreachable-brs-3 (type $0) (result i32)
 ;; CHECK-NEXT:  (block $label$0 (result i32)
 ;; CHECK-NEXT:   (br $label$0
 ;; CHECK-NEXT:    (i32.const 18)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $unreachable-brs-3 (result i32)
  (block $label$0 (result i32)
   (br $label$0
    (memory.grow
     (br $label$0
      (i32.const 18)
     )
    )
   )
   (i32.const 21)
  )
 )
 ;; CHECK:      (func $unreachable-brs-4 (type $2) (param $var$0 i32) (result i32)
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (i32.const 1)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (block $label$1
 ;; CHECK-NEXT:    (block
 ;; CHECK-NEXT:     (drop
 ;; CHECK-NEXT:      (i32.const 4104)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:     (unreachable)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $unreachable-brs-4 (param $var$0 i32) (result i32)
  (i32.add
   (i32.const 1)
   (block $label$0 (result i32)
    (br $label$0
     (block $label$1 (result i32) ;; this block is declared i32, but we can see it is unreachable
      (drop
       (br_if $label$0
        (i32.const 4104)
        (unreachable)
       )
      )
      (i32.const 4)
     )
    )
    (i32.const 16)
   )
  )
 )
 ;; CHECK:      (func $call-unreach (type $4) (param $var$0 i64) (param $var$1 i64) (result i64)
 ;; CHECK-NEXT:  (local $2 i64)
 ;; CHECK-NEXT:  (if (result i64)
 ;; CHECK-NEXT:   (i64.eqz
 ;; CHECK-NEXT:    (local.get $var$0)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (then
 ;; CHECK-NEXT:    (block $label$0 (result i64)
 ;; CHECK-NEXT:     (local.get $var$1)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (else
 ;; CHECK-NEXT:    (block $label$1
 ;; CHECK-NEXT:     (block
 ;; CHECK-NEXT:      (drop
 ;; CHECK-NEXT:       (i64.sub
 ;; CHECK-NEXT:        (local.get $var$0)
 ;; CHECK-NEXT:        (i64.const 1)
 ;; CHECK-NEXT:       )
 ;; CHECK-NEXT:      )
 ;; CHECK-NEXT:      (block
 ;; CHECK-NEXT:       (drop
 ;; CHECK-NEXT:        (block (result i64)
 ;; CHECK-NEXT:         (local.set $2
 ;; CHECK-NEXT:          (local.get $var$0)
 ;; CHECK-NEXT:         )
 ;; CHECK-NEXT:         (nop)
 ;; CHECK-NEXT:         (local.get $2)
 ;; CHECK-NEXT:        )
 ;; CHECK-NEXT:       )
 ;; CHECK-NEXT:       (unreachable)
 ;; CHECK-NEXT:      )
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $call-unreach (param $var$0 i64) (param $var$1 i64) (result i64)
  (local $2 i64)
  (if (result i64)
   (i64.eqz
    (local.get $var$0)
   )
   (then
    (block $label$0 (result i64)
     (local.get $var$1)
    )
   )
   (else
    (block $label$1 (result i64)
     (call $call-unreach
      (i64.sub
       (local.get $var$0)
       (i64.const 1)
      )
      (i64.mul
       (block (result i64)
        (local.set $2
         (local.get $var$0)
        )
        (nop)
        (local.get $2)
       )
       (unreachable)
      )
     )
    )
   )
  )
 )
 ;; CHECK:      (func $br-gone-means-block-type-changes-then-refinalize-at-end-is-too-late (type $2) (param $var$0 i32) (result i32)
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (block
 ;; CHECK-NEXT:    (nop)
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $br-gone-means-block-type-changes-then-refinalize-at-end-is-too-late (param $var$0 i32) (result i32)
  (block $label$0 (result i32)
   (br $label$0
    (block (result i32)
     (nop)
     (drop
      (br_if $label$0
       (unreachable)
       (local.get $var$0)
      )
     )
     (i32.const 4)
    )
   )
  )
 )
 ;; CHECK:      (func $br-with-unreachable-value-should-not-give-a-block-a-value (type $2) (param $var$0 i32) (result i32)
 ;; CHECK-NEXT:  (block $label$0 (result i32)
 ;; CHECK-NEXT:   (block
 ;; CHECK-NEXT:    (drop
 ;; CHECK-NEXT:     (br_if $label$0
 ;; CHECK-NEXT:      (i32.const 8)
 ;; CHECK-NEXT:      (local.get $var$0)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $br-with-unreachable-value-should-not-give-a-block-a-value (param $var$0 i32) (result i32)
  (block $label$0 (result i32)
   (br $label$0
    (block (result i32) ;; turns into unreachable when refinalized
     (drop
      (br_if $label$0
       (i32.const 8)
       (local.get $var$0)
      )
     )
     (unreachable)
    )
   )
   (i32.const 16)
  )
 )
 ;; CHECK:      (func $replace-br-value-of-i32-with-unreachable (type $0) (result i32)
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (block $label$1
 ;; CHECK-NEXT:    (nop)
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $replace-br-value-of-i32-with-unreachable (result i32)
  (block $label$0 (result i32)
   (br $label$0
    (block $label$1 (result i32)
     (nop)
     (unreachable)
    )
   )
  )
 )
 ;; CHECK:      (func $shorten-block-requires-sync-refinalize (type $ii) (param $var$0 i32) (param $var$1 i32)
 ;; CHECK-NEXT:  (unreachable)
 ;; CHECK-NEXT: )
 (func $shorten-block-requires-sync-refinalize (param $var$0 i32) (param $var$1 i32)
  (block $label$0
   (unreachable)
   (if
    (unreachable)
    (then
     (br_if $label$0
      (local.get $var$1)
     )
    )
   )
  )
 )
 ;; CHECK:      (func $block-with-type-but-is-unreachable (type $2) (param $var$0 i32) (result i32)
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (block $block
 ;; CHECK-NEXT:    (nop)
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $block-with-type-but-is-unreachable (param $var$0 i32) (result i32)
  (block $label$0 (result i32)
   (br $label$0
    (block $block (result i32)
     (nop)
     (unreachable)
    )
   )
  )
 )
 ;; CHECK:      (func $if-with-type-but-is-unreachable (type $2) (param $var$0 i32) (result i32)
 ;; CHECK-NEXT:  (block $label$0
 ;; CHECK-NEXT:   (if
 ;; CHECK-NEXT:    (local.get $var$0)
 ;; CHECK-NEXT:    (then
 ;; CHECK-NEXT:     (unreachable)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (else
 ;; CHECK-NEXT:     (unreachable)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $if-with-type-but-is-unreachable (param $var$0 i32) (result i32)
  (block $label$0 (result i32)
   (br $label$0
    (if (result i32)
     (local.get $var$0)
     (then
      (unreachable)
     )
     (else
      (unreachable)
     )
    )
   )
  )
 )
 ;; CHECK:      (func $unreachable-loop (type $1)
 ;; CHECK-NEXT:  (unreachable)
 ;; CHECK-NEXT: )
 (func $unreachable-loop
  (loop $label$2
   (unreachable)
   (br $label$2)
  )
 )
 ;; CHECK:      (func $br-block-from-unary (type $0) (result i32)
 ;; CHECK-NEXT:  (block $label$6 (result i32)
 ;; CHECK-NEXT:   (block $label$7
 ;; CHECK-NEXT:    (br $label$6
 ;; CHECK-NEXT:     (i32.const 8)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $br-block-from-unary (result i32)
  (block $label$6 (result i32)
   (i32.ctz
    (block $label$7 (result i32)
     (br $label$6
      (i32.const 8)
     )
    )
   )
  )
 )
 ;; CHECK:      (func $replace-unary-with-br-child (type $1)
 ;; CHECK-NEXT:  (drop
 ;; CHECK-NEXT:   (block $label$6 (result i32)
 ;; CHECK-NEXT:    (br $label$6
 ;; CHECK-NEXT:     (i32.const 8)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $replace-unary-with-br-child
  (drop
   (block $label$6 (result i32)
    (i32.ctz
     (br $label$6
      (i32.const 8)
     )
    )
   )
  )
 )
 ;; CHECK:      (func $br_if-unreach-then-br_if-normal (type $1)
 ;; CHECK-NEXT:  (block $out
 ;; CHECK-NEXT:   (nop)
 ;; CHECK-NEXT:   (unreachable)
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $br_if-unreach-then-br_if-normal
  (block $out
    (nop)
    (br_if $out
      (unreachable)
    )
    (br_if $out
      (i32.const 1)
    )
  )
 )
 ;; CHECK:      (func $replace-with-unreachable-affects-parent (type $5) (param $var$0 f32) (param $var$1 i64)
 ;; CHECK-NEXT:  (block $top
 ;; CHECK-NEXT:   (block
 ;; CHECK-NEXT:    (drop
 ;; CHECK-NEXT:     (i64.const 0)
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (if
 ;; CHECK-NEXT:     (block (result i32)
 ;; CHECK-NEXT:      (call $replace-with-unreachable-affects-parent
 ;; CHECK-NEXT:       (f32.const 1)
 ;; CHECK-NEXT:       (i64.const -15917430362925035)
 ;; CHECK-NEXT:      )
 ;; CHECK-NEXT:      (i32.const 1)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:     (then
 ;; CHECK-NEXT:      (unreachable)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:     (else
 ;; CHECK-NEXT:      (unreachable)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $replace-with-unreachable-affects-parent (param $var$0 f32) (param $var$1 i64)
  (block $top
   (drop
    (f32.load offset=4
     (i64.ne
      (i64.const 0)
      (if (result i64)
       (block (result i32)
        (call $replace-with-unreachable-affects-parent
         (f32.const 1)
         (i64.const -15917430362925035)
        )
        (i32.const 1)
       )
       (then
        (unreachable)
       )
       (else
        (unreachable)
       )
      )
     )
    )
   )
   (nop) ;; this is not reachable due to the above code, so we replace it with unreachable. type should go to parent
  )
 )
 ;; CHECK:      (func $replace-block-changes-later-when-if-goes (type $1)
 ;; CHECK-NEXT:  (block $top
 ;; CHECK-NEXT:   (global.set $x
 ;; CHECK-NEXT:    (i32.const 0)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (block $inner
 ;; CHECK-NEXT:    (drop
 ;; CHECK-NEXT:     (call $helper
 ;; CHECK-NEXT:      (f32.const 1)
 ;; CHECK-NEXT:      (i64.const -15917430362925035)
 ;; CHECK-NEXT:     )
 ;; CHECK-NEXT:    )
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $replace-block-changes-later-when-if-goes
  (block $top ;; and so should this
   (global.set $x
    (i32.const 0)
   )
   (drop
    (f32.load offset=4
     (i64.ne
      (block $inner (result i64) ;; this becomes unreachable
       (drop
        (call $helper
         (f32.const 1)
         (i64.const -15917430362925035)
        )
       )
       (unreachable)
      )
      (i64.const 0)
     )
    )
   )
   (if
    (i32.load16_s offset=22 align=1
     (i32.const 0)
    )
    (then
     (br $top) ;; this keeps the block none after the inner block gets unreachable. but it will vanish into unreachable itself
    )
    (else
     (unreachable)
    )
   )
  )
 )
 ;; CHECK:      (func $helper (type $6) (param $var$0 f32) (param $var$1 i64) (result i32)
 ;; CHECK-NEXT:  (i32.const 0)
 ;; CHECK-NEXT: )
 (func $helper (param $var$0 f32) (param $var$1 i64) (result i32)
  (i32.const 0)
 )
)
;; if goes to unreachable, need to propagate that up to the global.set
(module
 ;; CHECK:      (type $0 (func))

 ;; CHECK:      (global $global (mut f64) (f64.const 0))
 (global $global (mut f64) (f64.const 0))
 ;; CHECK:      (func $0 (type $0)
 ;; CHECK-NEXT:  (if
 ;; CHECK-NEXT:   (i32.const 0)
 ;; CHECK-NEXT:   (then
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (else
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $0
  (global.set $global
   (if (result f64)
    (i32.const 0)
    (then
     (unreachable)
    )
    (else
     (unreachable)
    )
   )
  )
 )
)
(module
 ;; CHECK:      (type $0 (func))

 ;; CHECK:      (func $0 (type $0)
 ;; CHECK-NEXT:  (local $local f64)
 ;; CHECK-NEXT:  (if
 ;; CHECK-NEXT:   (i32.const 0)
 ;; CHECK-NEXT:   (then
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:   (else
 ;; CHECK-NEXT:    (unreachable)
 ;; CHECK-NEXT:   )
 ;; CHECK-NEXT:  )
 ;; CHECK-NEXT: )
 (func $0
  (local $local f64)
  (local.set $local
   (if (result f64)
    (i32.const 0)
    (then
     (unreachable)
    )
    (else
     (unreachable)
    )
   )
  )
 )
)

(module
  ;; CHECK:      (type $0 (func (result i32)))

  ;; CHECK:      (type $1 (func))

  ;; CHECK:      (func $unnecessary-concrete-block (type $0) (result i32)
  ;; CHECK-NEXT:  (block $foo
  ;; CHECK-NEXT:   (nop)
  ;; CHECK-NEXT:   (unreachable)
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unnecessary-concrete-block (result i32)
    (block $foo (result i32) ;; unnecessary type
      (nop)
      (unreachable)
    )
  )
  ;; CHECK:      (func $necessary-concrete-block (type $0) (result i32)
  ;; CHECK-NEXT:  (block $foo (result i32)
  ;; CHECK-NEXT:   (br $foo
  ;; CHECK-NEXT:    (i32.const 1)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $necessary-concrete-block (result i32)
    (block $foo (result i32)
      (br $foo (i32.const 1))
      (unreachable)
    )
  )
  ;; CHECK:      (func $unnecessary-concrete-if (type $0) (result i32)
  ;; CHECK-NEXT:  (if
  ;; CHECK-NEXT:   (i32.const 0)
  ;; CHECK-NEXT:   (then
  ;; CHECK-NEXT:    (return
  ;; CHECK-NEXT:     (i32.const 1)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (else
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unnecessary-concrete-if (result i32)
    (if (result i32) ;; unnecessary type
      (i32.const 0)
      (then
        (return (i32.const 1))
      )
      (else
        (unreachable)
      )
    )
  )
  ;; CHECK:      (func $unnecessary-concrete-try (type $0) (result i32)
  ;; CHECK-NEXT:  (try
  ;; CHECK-NEXT:   (do
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (catch_all
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $unnecessary-concrete-try (result i32)
    (try (result i32)
      (do
        (unreachable)
      )
      (catch_all
        (unreachable)
      )
    )
  )
  ;; CHECK:      (func $note-loss-of-if-children (type $1)
  ;; CHECK-NEXT:  (block $label$1
  ;; CHECK-NEXT:   (block $label$2
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $note-loss-of-if-children
    (block $label$1
     (if ;; begins unreachable - type never changes - but after the condition
         ;; becomes unreachable, it will lose the children, which means no more
         ;; br to the outer block, changing that type.
       (block $label$2 (result i32)
         (nop)
         (unreachable)
       )
       (then
         (unreachable)
       )
       (else
         (br $label$1)
       )
      )
    )
  )
  ;; CHECK:      (func $note-loss-of-non-control-flow-children (type $1)
  ;; CHECK-NEXT:  (block $out
  ;; CHECK-NEXT:   (block
  ;; CHECK-NEXT:    (nop)
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $note-loss-of-non-control-flow-children
    (block $out
      (drop
       (i32.add
         (block (result i32)
            (nop)
            (unreachable)
         )
         (br $out) ;; when this is removed as dead, the block becomes unreachable
       )
     )
    )
  )
)
(module
  ;; CHECK:      (type $0 (func (result (ref any))))

  ;; CHECK:      (func $br_on_non_null (type $0) (result (ref any))
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $br_on_non_null (result (ref any))
    (block $label$1 (result (ref any))
      ;; this break has an unreachable input, and so it does not have a heap type
      ;; there, and no heap type to send on the branch. this tests we do not hit
      ;; the assertion in getHeapType() if we call that.
      (br_on_non_null $label$1
        (block (result anyref)
          (unreachable)
        )
      )
      (unreachable)
    )
  )

  ;; CHECK:      (func $br_on_cast_fail (type $0) (result (ref any))
  ;; CHECK-NEXT:  (unreachable)
  ;; CHECK-NEXT: )
  (func $br_on_cast_fail (result (ref any))
    (block $label$1 (result (ref none))
      ;; Similar to the above, but using br_on_cast_fail.
      (br_on_cast_fail $label$1 anyref structref
        (unreachable)
      )
      (unreachable)
    )
  )
)

(module
  ;; CHECK:      (type $0 (func (result anyref)))

  ;; CHECK:      (func $if (type $0) (result anyref)
  ;; CHECK-NEXT:  (ref.cast i31ref
  ;; CHECK-NEXT:   (if (result i31ref)
  ;; CHECK-NEXT:    (i32.const 0)
  ;; CHECK-NEXT:    (then
  ;; CHECK-NEXT:     (unreachable)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (else
  ;; CHECK-NEXT:     (ref.i31
  ;; CHECK-NEXT:      (i32.const 42)
  ;; CHECK-NEXT:     )
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $if (result anyref)
    ;; We should not refinalize while doing DCE. The cast should remain a
    ;; nullable one, and the if should keep returning a nullable value. (If we
    ;; refinalized only the if then the cast would be invalid, since we cannot
    ;; have a nullable cast of a non-nullable input.)
    ;;
    ;; In other words, we can propagate unreachability in DCE, but should cause
    ;; no other type changes.
    (ref.cast i31ref
      (if (result i31ref)
        (i32.const 0)
        (then
          (block (result i31ref)
            (unreachable)
          )
        )
        (else
          (ref.i31
            (i32.const 42)
          )
        )
      )
    )
  )

  ;; CHECK:      (func $try (type $0) (result anyref)
  ;; CHECK-NEXT:  (try (result i31ref)
  ;; CHECK-NEXT:   (do
  ;; CHECK-NEXT:    (drop
  ;; CHECK-NEXT:     (call $try)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:    (unreachable)
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:   (catch_all
  ;; CHECK-NEXT:    (ref.i31
  ;; CHECK-NEXT:     (i32.const 42)
  ;; CHECK-NEXT:    )
  ;; CHECK-NEXT:   )
  ;; CHECK-NEXT:  )
  ;; CHECK-NEXT: )
  (func $try (result anyref)
    ;; As above, but for try.
    (try (result i31ref)
      (do
        (block (result i31ref)
          (drop
            (call $try)
          )
          (unreachable)
        )
      )
      (catch_all
        (ref.i31
          (i32.const 42)
        )
      )
    )
  )
)
