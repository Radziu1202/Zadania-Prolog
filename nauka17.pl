max([],R,R):-!.
max([H|T],WK,R):-H>WK,max(T,H,R).
max([_|T],WK,R):-max(T,WK,R),!.
max([H|T],R):-max(T,H,R).


obetnij(LWE,MAX,[X1,MAX,X2]):-append(_,[X1,MAX,X2|_],LWE),!.
obetnij(LWE,MAX,[0,MAX,X2]):-append(_,[MAX,X2|_],LWE),!.
obetnij(LWE,MAX,[X1,MAX,0]):-append(_,[X1,MAX],LWE),!.





obcinanie([],[]):-!.
obcinanie([H|T],[X1|X2]):-max(H,MAX),obetnij(H,MAX,X1),obcinanie(T,X2),!.

