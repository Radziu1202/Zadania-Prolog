odleglosc([X1,Y1],[X2,Y2],D):-X is abs(X1-X2),Y is abs(Y1-Y2),D is sqrt(X**2 + Y**2).

odleglosci(_,[],[]):-!.
odleglosci(X,[H|T],[D1|D2]):-X \=H,odleglosc(X,H,D1),odleglosci(X,T,D2).
odleglosci(X,[_|T],LWY):-odleglosci(X,T,LWY),!.

kazda([],_,[]):-!.
kazda([H|T],LWE,[X1|X2]):-odleglosci(H,LWE,X1),kazda(T,LWE,X2).


min([],H,H):-!.
min([H|T],WK,R):-H<WK,min(T,H,R).
min([_|T],WK,R):-min(T,WK,R).
min([H|T],R):-min(T,H,R).

minimum([],[]):-!.
minimum([H|T],[X1|X2]):-min(H,X1),minimum(T,X2).

minimalne_odl(LWE,LWY):-kazda(LWE,LWE,X),minimum(X,LWY).


najmniejsza(LWE,X):-minimalne_odl(LWE,LWY),min(LWY,X).

znajdz([],_,[]):-!.
znajdz(LWE,NAJ,H):-append([H],_,LWE),odleglosci(H,LWE,ODL),min(ODL,N),N =:=NAJ,!.
znajdz(LWE,NAJ,X2):-append([_],T,LWE),znajdz(T,NAJ,X2),!.


zadanie2(LWE,X):-najmniejsza(LWE,NAJ),znajdz(LWE,NAJ,X),!.
