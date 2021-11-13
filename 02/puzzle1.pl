formatPresent(Present, L/W/H) :- split_string(Present, "x", "", [Sl, Sw, Sh]), atom_number(Sl, L), atom_number(Sw, W), atom_number(Sh, H).
formatPresents([], []).
formatPresents([Present | OtherPresents], [FormattedPresent | OtherFormattedPresents]) :- formatPresent(Present, FormattedPresent), formatPresents(OtherPresents, OtherFormattedPresents).
input(Input) :- read_file_to_string("input.txt", InputString, []), split_string(InputString, "\n", "", InputPresents), formatPresents(InputPresents, Input).

paper(X, L/W/H) :- LW is L * W, WH is W * H, HL is H * L, X is 2 * LW + 2 * WH + 2 * HL + min(LW, min(WH, HL)).

requiredPaper(0, []).
requiredPaper(X, [Present | OtherPresents]) :- requiredPaper(OX, OtherPresents), paper(PX, Present), X is OX + PX.

run(X) :- input(Input), requiredPaper(X, Input).
