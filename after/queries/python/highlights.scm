; extends
(pair
  ":" @punctuation.separator.keyvalue)

(dictionary_splat_pattern
  "**" @punctuation.special)

(decorator
  "@" @attribute)
