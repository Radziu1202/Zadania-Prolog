rozbij(0,[]):-!.
rozbij(X,[Y|X2]):-Y is X mod 10, X1 is X//10,rozbij(X1,X2).

rozbijaj([],[]):-!.
rozbijaj([H|T],[X1|X2]):-rozbij(H,X3),odwroc(X3,X1),rozbijaj(T,X2).

odwroc([],[]):-!.
odwroc([H|T],LWY):-odwroc(T,X1),append(X1,[H],LWY),!.

odwracaj([],[]):-!.
odwracaj([H|T],[X1|X2]):-odwroc(H,X1),odwracaj(T,X2).


mono([X],[X]):-!.
mono([X1,X2|T],[X1|T2]):-X2>X1,mono([X2|T],T2),!.
mono([X1,_|T],T2):-mono([X1|T],T2),!.

monotonicznosc([],[]):-!.
monotonicznosc([H|T],[X1|X2]):-mono(H,X1),monotonicznosc(T,X2).


polacz([],0):-!.
polacz([H|T],S):-polacz(T,S1),S is S1*10 +H.

lacz([],[]):-!.
lacz([H|T],[X1|X2]):-polacz(H,X1),lacz(T,X2).


listaw(LWE,LWY):-rozbijaj(LWE,X1),monotonicznosc(X1,X2),odwracaj(X2,X3),lacz(X3,LWY).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,X2),insert(H1,H2,X1,X2,X,Y).


zadanie(LWE,LWY):-listaw(LWE,X1),insertsort(LWE,X1,LWY,_).
