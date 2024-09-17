module [twoFer]

twoFer : [Name Str, Anonymous] -> Str
twoFer = \name ->
    when name is
        Name n -> "One for $(n), one for me."
        Anonymous -> "One for you, one for me."
