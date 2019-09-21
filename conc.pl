
conc([],X,X).
conc([X|X1],Y,[X|Z]):-conc(X1,Y,Z).

member(X,[X|Y]).
member(X,[_|Y]):-member(X,Y).

add(X,Y,[X|Y]).

del(X,[X|Y],Y).
del(X,[Y|Z],[Y|Z1]):-del(X,Z,Z1).

codrugi([],[]).
codrugi([_],[]).
codrugi([_,X|Y],[X|C]):-codrugi(Y,C).

bezostatniego([_],[]).
bezostatniego([X|Tail],[X|C]):-bezostatniego(Tail,C).

oddlen([H|[]]).
oddlen([X1,X2|Tail]):-oddlen(Tail).

evenlen([X,Y]).
evenlen([X,Y|Z]):-evenlen(Z).

divlist([X|[]],[X],[]).
divlist([X,Y],[X],[Y]).
divlist([X,Y|Tail],[X|L1],[Y|L2]):-divlist(Tail,L1,L2).


revlist([X1],[X1]).
revlist([X|Y],L):-revlist(Y,L1),append(L1,[X],L).



palindrome([_]).
palindrome([X]).
palindrome([H|T]):-append(T1,[H],T),palindrome(T1).



find(X,[X|_],1).
find(X,[_|Y],Z):-Z1 is Z-1,find(X,Y,Z1).


countlist([],0).
countlist([H|Tail],L):-countlist(Tail,L1),L is L1+1.

sumlist([X],X).
sumlist([H|Tail],L):-sumlist(Tail,L1),L is L1+H.

end([X],[],X).
end([H|T],[H|L],X):-
	end(T,L,X).

nwd(X,X,X).
nwd(X,Y,C):-X<Y,Y1 is Y-X, nwd(X,Y1,C).
nwd(X,Y,C):-Y<X, X1 is X-Y, nwd(X1,Y,C).

sub_begin([],_).
sub_begin([X|H1], [X|H2]):-sub_begin(H1, H2).

sublist(X,X).
sublist(X, L):-sub_begin(X,L).
sublist(X,[_|Tail]):-sublist(X,Tail).


flatten(X,X).
flatten([],[]).
flatten([X|Y],Z):-flatten(X,Z1),flatten(Y,Z2),append(Z1,Z2,Z).


adjacent(X,Y,[X,Y|_]).
adjacent(X,Y,[Y,X|_]).
adjacent(X,Y,[A,B|L]):-adjacent(X,Y,L).


allafater([X|Tail],X,Tail).
allafter([_|Tail],X,C):-allafter(Tail,X,C).






insert(H1,H2,[],[],[H1],[H2]):-!.
insert(X1,X2,[H1|T1],[H2|T2],[X1,H1|T1],[X2,H2|T2]):-!.
insert(X1,X2,[H1|T1],[H2|T2],[H3|T3],[H4|T4]):-insert(X1,X2,T1,T2,T3,T4).

insertsort([],[],[],[]):-!.
insertsort([H1|T1],[H2|T2],X,Y):-insertsort(T1,T2,X1,Y1),insert(H1,H2,X1,Y1,X,Y).





rozbij([],[]):-!.
rozbij([H1|T1],[H2|T2]):-rozbijaj(H1,H2),rozbij(T1,T2).

usuwaj([X],[X]):-!.
usuwaj([H1,H2|T1],LWY):-H2<H1,!,usuwaj([H1|T1],LWY).
usuwaj([H1|T1],LWY):-usuwaj(T1,Y),append([H1],Y,LWY).

usun([],[]):-!.
usun([H1|T1],LWY):-usuwaj(H1,Y),usun(T1,Z),append([Y],Z,LWY).

lacz([],0):-!.
lacz([H1|T1],S):-lacz(T1,S1), S is 10*S1 +H1.

odwracaj([X],[X]):-!.
odwracaj([H|T],LWY):- odwracaj(T,Y),append(Y,[H],LWY).

//polacz([],[]):-!.
//polacz([H1|T1],LWY):-odwracaj(H1,Y1),lacz(Y1,Y2),polacz(T1,Y3),append([Y2],Y3,LWY).


bin(0,[]):-!.
bin(H,X):-S is mod(H,2), H1 is div(H,2), bin(H1,X1),append(X1,[S],X).

binarnie([],[]):-!.
binarnie([H|T],X):-bin(H,H1),binarnie(T,X1),append([H1],X1,X).

onlyX([],[]):-!.
onlyX([H|T],Y):-append([X],_,H),onlyX(T,Y1),append([X],Y1,Y).

max([X],X):-!.
max([X,Y|T],Z):-X=<Y,max([Y|T],Z1), Z is Z1.
max([X,Y|T],Z):-X>Y,max([X|T],Z1), Z is Z1.


onlyY([],[]):-!.
onlyY([H|T],Z):-append([_],[Y],H),onlyY(T,Y1),append([Y],Y1,Z).

min([X],X):-!.
min([X,Y|T],Z):-X=<Y,min([X|T],Z1), Z is Z1.
min([X,Y|T],Z):-X>Y,min([Y|T],Z1), Z is Z1.

middle(LWE,Z):-onlyX(LWE,A),max(A,X1),min(A,X2),onlyY(LWE,B),max(B,Y1),min(B,Y2),X3 is X1 + X2,X is div(X3,2), Y3 is Y1 + Y2,Y is div(Y3,2), append([X],[Y],Z).

distance([],[],[]):-!.
distance(A,B,D):-append([X1],[Y1],A),append([X2],[Y2],B), X is X1 - X2,Y is Y1 - Y2,XD is X * X,YD is Y * Y, D is XD + YD.

distances([],_,[]):-!.
distances([H|T],M,Z):-distance(H,M,D1),distances(T,M,D2)
distances([H|T],M,Z):-distance(H,M,D1),distances(T,M,D2),D1 < D2, append([H1],_,T),Z is H1.

zad(LWE,M):-middle(LWE,M).

bezpow([X],[X]):-!.
bezpow([H1,H1|T1],[H1|T2]):-bezpow([H1|T1],T2),!.
bezpow([_,H2|T1],LWY):-bezpow([H2|T1],LWY),!.
