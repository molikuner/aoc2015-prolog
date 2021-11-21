input(Input) :- read_file_to_string("input.txt", InputString, []), atom_chars(InputString, Input).

house(<, X/Y, NX/NY) :- NX is X - 1, NY is Y.
house(>, X/Y, NX/NY) :- NX is X + 1, NY is Y.
house(^, X/Y, NX/NY) :- NX is X, NY is Y + 1.
house(v, X/Y, NX/NY) :- NX is X, NY is Y - 1.

houses([0/0, 0/0], []).
houses(X, [SantaI, RoboI | Instructions]) :-
  houses([LastSantaHouse, LastRoboHouse | Houses], Instructions),
  house(SantaI, LastSantaHouse, SantaHouse),
  house(RoboI, LastRoboHouse, RoboHouse),
  X = [SantaHouse, RoboHouse, LastSantaHouse, LastRoboHouse | Houses].
houseCount(X, Instructions) :- houses(Houses, Instructions), sort(Houses, UniqueHouses), length(UniqueHouses, X).

run(X) :- input(Input), reverse(Input, Reversed), houseCount(X, Reversed).
