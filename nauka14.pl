dec_to_bin(0,[]):-!.
dec_to_bin(X,LWY):-X1 is mod(X,2),H1 is X//2,dec_to_bin(H1,X2),append(X2,[X1],LWY).

binarnie([],[]):-!.
binarnie([H|T],[X1|X2]):-dec_to_bin(H,X1),binarnie(T,X2).

usun([X],[X]):-!.
usun([X1,X2|T],T1):-X2=:=X1,usun([X1|T],T1),!.
usun([X1,X2|T],[X1|T1]):-X2=\=X1,usun([X2|T],T1),!.

usuwaj([],[]):-!.
usuwaj([H|T],[X1|X2]):-usun(H,X1),usuwaj(T,X2).

leng([],0):-!.
leng([_|T],N):-leng(T,N1),N is N1+1.

bin_to_dec([],0):-!.
bin_to_dec([H|T],ODP):-leng(T,N),bin_to_dec(T,X2),ODP is H*(2**N)+X2.

decymalnie([],[]):-!.
decymalnie([H|T],[X1|X2]):-bin_to_dec(H,X1),decymalnie(T,X2).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertosort([],[],[],[]):-!.
insertosort([H1|T1],[H2|T2],X,Y):-insertosort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

za(LWE,LWY):-binarnie(LWE,B),usuwaj(B,U),decymalnie(U,D),insertsort(LWE,D,LWY,_).


