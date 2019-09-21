dzielniki(X,N,[]):-N>=X,!.
dzielniki(X,N,[N|T]):- X mod N =:= 0,!,N1 is N+1,dzielniki(X,N1,T).
dzielniki(X,N,LWY):-N1 is N+1,dzielniki(X,N1,LWY),!.

zsumujNP([],0):-!.
zsumujNP([H|T],ODP):-H mod 2 =:=1, zsumujNP(T,X2),ODP is H + X2.
zsumujNP([_|T],ODP):-zsumujNP(T,ODP),!.


zsumujP([],0):-!.
zsumujP([H|T],ODP):-H mod 2 =:=0, zsumujP(T,X2),ODP is H + X2.
zsumujP([_|T],ODP):-zsumujP(T,ODP),!.

sumy([],[]):-!.
sumy([H|T],[X1|X2]):-H mod 2 =:= 0,dzielniki(H,1,H1),zsumujP(H1,X1),sumy(T,X2),!.
sumy([H|T],[X1|X2]):-H mod 2 =:= 1,dzielniki(H,1,H1), zsumujNP(H1,X1),sumy(T,X2),!.

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

zadanko(LWE,LWY):-sumy(LWE,X),insertsort(LWE,X,LWY,_).
