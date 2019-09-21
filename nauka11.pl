odleglosc([XA,YA],[XB,YB],D):-
	X is XA-XB,
	Y is YA-YB,
	D is sqrt((X**2) + (Y**2)).

trojkat([A,B,C]):-odleglosc(A,B,AB),odleglosc(A,C,AC),odleglosc(B,C,BC),AB+BC>AC+0.1,AB+AC>BC+0.1,BC+AC>AB+0.1.


product3(L,W):-findall([X,Y,Z],(member(X,L),member(Y,L),member(Z,L)),W).

sprawdz([],0):-!.
sprawdz([H|T],W):-trojkat(H),!,sprawdz(T,N),W is N+1.
sprawdz([_|T],W):-sprawdz(T,W).


zadan(L,W):-product3(L,X),sprawdz(X,N), W is N/6.



odleglosc([XA,YA],[XB,YB],D):-D is sqrt((XA-XB)**2 + (YA-YB)**2).

trojkat([X,Y,Z]):-odleglosc(X,Y,XY),odleglosc(X,Z,XZ),odleglosc(Y,Z,YZ),
	XY+XZ>YZ+0.1,XZ+YZ>XY+0.1,XY+YZ>XZ+0.1.

kartez(L,W):-findall([X,Y,Z],(member(X,L),member(Y,L),member(Z,L)),W).

sprawdz([],[]):-!.
sprawdz([H|T],W):-trojkat(H),!,sprawdz(T,N),W is N+1.
sprawdz([_|T],LWY):-sprawdz(T,LWY),!.

zad(LWE,ODP):-kartez(LWE,X1),sprawdz(X1,ODP1),ODP is ODP1/6.
