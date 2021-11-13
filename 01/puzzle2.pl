input(Input) :- read_file_to_string("input.txt", Input, []).

floor(U, 0, _) :- U =:= -1.
floor(U, C, ['(' | Other]) :- X is U + 1, /*write("after step "), write(C), write(" we are at floor "), write(X), nl,*/ floor(X, F, Other), C is F + 1.
floor(U, C, [')' | Other]) :- X is U - 1, /*write("after step "), write(C), write(" we are at floor "), write(X), nl,*/ floor(X, F, Other), C is F + 1.

run(X) :- input(Input), atom_chars(Input, InputChars), floor(0, X, InputChars).
