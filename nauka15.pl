czynniki(X,N,[]):-N>X.
czynniki(X,N,[N|X2]):-C is mod(X,N),C=:=0,!,X1 is X//N,czynniki(X1,N,X2).
czynniki(X,N,LWY):- N1 is N+1,czynniki(X,N1,LWY),!.
czynniki(X,LWY):-czynniki(X,2,LWY).

czyn([],[]):-!.
czyn([H|T],[X1|X2]):-czynniki(H,X1),czyn(T,X2).

uniq([],[]):-!.
uniq([H|T],T1):-member(H,T),!,uniq(T,T1).
uniq([H|T],[H|T1]):-uniq(T,T1),!.
