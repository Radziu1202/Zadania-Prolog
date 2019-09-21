odwroc([],[]):-!.
odwroc([H|T],LWY):-odwroc(T,X2),append(X2,[H],LWY).

lacz([],0):-!.
lacz([H|T],S):-lacz(T,S1), S is 10*S1 +H.

polacz(LWE,X):-odwroc(LWE,O),lacz(O,X).

laczenie([],[]):-!.
laczenie([H|T],[H1|T1]):-polacz(H,H1),laczenie(T,T1).

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,X2),insert(H1,H2,X1,X2,X,Y).

