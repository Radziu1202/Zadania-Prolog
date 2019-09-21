dec_to_bin(0,[]):-!.
dec_to_bin(X,[A|X2]):-A is mod(X,2),X1 is X//2,dec_to_bin(X1,X2).


hamming([],[],0):-!.

hamming([],[H|T],N):-H=:=1, hamming([],T,N1),N is N1+1.
hamming([],[_|T],N):-hamming([],T,N).

hamming([H|T],[],N):-H=:=1, hamming([],T,N1),N is N1+1.
hamming([_|T],[],N):-hamming(T,[],N).

hamming([H1|T1],[H2|T2],N):-H1=\=H2,hamming(T1,T2,N1),N is N1+1.
hamming([_|T1],[_|T2],N):-hamming(T1,T2,N).


