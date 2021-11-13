formatPresent(Present, L/W/H) :- split_string(Present, "x", "", [Sl, Sw, Sh]), atom_number(Sl, L), atom_number(Sw, W), atom_number(Sh, H).
formatPresents([], []).
formatPresents([Present | OtherPresents], [FormattedPresent | OtherFormattedPresents]) :- formatPresent(Present, FormattedPresent), formatPresents(OtherPresents, OtherFormattedPresents).
input(Input) :- read_file_to_string("input.txt", InputString, []), split_string(InputString, "\n", "", InputPresents), formatPresents(InputPresents, Input).

ribbon(X, L/W/H) :- sort(0, @=<, [L,W,H], [X1, X2 | _]), X is (L * W * H) + X1 + X1 + X2 + X2.

requiredRibbon(0, []).
requiredRibbon(X, [Present | OtherPresents]) :- requiredRibbon(OX, OtherPresents), ribbon(PX, Present), X is OX + PX.

run(X) :- input(Input), requiredRibbon(X, Input).
