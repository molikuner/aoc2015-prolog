input(Input) :- read_file_to_string("input.txt", Input, []).

floor(0, []).
floor(U, ['(' | Other]) :- floor(X, Other), U is X + 1.
floor(U, [')' | Other]) :- floor(X, Other), U is X - 1.

run(X) :- input(Input), atom_chars(Input, InputChars), floor(X, InputChars).
