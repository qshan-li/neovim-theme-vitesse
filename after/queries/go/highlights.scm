; extends
(keyed_element
  ":" @punctuation.separator.keyvalue)

(struct_type
  field_declaration_list: _
  (field_declaration
    ":" @punctuation.separator.keyvalue))
