;; NOTE: Assertions have been generated by update_lit_checks.py --all-items and should not be edited.
;; RUN: wasm-ctor-eval %s --ctors=multivalue-local --quiet -all -S -o - | filecheck %s

(module
 ;; CHECK:      (type $0 (func))

 ;; CHECK:      (type $1 (func (result i32)))

 ;; CHECK:      (import "a" "b" (func $import (type $0)))
 (import "a" "b" (func $import))

 (func $multivalue-local (export "multivalue-local") (result i32)
  (local $0 i32)
  (local $1 (i32 i32))

  ;; We can eval this line. But we will stop evalling at the line after it, the
  ;; import call. As a result we'll only have a partial evalling of this
  ;; function, as a result of which it will begin with sets of the values in the
  ;; locals, followed by the import call and the rest.
  (local.set $0
   (i32.add        ;; This add will be evalled into 42.
    (i32.const 41)
    (i32.const 1)
   )
  )
  (local.set $1
   (tuple.make 2
    (local.get $0)   ;; This will turn into 42.
    (i32.const 1000)
   )
  )

  (call $import)

  ;; Use the locals so they are not trivally removed.
  (i32.add
   (local.get $0)
   (tuple.extract 2 0
    (local.get $1)
   )
  )
 )
)
;; CHECK:      (export "multivalue-local" (func $multivalue-local_2))

;; CHECK:      (func $multivalue-local_2 (type $1) (result i32)
;; CHECK-NEXT:  (local $0 i32)
;; CHECK-NEXT:  (local.set $0
;; CHECK-NEXT:   (i32.const 42)
;; CHECK-NEXT:  )
;; CHECK-NEXT:  (call $import)
;; CHECK-NEXT:  (i32.add
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:   (local.get $0)
;; CHECK-NEXT:  )
;; CHECK-NEXT: )
