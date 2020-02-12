 /* Homework Assignment 3
   Programming Languages
   CS471, Spring 2020
   Due Tuesday, Feb 11
   Binghamton University */

/* Instructions */

/*

This section deals with general submission instructions. Use this
source file. BEFORE MOVING ON RENAME hw3S20 to hw3.pl. You will be
able to code in and run the file in the prolog interpreter directly. I
recommend reading this assignment directly from the source file.

We will be using swipl for our prolog environment:
 To load/reload this file, cd to its directory and run swipl. Then, in the prompt, type [hw3].

cd PATH_TO_FILE
swipl
[hw3].

From then on you may execute queries (goals) in the prompt. As usual,
you should provide your answers in the designated spot. Once you have
added some code to the file, rerun [hw3]. in the swipl prompt to
reload.

In addition, there are unit tests for each problem. These are there to
help you better understand what the question asks for, as well as
check your code. They are included in our knowledge base as queries
and are initially commented out -- % is a Prolog line comment.

%:- member_times(4,[3,3,2,3],0). % SUCCEED
%:- member_times(4,[1,2,3],3).   % FAIL

After you have finished a problem and are ready to test, remove the
initial % for each test for the associated problem and reload the
assignment file ([hw3].). Each SUCCEED line should silently load and
succeed, and each FAIL line should throw a WARNING. If a SUCCEED line
throws a WARNING, or a FAIL line fails to, then you solution is not
correct. If you pass the tests there is a good chance that your code
is correct, but not guaranteed; the tests are meant as guided feedback
and are not a check for 100% correctness.

*/

/* Submission */

/*
For this assignment -- and the remaining Prolog assignments -- you must
submit only the source file. There is no need to tar anything as all
coding should be done directly in hw3.pl.
*/

/* Homework 3 */

/* Due: Next Wednesday, 11:59 PM */

/*
Purpose: To get comfortable with Logic programming, and get a good
grasp on list manipulation in Prolog.
*/

/* Problem 0A (Lab problem):
   Programming with matching.  A line can be defined by 2 points. A point has an
   x and y coordinate.   A line is vertical if both points have the same x value.
   A line is horizontal if both points have the same y values.  The following
   is a knowledge base which specify what is meant for a line to be vertical
   or horizontal respectively. This example is due to Ivan Bratko.
*/

vertical(line(point(X,Y),point(X,Z))).
horizontal(line(point(X,Y),point(Z,Y))).

/* 1. Name the clauses, predicates, rules, and facts.

Each lines is a clause, since they both end with a period. The first clause begins with "vertical" and ends at the period, and the second clause begins with horizontal and ends at the period; clauses always end with periods.
The predicates are vertical and horizontal.
There are no rules; only facts.
There are two facts here: one is "vertical(line(point(X,Y),point(X,Z))).", and the other is "horizontal(line(point(X,Y),point(Z,Y)))."

   2. Name the constants, variables, and complex structures. 

vertical, horizontal, line, and point are constants.
X, Y, Z, X, Y, and Z are all Variables.
line and point are complex structures.
*/ 

/* Problem 0B (Lab problem):
    A way of writing numerals, which is sometimes used in mathematical logic, makes
    use of just four symbols: 0, succ , and the left and right parentheses.
    The following is the knowledge base for this representation of a numeral.
    The predicate 'add' is the definition of adding this representation of numbers.

    Use this base you should use to answer the question.
    (Reference 3.1 example 3 Learn Prolog Now!
      http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse9)
    */

numeral(0).
numeral(succ(X))  :-  numeral(X).

add(0,Y,Y).
add(succ(X),Y,succ(Z))  :-
                    add(X,Y,Z).


/* 1. Name the clauses, predicates, rules, and facts.

There are four clauses; each ends at a period. The first is "numeral(0)." The second is "numeral(succ(X))  :-  numeral(X)." The third is "add(0,Y,Y)." The fourth begins with "add(succ" and ends with ").".
The predicates are "numeral", "succ", and "add".
The rules are "numeral(succ(X))", with the body "numeral(X)."; and "add(succ(X),Y,succ(Z))" with the body "add(X,Y,Z).".
The facts are "numeral(0)" and "add(0,Y,Y)."

   2. Name the constants, variables, and complex structures. 
   
The constants are numeral, 0, succ, and add.
The variables are X, Y, X, Y, and Z.
There are no complex structures.
   */



/* Problem 0C (Lab Problem):

Each line is an individual Prolog query; it's a good idea type them in your prompt (not the file itself) to get a feel for the way Prolog works. You should think about whether or not each query will succeed, and if so how the variables will be instantiated (as result of unification). You can expect these sort of questions on the test.

X = 1+2.
X is 1+2.
1+2=1+2.
1+2=2+1.
1+2=3.
1+2 is 3.
3 is 1+2.
3 =< 6.
6 =< 3.
X = Y, Y = Z, Z = 3.
X = Y, Y = Z, Z = 3, X = 4.
T = (X,Y), X = a, Y = b.
X = [1,2,3], [H|T] = X.
X = [1,2,3], [H1,H2|T] = X.
X = [1], [H|T] = X.
X = [1], Y = [2|X].
add(0,succ(succ(0)),Y).

help(member).
X = 3, member(X, [Y]).
*/

/* Problem 0D :
Write a predicate insert_at(E,Y,N,Z) that succeeds if Z is the list Y with E inserted at index N -- Insert X at index N in Y.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Y.  */

/* Problem 0D Answer: */

insert_at(E,Y,0,[E|Y]).
insert_at(E,[X|Y],N,[X|Z]) :-
	N>0, Nn is N-1, insert_at(E,Y,Nn,Z).

/* Problem 0D Test: */
:- insert_at(3,[1,2,3],2,[1,2,3,3]).  % SUCCEED
:- insert_at(1,[1,2,3],0,[1,1,2,3]).  % SUCCEED
:- insert_at(a,[1,2,3],1,[1,a,2,3]).  % SUCCEED
:- insert_at(1,[1,2,3],0,[1,2,3]).    % FAIL



%%%% Homework %%%%

/* Problem 1:
   A) What is the mathematical definition of:
     a) a relation?
     b) a function?
   B) Is every function a relation? If false, give a counter example.
   C) Is every relation a function? If false, give a counter example. 
   */

/* Problem 1 Answer: */
/*
	Aa) A relation describes a mathematical relationship between two or more variables, but does not necessarily act on them besides this.
	Ab) A function takes one or more variables and uses them to produce a result; functions have an output.
	B) Yes; as every function has an output, any function acts as a relation between its inputs and its output.
	C) Technically, yes; a relation establishes a mathematical relationship between two or more variables; if neither could be mapped properly to an "output", then you can have them both act as arguments for this hypothetical function, the output of which simply being whether the relation is true; as such, it has inputs and outputs.
   That said, I feel fairly confidant that the correct answer here is "no".
*/
/* Problem 2:
   Define homoiconic.
   Is Prolog homoiconic?
   What does it mean to say a language is fully reflective?
   Is Prolog fully reflective?

   (See page 584 and Chapter 12)
*/

/* Problem 2 Answer: */
/*
	A language is homoiconic if any given program written in it can behave as data for another written in the same language.
	Prolog is homoiconic.
	If a language were to be fully reflective, then it would be able to fully look at and modify its own structure and behavior. As an example, imagine a human who can look at not only their thoughts, but at the factors and systems that create their thoughts; such a human would be fully reflective, in the context of programming.
	No programming languages are fully reflective; I feel like that would be a bootstrap paradox, or like the Tyranny of the Rocket Equation.
*/
/* Problem 3:

The following are two basic predicates for list manipulation:
my_first/2 and my_last/2. We may refer to a predicate by writings it
as name/arity; hence, my_first/2 means a predicate named my_first with
two arguments.

my_first(X,Y) succeeds if X is the first element of list Y.
my_last(X,Y) succeeds if X is the last element of list Y.
*/

my_first(X,[X|_T]).

my_last(X,[X]).
my_last(X,[_H|Ys]) :- my_last(X,Ys).

/*
Note my use of the _ (wildcard). It is used to say to Prolog "I don't
care, match anything" and should be used to avoid singleton warnings
(a variable that is not unified). We will discuss this during lab.

Try the following queries before moving on. Note that they are
included in the comment section for a reason: They would be
interpreted as facts in the database otherwise.

my_first(X,[3,a,dd]).
my_last(X,[3,a,dd]).
my_first(3,[3,a,dd]).
my_first(a,[3,a,dd]).
my_last(dd,[3,a,dd]).
my_last(a,[3,a,dd]).

Now, write a predicate has_item(X,Y) that succeeds if X is a item in the list Y.

NOTE: my_first/2 and my_last/2 are provided as examples for
manipulating lists. You should not use them in definition of
has_item/2.

*/

/* Problem 3 Answer: */

has_item(X,[X|_T]).
has_item(X, [_H|Y]) :- has_item(X,Y).

/* Problem 3 Test: */
:- has_item((1,3),[(1,2),(1,3)]).     % SUCCEED
:- has_item(3,[3]).         % SUCCEED
:- has_item((1,3), [(2,1),(3,1)]).     % FAIL

/* Problem 4:
 Write a predicate init(All, BLst) that succeeds if Blst has all the items of ALL
 except the last item.  The items in BLst are in the same order as ALL.
*/

/* Problem 4 Answer: */

init([_A|[]],[]).
init([X|At], [X|Bt]):-
	init(At,Bt).

/* Problem 4 Test: */
:- init([1], []).       % SUCCEED
:- init([1,2,3], [1,2]).% SUCCEED
:- init([1,2], [1,2]).  % FAIL
:- init([1,2], [2]).	% FAIL

/* Problem 5:
Write a predicate is_decreasing(X) that succeeds if X is a list of decreasing numbers -- Each number is either the same or lower than the preceding number.

NOTE: You may match two elements at a time against a list: [X,Y|Xs] = List. It's preferable to do it in the rule head however...
some_rule([X,Y|Xs]) :- ...  */

/* Problem 5 Answer: */

is_decreasing([]).
is_decreasing([_A|[]]).
is_decreasing([H1,H2|T]):-
	H1>=H2, is_decreasing([H2|T]).

/* Problem 5 Test: */
:- is_decreasing([]).            % SUCCEED
:- is_decreasing([10]).          % SUCCEED
:- is_decreasing([10,9]).        % SUCCEED
:- is_decreasing([10,9,7]).      % SUCCEED
:- is_decreasing([10,9,7,7,2]).  % SUCCEED
:- is_decreasing([1,1,1,1,1]).   % SUCCEED

:- is_decreasing([10,9,7,9]).    % FAIL
:- is_decreasing([2,3,1]).       % FAIL
:- is_decreasing([1,2,3]).       % FAIL
:- is_decreasing([7,19]).        % FAIL


/* Problem 6:
Write a predicate element_at(X,Y,N) that succeeds if X is the Nth element of list Y. Y is 0-indexed.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Y.  */

/* Problem 6 Answer: */

element_at(X,[X|_T],0).
element_at(X,[_Yh|Yt],N):-
	Nn is N-1, element_at(X,Yt,Nn).

/* Problem 6 Test: */
:- element_at(3,[1,2,3],2).   % SUCCEED
:- element_at(1,[1,2,3],0).   % SUCCEED

:- element_at(1,[1,2,3],1).     % FAIL


/* Problem 7 :
Write a predicate delete_at(E,Y,N,Z) that succeeds if Z is the list Y with E deleted at index N -- Delete E at index N in Y.
YOU SHOULD USE the predicate defined in 0D problem in lab to solve this problem.

NOTE: Don't worry about the error cases: i.e, N greater than the length of Z.  */

/* Problem 7 Answer: */

delete_at(E,Y,N,Z):-
	insert_at(E,Z,N,Y).

/* Problem 7 Test: */

:- delete_at(3,[1,2,3,3],2,[1,2,3]).  % SUCCEED
:- delete_at(1,[1,1,2,3],0,[1,2,3]).  % SUCCEED
:- delete_at(a,[1,a,2,3],1,[1,2,3]).  % SUCCEED

:- delete_at(1,[1,2,3],0,[1,2,3]).    % FAIL






/* Problem 8:

Write a predicate zip(Xs,Ys,Zs) that succeeds if Zs is a list where each element is a tuple, (X,Y), with Xs and Ys paired together. However, the length of Zs will be equal to the length of Xs or Ys which ever is less.

For example...
zip([1,2,3,4],[a,b,c],Zs) should give Zs = [(1,a),(2,b),(3,c)]
zip([1],[a,b],Zs) should give Zs = [(1,a)] */

/* Problem 8 Answer: */

zip([],_Y,[]).
zip(_X,[],[]).
zip([Xh|Xt],[Yh|Yt],Zs):-
	zip(Xt,Yt,Zt), Zs = [(Xh,Yh)|Zt].

/* Problem 8 Test: */
:- zip([1,2,3],[a,b,c],[(1,a),(2,b),(3,c)]). % SUCCEED
:- zip([],[a,b,c],[]).                  % SUCCEED
:- zip([1,3],[],[]).                    % SUCCEED
:- zip([1,3],[2],[(1,2)]).              % SUCCEED

:- zip([1],[2],[(2,3)]).                 % FAIL
:- zip([1],[a,b],[(1,a),(1,b)]).         % FAIL

/* Problem 9:
Write a predicate merge(A,B,M) that succeed if the list M has all the items from lists A and B in decreasing order.  Assume that A and B are sorted in decreasing order.  Items do not need to be unique.

For example:
merge([10,3,2], [11,5,2], M) should give M =[11,10,5,3,2,2].

 */

/* Problem 9 Answer: */

merge([],X,X).
merge(X,[],X).
merge([Ah|At],[Bh|Bt],M):-
	Ah>=Bh, merge(At,[Bh|Bt],Ma), M = [Ah|Ma].
merge([Ah|At],[Bh|Bt],M):-
	Ah<Bh, merge([Ah|At],Bt,Mb), M = [Bh|Mb].

/* Problem 9 Test: */
:- merge([10,3,2],[11,5,2],[11,10,5,3,2,2]) .       % SUCCEED
:- merge([0],[],[0]).                               % SUCCEED
:- merge([],[3],[3]).                               % SUCCEED

:- merge([4,3],[3],[3]).                            % FAIL

/* Problem 10:
   See Problem 0B above for the knowledge base used for defining greater_than/2 .
   Exercise  3.4 (http://www.learnprolognow.org/lpnpage.php?pagetype=html&pageid=lpn-htmlse11)
   Define a predicate greater_than/2 that takes two numerals in the notation
   that we introduced in the text (that is, 0, succ(0), succ(succ(0)), and so on)
   as arguments and decides whether the first one is greater than the second one.
*/

/* Problem 10 Answer: */

/* Problem 10 Test: */
% :- greater_than(succ(succ(succ(0))),succ(0)).        % SUCCEED
% :- greater_than(succ(succ(0)),succ(succ(succ(0)))).  % FAIL




/* Problem 11:
   See Problem 0B above for the knowledge base used for defining subtract/3 .
   Define substract(Num1,Num2,Result) to succeed if Result is the result of
   Num1 - Num2.  Num1, Num2 and Result use four symbols: 0, succ , and the left and right parentheses
   to represent numbers.

   Use the add/3, from problem 0B, definition to define subtract/3.  Do not
   write a recursive definition for subtract/3.
*/


/* Problem 11 Answer: */

/* Problem 11 Test: */
% :- subtract(succ(succ(0)), succ(0), succ(0)).       % SUCCEED
% :- subtract(succ(succ(0)), 0, succ(succ(0))).       % SUCCEED
% :- subtract(succ(succ(0)), succ(succ(0)), 0).       % SUCCEED
% :- subtract(succ(succ(0)), 0, 0).	            % FAIL
% :- subtract(succ(succ(0)), succ(0), succ(succ(0))). % FAIL

/* Problem 12:
 
Write a predicate has_subseq(X,Y) that succeeds if Y is a list that is a subsequence of a list X. 

For example...
has_subseq([a,b,c,d],[b,d]) should succeed, but has_subseq([a,b,c,d],[b,e]) should fail. */

/* Problem 12 Answer */

/* Problem 12 Test: */
%:- has_subseq([a,g,b,d],[g,b]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,4]).     % SUCCEED
%:- has_subseq([1,2,3,4],[2,3]).     % SUCCEED
%:- has_subseq([1,2,3,4],[]).        % SUCCEED

%:- has_subseq([1,2,3,4],[2,5]).     % FAIL
%:- has_subseq([1,2,3,4],[4,3]).     % FAIL

