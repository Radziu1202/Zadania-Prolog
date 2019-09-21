distance([XA,YA],[XB,YB],D):-X is abs(XA-XB),Y is abs(YA-YB),D is sqrt((X^2)+(Y^2)).
distances([],_,[]):-!.
distances([H|T],X,LWY):-H\=X,distance(H,X,X1),distances(T,X,X2),append([X1],X2,LWY),!.
distances([H|T],X,LWY):-H=X,distances(T,X,LWY).

najmniejszaodl(LWE,P,X):-distances(LWE,P,X1),min(X1,X).

listanajmn(_,[],[]):-!.
listanajmn(LWE,[H|T],LWY):-najmniejszaodl(LWE,H,X1),listanajmn(LWE,T,X2),append([X1],X2,LWY).

min([],R,R):-!.
min([H|T],WK,R):-H=<WK, min(T,H,R).
min([_|T],WK,R):-min(T,WK,R).
min([H|T],R):-min([H|T],H,R).





insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):- Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).


zad(LWE,LWY):-listanajmn(LWE,LWE,NAJ),insertsort(LWE,NAJ,LWY,_).
