rozbij(0,[]):-!.
rozbij(X,LWY):-X1 is X mod 10,X2 is X//10,rozbij(X2,A),append(A,[X1],LWY).

rozbijaj([],[]):-!.
rozbijaj([H|T],[X|X2]):-rozbij(H,X),rozbijaj(T,X2).

mono([X],[X]):-!.
mono([H1,H2|T],[H1|X]):-H2>H1,mono([H2|T],X),!.
mono([H1,_|T],LWY):-mono([H1|T],LWY),!.

monotonicznie([],[]):-!.
monotonicznie([H|T],[X|X2]):-mono(H,X),monotonicznie(T,X2).

polacz([],0):-!.
polacz([H|T],S):-polacz(T,S1),S is S1 *10+H.

odwroc([],[]):-!.
odwroc([H|T],X):- odwroc(T,X2),append(X2,[H],X).

laczenie([],[]):-!.
laczenie([H|T],LWY):-odwroc(H,O),polacz(O,X),laczenie(T,X2),append([X],X2,LWY).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).


zadanie(LWE,LWY):-rozbijaj(LWE,ROZ),monotonicznie(ROZ,MON),laczenie(MON,LACZ),insertsort(LWE,LACZ,LWY,_).

