najblizszy([A],_,A):-!.
najblizszy([H|T],P,H):-najblizszy(T,P,X1),abs(H-P)=<abs(X1-P),!.
najblizszy([H|T],P,X1):-najblizszy(T,P,X1),abs(H-P)>abs(X1-P),!.

usun([X],[X]):-!.
usun([X1,X2|T],[X1|T1]):-X1=\=X2,usun([X2|T],T1).
usun([X1,X1|T],T1):-usun([X1|T],T1),!.

zlicz([],1,[]):-!.
zlicz([X1,X2|T],N,T2):-X1=:=X2,!,N1 is N+1,zlicz([X2|T],N1,T2).
zlicz([_|T],N,[N|T2]):-N1 is 1,zlicz(T,N1,T2).



zlicz([],1,[]):-!.
zlicz([X1,X2|T],N,T2):-X1=:=X2,!,N1 is N+1,zlicz(T,N1,T2).
zlicz([_|T],N,[N|T2]):-N1 is 1,zlicz(T,N1,T2).


rozmiar([],0):-!.
rozmiar([_|T],L):-rozmiar(T,L1),L is L1+1.

nalezy(A,[X,Y]):-A>=X,A=<Y,!.

nalezace([],_,[]):-!.
nalezace([H|T],P,[H|X2]):-nalezy(H,P),nalezace(T,P,X2).
nalezace([_|T],P,X2):-nalezace(T,P,X2),!.

wszystkie_przedzialy(_,[],[]):-!.
wszystkie_przedzialy(LWE,[H|T],[X1|X2]):-nalezace(LWE,H,X1),wszystkie_przedzialy(LWE,T,X2).

zawierasie(X,[H|_]):-nalezy(X,H).
zawierasie(X,[_|T]):-zawierasie(X,T),!.

zawierajacesie([],_,[]):-!.
zawierajacesie([H|T],LP,[H|X2]):-zawierasie(H,LP),!,zawierajacesie(T,LP,X2).
zawierajacesie([_|T],LP,X2):-zawierajacesie(T,LP,X2),!.

powtarzanie([A],[A]):-!.
powtarzanie([X1,X2|T],T1):-X1=:=X2,!,powtarzanie([X2|T],T1).
powtarzanie([X1,X2|T],[X1|T1]):-powtarzanie([X2|T],T1),!.

zliczanie([],1,[]):-!.
zliczanie([X1,X2|T],M,T1):-X1=:=X2,!,M1 is M +1,zliczanie([X2|T],M1,T1).
zliczanie([_|T],M,[M|T1]):-M1 is 1, zliczanie(T,M1,T1),!.


roz([],0):-!.
roz([_|T],L):-roz(T,L1),L is L1 +1.

dec_to_bi([],0):-!.
dec_to_bi([H|T],ODP):-roz(T,L),dec_to_bi(T,X2),ODP is H*(2**L) +X2.

rozdziel(0,[]):-!.
rozdziel(X,LWY):-X1 is X mod 10,X2 is X//10,rozdziel(X2,L1),append(L1,[X1],LWY).

tog([],0):-!.
tog([H|T],S):-tog(T,S1),S is S1*10+H.

odwro([],[]):-!.
odwro([H|T],LWY):-odwro(T,X1),append(X1,[H],LWY).

together([],[]):-!.
together([H|T],[X1|X2]):-odwro(H,H1),tog(H1,X1),together(T,X2).
