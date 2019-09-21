min([],R,R):-!.
min([H|T],W,R):-H=<W,min(T,H,R),!.
min([_|T],W,R):-min(T,W,R),!.
min([H|T],R):-min(T,H,R),!.


max([],R,R):-!.
max([H|T],W,R):-H>=W,max(T,H,R),!.
max([_|T],W,R):-max(T,W,R),!.
max([H|T],R):-max(T,H,R),!.


zawiera(X,[H1,H2]):-X>=H1,X=<H2,!.

lista_zawartych([],_,[]):-!.
lista_zawartych([H|T],PRZ,[H|X2]):-zawiera(H,PRZ),lista_zawartych(T,PRZ,X2),!.
lista_zawartych([_|T],PRZ,LWY):-lista_zawartych(T,PRZ,LWY),!.

zawarcie([],_,[]):-!.
zawarcie([H|T],LWE,[X|X2]):-lista_zawartych(LWE,H,X),zawarcie(T,LWE,X2).


middle([X],X):-!.
middle([X,Y],Z):-Z is ((X+Y)/2).
middle([_|T],X):-append(A,[_],T),middle(A,X).

srodkowe([],[]):-!.
srodkowe([H|T],[X|X1]):-middle(H,X),srodkowe(T,X1).

najdalszy_punkt(LWE,P,X):-max(LWE,X1),min(LWE,X2), X1-P>=P-X2,X is X1.
najdalszy_punkt(LWE,_,X):-min(LWE,X2), X is X2.

odleglosc(P,X,WYN):-WYN is abs(P-X).
odleglosci([],[],[]):-!.
odleglosci([H|T],[H1|T1],X):-odleglosc(H,H1,X1),odleglosci(T,T1,X2),append([X1],X2,X).

zad(LWE1,LWE2,WYN):-zawarcie(LWE2,LWE1,X1),srodkowe(X1,X2),najdalszy_punkt(X1,X2,X3),odleglosci(X1,X2,X3),max(X3,WYN).
