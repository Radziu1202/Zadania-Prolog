dectobin(0,[]):-!.
dectobin(X,[A|A2]):-A is X mod 2, B is X//2, dectobin(B,A2),!.

binarnie([],[]):-!.
binarnie([H|T],[X|X2]):-dectobin(H,X),binarnie(T,X2).

podrzad([],1,[]):-!.
podrzad([H1,H2|T],M,LWY):-H1 =:= H2,!, M1 is M + 1, podrzad([H2|T],M1,LWY).
podrzad([_|T],M,[M|LWY]):-M1 is 1, podrzad(T,M1,LWY).

zrzedu([],[]):-!.
zrzedu([H|T],[X1|X2]):-podrzad(H,1,X1),zrzedu(T,X2).

odwracam([],[]):-!.
odwracam([H|T],LWY):-odwracam(T,X2),append(X2,[H],LWY).

lacz([],0):-!.
lacz([H|T],S):-lacz(T,S1), S is S1*10 +H.

polaczam([],[]):-!.
polaczam([H|T],[X2|X3]):-odwracam(H,X1),lacz(X1,X2),polaczam(T,X3).

insert1(X, [], [X]):- !.
insert1(X, [X1|L1], [X, X1|L1]):- X=<X1, !.
insert1(X, [X1|L1], [X1|L]):- insert1(X, L1, L).

insertionSort([], []):- !.
insertionSort([X|L], S):- insertionSort(L, S1), insert1(X, S1, S).

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

zadanko(LWE,LWY):-binarnie(LWE,BIN),zrzedu(BIN,RZAD),polaczam(RZAD,POL),insertionSort(POL,LWY).
