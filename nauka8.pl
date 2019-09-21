alfabet([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,w,x,y,z]).
odleglosc(X,Y,D):-char_code(X,X1),char_code(Y,Y1),D is abs(X1-Y1).

min([],R,R):-!.
min([H|T],WK,R):-WK>H,min(T,H,R).
min([_|T],WK,R):-min(T,WK,R),!.
min([H|T],R):-min(T,H,R).


odleglosci(_,[],[]):-!.
odleglosci(X,[H|T],[D1|D2]):-X\=H,odleglosc(X,H,D1),odleglosci(X,T,D2).
odleglosci(X,[_|T],LWY):-odleglosci(X,T,LWY),!.

najmniejsze([],_,[]):-!.
najmniejsze([H|T],LWE,[X3|X2]):-odleglosci(H,LWE,X1),min(X1,X3),najmniejsze(T,LWE,X2),!.
najmniejsze(LWE,LWY):-najmniejsze(LWE,LWE,LWY).

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

zadanie(LWE,LWY):-najmniejsze(LWE,N),insertsort(LWE,N,LWY,_).
