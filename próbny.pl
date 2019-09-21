reverse([],[]):-!.
reverse(LWE,LWY):-append(X,[Y],LWE),reverse(X,X1),append([Y],X1,LWY).

skladowe(0,_,[]):-!.
skladowe(X,[H|T],ODP):-X>=H,X1 is X-H,skladowe(X1,[H|T],X2),append([H],X2,ODP).
skladowe(X,[H|T],ODP):-X<H,skladowe(X,T,ODP).

unikalne([],[]):-!.
unikalne([H|T],ODP):-member(H,T),unikalne(T,ODP),!.
unikalne([H|T],ODP):-unikalne(T,X1),append([H],X1,ODP).

lacz([],0):-!.
lacz([H|T],S):-lacz(T,S1),S is S1 *10 +H.
polacz([],[]):-!.
polacz([H|T],[X1|X2]):-reverse(H,H1),lacz(H1,X1),polacz(T,X2).
suma([],0):-!.
suma([H|T],ODP):-suma(T,X1),ODP is H +X1.

zsumuj([],[]):-!.
zsumuj([H|T],[X1|X2]):-suma(H,X1),zsumuj(T,X2).

skladniki(0,_,[]):-!.
skladniki(X,[H|T],[H|X2]):- X mod H =:=0,X1 is X-H,skladniki(X1,[H|T],X2),!.
skladniki(X,[_|T],ODP):-skladniki(X,T,ODP),!.

odejmij(0,[],[]):-!.
odejmij(X,[H|_],X1):-H<X, X1 is X-H.
odejmij(X,[H|T],X1):-H>X, odejmij(X,T,X1).


rozdzial(X,LWE,ODP):-skladniki(X,LWE,ODP),!.
rozdzial(X,[H|T],ODP):-odejmij(X,[H|T],X1),rozdzial(X1,[H|T],X2),append([H],X2,ODP).
rozdzielanie([],_,[]):-!.
rozdzielanie([H|T],LWE,[X1|X2]):-rozdzial(H,LWE,X1),rozdzielanie(T,LWE,X2).

uniq([],[]):-!.
uniq([H|T],[X1|X2]):-unikalne(H,X1),uniq(T,X2).

listasum(LW1,LW2,LWY):-rozdzielanie(LW1,LW2,X1),uniq(X1,X2),zsumuj(X2,LWY).


rozlacz(0,[]):-!.
rozlacz(X,ODP):-A is X mod 10, X1 is X//10,rozlacz(X1,X2),append(X2,[A],ODP).
