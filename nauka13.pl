nalezy([],_,[]):-!.
nalezy([H|T],[X,Y],[H|T1]):-H>=X,H=<Y,nalezy(T,[X,Y],T1).
nalezy([_|T],[X,Y],LWY):-nalezy(T,[X,Y],LWY),!.

naleza(_,[],[]):-!.
naleza(LWE,[H|T],[X1|X2]):-nalezy(LWE,H,X1),naleza(LWE,T,X2),!.

zawierasie(X,[A,B],X):-X=<B,X>=A.

gdziekolwiek(X,[H|_],D):-zawierasie(X,H,D).
gdziekolwiek(X,[_|T],D):-gdziekolwiek(X,T,D),!.

wszystkie([],_,[]):-!.
wszystkie([H|T],LP,[X1|X2]):-gdziekolwiek(H,LP,X1),wszystkie(T,LP,X2).
wszystkie([_|T],LP,X2):-wszystkie(T,LP,X2),!.

len([],0):-!.
len([_|T],N):-len(T,N1),N is N1+1.

moce([],[]):-!.
moce([H|T],[X1|X2]):-len(H,X1),moce(T,X2).

roznice([],_,[]):-!.
roznice([H|T],X,[X1|X2]):-X1 is X - H,roznice(T,X,X2).

lista_roznic(L,LWE,LWY):-naleza(LWE,L,N),moce(N,M),wszystkie(LWE,L,W),len(W,R),roznice(M,R,LWY).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).


glowny(LP,LWE,LWY):-lista_roznic(LP,LWE,LR),insertsort(LP,LR,LWY,_).


