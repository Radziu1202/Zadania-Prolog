lengt([],0):-!.
lengt([_|T],L):-lengt(T,X2),L is X2 +1.

dlugosci([],[]):-!.
dlugosci([H|T],[X1|X2]):-lengt(H,X1),dlugosci(T,X2).

uniq([],[]):-!.
uniq([H|T],T1):-member(H,T),!,uniq(T,T1).
uniq([H|T],[H|T1]):-uniq(T,T1),!.


unikalne([],[]):-!.
unikalne([H|T],[X1|X2]):-uniq(H,X1),unikalne(T,X2).

wyznacz([],[],[]):-!.
wyznacz([H1|T1],[H2|T2],[X1|X2]):-X1 is H1/H2,wyznacz(T1,T2,X2).

lista_stopni(LWE,LWY):-dlugosci(LWE,D1),unikalne(LWE,UNI),dlugosci(UNI,D2),wyznacz(D2,D1,LWY).
