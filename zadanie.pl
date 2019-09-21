
rozklad_liczby(X,N,WYN):-N*N=<X,WYN is N.
rozklad_liczby(X,N,WYN):-N1 is N-1,rozklad_liczby(X,N1,WYN).

rozkladanie(0,[]):-!.
rozkladanie(X,WYN):-rozklad_liczby(X,X,A),X1 is X -(A*A),rozkladanie(X1,B),append([A],B,WYN).

rozklad_tablicy([],[]):-!.
rozklad_tablicy([H|T],[X1|X2]):-rozkladanie(H,X1),rozklad_tablicy(T,X2).

suma([],0):-!.
suma([H|T],WYN):-X1 is H,suma(T,X2),WYN is X1 + X2.

suma_tablic([],[]):-!.
suma_tablic([H|T],[X1|X2]):-suma(H,X1),suma_tablic(T,X2).


insert(X,Y,[],[],[X],[Y]):-!.
insert(X,Y,[H1|T1],[H2|T2],[X,H1|T1],[Y,H2|T2]):-Y=<H2,!.
insert(X,Y,[H1|T1],[H2|T2],[H1|T3],[H2|T4]):-insert(X,Y,T1,T2,T3,T4).


insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).

zadanie(LWE,WYN):-rozklad_tablicy(LWE,ROZ),suma_tablic(ROZ,SUM),insertsort(LWE,SUM,LWY,_),append([WYN],_,LWY).

