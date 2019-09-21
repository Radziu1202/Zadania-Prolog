kwadraty(0,_,[]):-!.
kwadraty(X,X1,[X1|L1]):-X1*X1=<X,X2 is X-(X1*X1),kwadraty(X2,X1,L1).
kwadraty(X,X1,L):-X3 is X1-1,kwadraty(X,X3,L),!.
kwadraty(X,L):-kwadraty(X,X,L).


wszystkie([],[]):-!.
wszystkie([H|T],[L1|L2]):-kwadraty(H,L1),wszystkie(T,L2).

suma([],0):-!.
suma([H|T],S):-suma(T,S2),S is S2 +H.

zsumuj([],[]):-!.
zsumuj([H|T],[L1|L2]):-suma(H,L1),zsumuj(T,L2).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,X2),insert(H1,H2,X1,X2,X,Y).



zadanie(LWE,ODP):-wszystkie(LWE,KW),zsumuj(KW,ZS),insertsort(LWE,ZS,LWY,_),append([ODP],_,LWY).
