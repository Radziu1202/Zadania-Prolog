czy_zawiera(A,[X,Y]):-A>=X,A=<Y.

elementy(_,[],[]):-!.
elementy(P,[H|T],[H|X2]):-czy_zawiera(H,P),elementy(P,T,X2).
elementy(P,[_|T],ODP):-elementy(P,T,ODP),!.

srodkowe([A,B],X):-X is (A+B)/2.
srodkowe([A],A).
srodkowe([_|T],LWY):-append(X,[_],T),srodkowe(X,LWY).


odleglosc(X,Y,D):-D is abs(X-Y).

najwieksza_odl([],_,0).
najwieksza_odl([H|T],P,X):-odleglosc(H,P,X),najwieksza_odl(T,P,X2),X>=X2.
najwieksza_odl([H|T],P,X2):-odleglosc(H,P,X),najwieksza_odl(T,P,X2),X<X2.

test(LP,LWE,LWY):-elementy(LP,LWE,X1),srodkowe(X1,Point),najwieksza_odl(X1,Point,LWY).

zadanko([],_,[]):-!.
zadanko([H|T],LWE,[X1|X2]):-test(H,LWE,X1),zadanko(T,LWE,X2).

min([],R,R):-!.
min([H|T],WK,R):-H<WK,min(T,H,R),!.
min([_|T],WK,R):-min(T,WK,R),!.
min([H|T],R):-min(T,H,R).

cale(LP,LWE,ODP):-zadanko(LP,LWE,X1),min(X1,ODP).

