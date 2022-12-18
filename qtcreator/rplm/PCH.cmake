function(add_precompiled_header _target _input)
target_precompile_headers(${_target} PRIVATE ${_input})
endfunction()
