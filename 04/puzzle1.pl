input(Input) :- read_file_to_string("input.txt", Input, []).

isAllowed(Hash) :- atom_chars(Hash, AtomizedHash), prefix(['0','0','0','0','0'], AtomizedHash).

saltMD5(X, Y, Salt) :- string_concat(Salt, X, SaltedX), md5_hash(SaltedX, Hash, []), isAllowed(Hash), Y = X.
saltMD5(X, Y, Salt) :- NX is X + 1, saltMD5(NX, Y, Salt).

run(X) :- input(Input), saltMD5(0, X, Input).
