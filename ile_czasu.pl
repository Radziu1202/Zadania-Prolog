nalezy(A,[X,Y]):-A=<Y,A>=X.

nalezace([],_,[]):-!.
nalezace([H|T],P,[H|X2]):-nalezy(H,P),nalezace(T,P,X2).
nalezace([_|T],P,T2):-nalezace(T,P,T2),!.

zbiory(_,[],[]):-!.
zbiory(LWE,[H|T],[X1|X2]):-nalezace(LWE,H,X1),!,zbiory(LWE,T,X2).
zbiory(LWE,[_|T],X2):-zbiory(LWE,T,X2),!.


gdziekolwiek(X,[H|_]):-nalezy(X,H),!.
gdziekolwiek(X,[_|T]):-gdziekolwiek(X,T),!.


duzy_zbior([],_,[]):-!.
duzy_zbior([H|T],LP,[H|X2]):-gdziekolwiek(H,LP),!,duzy_zbior(T,LP,X2).
duzy_zbior([_|T],LP,X2):-duzy_zbior(T,LP,X2),!.


rozmiar([],0):-!.
rozmiar([_|T],L):-rozmiar(T,L1),L is L1 +1.


lista_rozmiarow([],[]):-!.
lista_rozmiarow([H|T],[X1|X2]):-rozmiar(H,X1),lista_rozmiarow(T,X2).


roznica([],_,[]):-!.
roznica([H|T],P,[X1|X2]):-X1 is P - H,roznica(T,P,X2).


lista_stosunkow(LP,LWE,LWY):-zbiory(LWE,LP,ZB),lista_rozmiarow(ZB,ROZ),duzy_zbior(LWE,LP,DZ),rozmiar(DZ,P),roznica(ROZ,P,LWY).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).


zaz(LP,LWE,LWY):-lista_stosunkow(LP,LWE,L1),insertsort(LP,L1,LWY,_).


