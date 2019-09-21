alfabet([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,w,x,y,z]).

odleglosc(X,H,D):-char_code(X,XN),char_code(H,HN),D is abs(XN-HN).

odleglosci(_,[],[]):-!.
odleglosci(X,[H|T],[X1|X2]):-X\=H,odleglosc(X,H,X1),odleglosci(X,T,X2).
odleglosci(X,[_|T],LWY):-odleglosci(X,T,LWY),!.

min([],R,R):-!.
min([H|T],WK,R):-H<WK,min(T,H,R).
min([_|T],WK,R):-min(T,WK,R).
min([H|T],R):-min(T,H,R).


minimalna(X,LWE,ODP):-odleglosci(X,LWE,X1),min(X1,ODP),!.

lista_min([],_,[]):-!.
lista_min([H|T],LWE,[X1|X2]):-minimalna(H,LWE,X1),lista_min(T,LWE,X2).

insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).


zadanie(LWE,LWY):-lista_min(LWE,LWE,X1),insertsort(LWE,X1,LWY,_).
