(module
  (memory 1 1)
)
(module
  (memory 1 1)
  (import "env" "DYNAMICTOP_PTR" (global $foo i32))
)
(module
  (memory 1 1)
  (import "env" "emscripten_get_sbrk_ptr" (func $foo (result i32)))
)
