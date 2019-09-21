distance([X1,Y1],[X2,Y2],WYN):-X is abs(X1-X2), Y is abs(Y1-Y2),WYN is (X*X + Y*Y).

distances41(_,[],[]):-!.
distances41(X,[H|T],[X1|X2]):-X\=H,distance(X,H,X1),distances41(X,T,X2),!.
distances41(X,[_|T],LWY):-distances41(X,T,LWY),!.

min([],R,R):-!.
min([H|T],WK,R):-H=<WK,min(T,H,R),!.
min([_|T],WK,R):-min(T,WK,R),!.
min([H|T],R):-min(T,H,R).

najmniejszy41(X,LWE,WYN):-distances41(X,LWE,LWY),min(LWY,WYN).

najmniejsze([],_,[]):-!.
najmniejsze([H|T],LWE,[X1|X2]):-najmniejszy41(H,LWE,X1),najmniejsze(T,LWE,X2).
najmniejsze(LWE,WYN):-najmniejsze(LWE,LWE,WYN).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

zadanie2(LWE,WYN):-najmniejsze(LWE,NAJ),insertsort(LWE,NAJ,LWY,_),append([WYN],_,LWY).

