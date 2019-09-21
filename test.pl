nalezy(A,[X,Y]):-A>=X,A=<Y.

nalezace([],_,[]):-!.
nalezace([H|T],P,[H|X2]):-nalezy(H,P),nalezace(T,P,X2).
nalezace([_|T],P,X2):-nalezace(T,P,X2).


zbior(_,[],[]):-!.
zbior(LWE,[H|T],[X1|X2]):-nalezace(LWE,H,X1),!,zbior(LWE,T,X2).


gdziekolwiek(X,[H|_]):-nalezy(X,H).
gdziekolwiek(X,[_|T]):-gdziekolwiek(X,T).

duzy_zbior([],_,[]):-!.
duzy_zbior([H|T],LP,[H|X2]):-gdziekolwiek(H,LP),!,duzy_zbior(T,LP,X2).
duzy_zbior([_|T],LP,X2):-duzy_zbior(T,LP,X2),!.

rozmiar([],0):-!.
rozmiar([_|T],L):-rozmiar(T,L1),L is L1+1.

lista_roz([],[]):-!.
lista_roz([H|T],[X1|X2]):-rozmiar(H,X1),lista_roz(T,X2).

roznica([],_,[]):-!.
roznica([H1|T1],P,[X1|X2]):-X1 is P-H1, roznica(T1,P,X2).


lista_roznic(LP,LWE,LWY):-zbior(LWE,LP,Z),lista_roz(Z,R),duzy_zbior(LWE,LP,DZ),rozmiar(DZ,P),roznica(R,P,LWY).


odleglosc([XA,YA],[XB,YB],D):-D is sqrt((XA-XB)**2 + (YA-YB)**2).


trojkat([A,B,C]):-odleglosc(A,B,AB),odleglosc(A,C,AC),odleglosc(B,C,BC),AB+BC>AC+0.1,AC+BC>AB+0.1,AC+AB>BC+0.1.


product3(L,W):-findall([X,Y,Z],(member(X,L),member(Y,L),member(Z,L)),W).


sprawdz([],0):-!.
sprawdz([H|T],W):-trojkat(H),sprawdz(T,W1),W is W1+1.
sprawdz([_|T],W):-sprawdz(T,W),!.


odw([],[]):-!.
odw([H|T],LWY):-odw(T,X2),append(X2,[H],LWY).
