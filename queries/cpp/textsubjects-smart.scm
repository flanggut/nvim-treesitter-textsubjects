((comment) @_start @_end
     (#make-range! "range" @_start @_end))

; TODO This query doesn't work for comment groups at the start and end of a
; file
; See https://github.com/tree-sitter/tree-sitter/issues/1138
(((_) @head . (comment) @_start . (comment)+ @_end (_) @tail)
    (#not-has-type? @tail "comment")
    (#not-has-type? @head "comment")
    (#make-range! "range" @_start @_end))

(([
    (namespace_definition)
    (class_specifier)
    (struct_specifier)
    (template_declaration)
    (function_definition)
    (preproc_function_def)
    (enum_specifier)
    (template_instantiation)
    (function_declarator)
    (lambda_expression)
    (for_statement)
    (while_statement)
    (do_statement)
    (if_statement)
    (try_statement)
    (case_statement)
    (switch_statement)
    (catch_clause)
    (return_statement)
] @_start @_end)
(#make-range! "range" @_start @_end))

((parameter_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((argument_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))

((initializer_list (_) @_start @_end . ","? @_end)
    (#make-range! "range" @_start @_end))
