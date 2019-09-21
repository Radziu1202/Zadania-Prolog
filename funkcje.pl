rozlacz(0,[]):-!.
rozlacz(X,LWY):-X1 is X mod 10, X2 is X//10,rozlacz(X2,X3),append(X3,[X1],LWY).


reverse([],[]):-!.
reverse(LWE,LWY):-append(X,[Y],LWE),reverse(X,X2),append(X2,[Y],LWY).

lacz([],0):-!.
lacz([H|T],S):-lacz(T,S1),S is S1*10 +H.

dec_to_bin(0,[]):-!.
dec_to_bin(X,LWY):- X1 is X mod 2, X2 is X//2,dec_to_bin(X2,X3),append(X3,[X1],LWY).

bin_to_dec([],0):-!.
bin_to_dec([H|T],ODP):-length([H|T],X),N is X - 1 ,bin_to_dec(T,X1),ODP is H*(2**N) + X1.

dec_to_hexa(0,[]):-!.
dec_to_hexa(X,ODP):-X mod 16=:=10,X1 is X//16,dec_to_hexa(X1,X2),append(X2,"A",ODP),!.
dec_to_hexa(X,ODP):-X mod 16=:=11,X1 is X//16,dec_to_hexa(X1,X2),append(X2,"B",ODP),!.
dec_to_hexa(X,ODP):-X mod 16=:=12,X1 is X//16,dec_to_hexa(X1,X2),append(X2,"C",ODP),!.
dec_to_hexa(X,ODP):-X mod 16=:=13,X1 is X//16,dec_to_hexa(X1,X2),append(X2,"D",ODP),!.
dec_to_hexa(X,ODP):-X mod 16=:=14,X1 is X//16,dec_to_hexa(X1,X2),append(X2,"E",ODP),!.
dec_to_hexa(X,ODP):-X mod 16=:=15,X1 is X//16,dec_to_hexa(X1,X2),append(X2,"F",ODP),!.

dec_to_hexa(X,ODP):-A is X mod 16,X1 is X//16,dec_to_hexa(X1,X2),append(X2,[A],ODP).

min([],R,R):-!.
min([H|T],WK,R):-H<WK,min(T,H,R).
min([_|T],WK,R):-min(T,WK,R).
min([H|T],R):-min(T,H,R).

max([],R,R):-!.
max([H|T],WK,R):-H>WK,max(T,H,R).
max([_|T],WK,R):-max(T,WK,R).
max([H|T],R):-max(T,H,R).

odleglosc(X,Y,D):-D is abs(X-Y).

max_dist([],_,0):-!.
max_dist([H|T],P,D1):-odleglosc(H,P,D1),max_dist(T,P,D2),D1>D2.
max_dist([H|T],P,D2):-odleglosc(H,P,D1),max_dist(T,P,D2),D1<D2.


odleglosc2d([X1,Y1],[X2,Y2],D1):- X is abs(X1-X2),Y is abs(Y1-Y2), D1 is sqrt(X**2+Y**2).


max_dist2d([],_,0):-!.
max_dist2d([H|T],P,D1):-odleglosc2d(H,P,D1),max_dist2d(T,P,D2),D1>D2.
max_dist2d([H|T],P,D2):-odleglosc2d(H,P,D1),max_dist2d(T,P,D2),D1<D2.

suma([],0):-!.
suma([H|T],S):-suma(T,X1),S is X1 +H.

len([],0):-!.
len([_|T],X):-len(T,X1),X is X1 +1.

srednia(LWE,ODP):-suma(LWE,S),len(LWE,N),ODP is S/N.

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

mniejniemniej(_,[],[],[]):-!.
mniejniemniej(X,[H|T],[H|T1],N):-H<X,mniejniemniej(X,T,T1,N),!.
mniejniemniej(X,[H|T],M,[H|T1]):-mniejniemniej(X,T,M,T1),!.

qs([],[]):-!.
qs([H|T],LWY):-mniejniemniej(H,T,M,N),
	qs(M,X1),
	qs(N,X2),
	append(X1,[H|X2],LWY).


najblizszy([M],_,M).
najblizszy([H|T],P,H):-najblizszy(T,P,D2),abs(H-P)<abs(H-D2).
najblizszy([H|T],P,D2):-najblizszy(T,P,D2),abs(H-P)>=abs(H-D2).

najdalszy2d([M],_,M).
najdalszy2d([H|T],P,H):-najdalszy2d(T,P,D2),odleglosc2d(H,P,X1),odleglosc2d(D2,P,X2),X1>X2.
najdalszy2d([H|T],P,D2):-najdalszy2d(T,P,D2),odleglosc2d(H,P,X1),odleglosc2d(D2,P,X2),X1=<X2.


zamien([X],[X]).
zamien([H1,H2|T],[H1|T1]):-zamien([H2|T],T1),H1<H2,!.
zamien([H1,H2|T],[H2|T1]):-zamien([H1|T],T1),!.



bubble(LWE,LWE):-zamien(LWE,LWE).
bubble(LWE,X2):-zamien(LWE,X1),bubble(X1,X2),!.


