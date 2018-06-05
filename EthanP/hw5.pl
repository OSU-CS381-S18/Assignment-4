/*
*	Contributors :: Ethan Patterson | Blake Hudson | Ethan Ahuja 
*/
when(275,10).
when(261,12).
when(381,11).
when(398,12).
when(399,12).

where(275,owen102).
where(261,dear118).
where(381,cov216).
where(398,dear118).
where(399,cov216).

enroll(mary,275).
enroll(john,275).
enroll(mary,261).
enroll(john,381).
enroll(jim,399).

/* Exercise 1
	Part a*/

schedule(X,P,T) :- enroll(X,R), where(R,P), when(R,T).

/*	Part b*/

usage(X,Y) :- where(T,X), when(T,Y).

/* 	Part c*/

conflict(X,Y) :- where(X, P), when(X,T), where(Y,P), when(Y,T), X\=Y.

/*	Part d*/

time(X,Y) :- X =:= Y+1.
time(X,Y) :- X =:= Y-1.
meet(A,B) :- enroll(A,C), enroll(B,C), A\=B.
meet(A,B) :- enroll(A,C), when(C,H),where(C,L),enroll(B,D),when(D,Y),where(C,L),time(H,Y), A\=B.

/* Exercise 2
	Part a*/

/*	Part b*/

	flat([],[]) :- !.
	flat([InputList|OutputList], FlatendL) :- !, flat(InputList, NewList), flat(OutputList, NewList2),
		append(NewList,NewList2, FlatendL).
	flat(L,[L]).

/* 	Part c*/
	findE(_,[],[]).
	findE([],_,[]).
	findE(1,[X|_],X) :- !.	

	%findE(X,[X|_],1).
	%findE(X,[_|List],N) :- N > 1, N1 is X-1, findE(N1,List,N).
	findE(X,[_|List],N) :- \+ is_list(X), N1 is X-1, findE(N1,List,N).
	findE([X1|X2],L,[Y1|Y2]) :- findE(X1,L,Y1), findE(X2,L,Y2).
	project(I,List,L) :- findE(I,List,Flat1), flat(Flat1,L).