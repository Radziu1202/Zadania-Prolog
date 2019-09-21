srodek([X,Y],S):-S is (X+Y)/2.

srodki([],[]):-!.
srodki([H|T],[X1|X2]):-srodek(H,X1),srodki(T,X2).

odleglosc(X,Y,D):-D is abs(X-Y).

odleglosci(_,[],[]):-!.
odleglosci(X,[H|T],[D1|D2]):-X\=H,odleglosc(X,H,D1),odleglosci(X,T,D2).
odleglosci(X,[_|T],LWY):-odleglosci(X,T,LWY),!.

min([],R,R):-!.
min([H|T],WK,R):-H<WK,min(T,H,R).
min([_|T],WK,R):-min(T,WK,R).
min([H|T],R):-min(T,H,R).

najmniejsze([],_,[]):-!.
najmniejsze([H|T],LWE,[D2|D3]):-odleglosci(H,LWE,D1),min(D1,D2),najmniejsze(T,LWE,D3).
najmniejsze(LWE,LWY):-najmniejsze(LWE,LWE,LWY),!.

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).


test(LWE,LWY):-srodki(LWE,SR),najmniejsze(SR,LWY).

z(LWE,LWY):-test(LWE,X1),insertsort(LWE,X1,LWY,_).

