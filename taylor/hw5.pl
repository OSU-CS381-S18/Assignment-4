/*
HOMEWORK 5
CS 381

Taylor Griffin
Nickoli Londura
Lucien Tamno
*/


/*==========
  Exercise 1
  ==========*/

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

/* a) */
schedule(X,P,T) :- enroll(X,Z), where(Z,P), when(Z,T).

/* b) */
usage(P,T) :- where(Z,P), when(Z,T).

/* c) */
conflict(X,Y) :- where(X,P), when(X,T), where(Y,P), when(Y,T), X\=Y.

/* d) */
% check that class times are within 1 hour
time(T1,T2) :- T1 =:= T2+1.
time(T1,T2) :- T1 =:= T2-1.
% check whether they're in the same class
meet(A,B) :- enroll(A,C), enroll(B,C), A\=B.
% check whether they are in classes that meet in the same place
meet(A,B) :- enroll(A,C), where(C,P), when(C,T), enroll(B,C2), where(C2,P), when(C2,T2), time(T,T2), A\=B.

/*==========
  Exercise 2
  ==========*/

/* a) */
% base case
rdup([],[]).
% if not in list, add to list and proceed
rdup([H|T],M) :- T=[H|_], rdup(T,M).
% proceed
rdup([H|T],[H|M]) :- rdup(T,M).

/* b) */
% base case
flat([],[]).
% flatten head and tail
flat([A1|B1],F) :- flat(A1,A2), flat(B1,B2), append(A2,B2,F).
% convert value to list
flat(X,[X]).

/* c) */
% handle empty lists
projectWork(_,[],[]).
projectWork([],_,[]).
% handle head of list
projectWork(1,[H|_],H) :- !.
% handle tail of list and others
projectWork(I,[_|T],X) :- \+ is_list(I), Dec is I-1, projectWork(Dec,T,X).
projectWork([X1|X2],L,[Y1|Y2]) :- projectWork(X1,L,Y1), projectWork(X2,L,Y2).

% pass list into helper function, flatten input list
project(Indices,List,L) :- projectWork(Indices,List,FlatList), flat(FlatList,L).
