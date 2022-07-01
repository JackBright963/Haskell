# Haskell
Some functions written in Haskell

This is one of the courseworks that I had to do in uni. I will write the requirements for each function here.

{----Part 1----}
Define a function steps that takes three positive Int values m n p and returns a String
that can be displayed as p steps, of height m and width n, the right way up.

{----Part 2----}
Define a function flagpattern that takes a positive Int value greater than or equal to five and
returns a String that can be displayed as the following flag pattern of dimension n.

{----Part 3----}
Def ine a f unction swapwords that takes three String values w1 w2 s, and returns s with all
occurrences of the String w1, in the String s, replaced by the String w2.

{----Part 4----}
Define a function compatibility, that takes two String values representing persons names, and
outputs their compatibility calculated as follows, e.g.
FREDA FICKLE
BOB BEERGUT
Repeatedly cross out like characters:
FR*DA FICKLE   FR*DA FICKL*    F**DA FICKL*
BOB B*ERGUT    BOB B**RGUT     BOB B***GUT
Then apply lphi lphi lphi... in rotation thus:
F**DA FICKL*
l  p h  i l p h i
BOB B***GUT
l p h i   l p h
This means that FREDA FICKLE is indifferent to BOB BEERGUT,
whereas BOB BEERGUT hates FREDA FICKLE
(l=love, p=physical, h=hate, i=indifferent).

{----Part 5----}
Define a polymorphic function split that is applied to two arguments of types [a] and a, where a
is a type on which == is defined, and returns a list of lists that partitions the original list at
occurrences of the second argument

Here is the list of some problems with my code

Function 1 does not work properly on the cases like:            
Main> putStr(steps 3 6 0)
Main> putStr(steps 3 0 5)

Function 4 does not work properly on the cases like:       
compatibility "freda fickle" "b ob beergut"

Function 5 does not work properly on the cases like:             
Main> split [1,2,3,4,5,1,2,3,1]1
[[2,3,4,5],[2,3],[]]
Which should be [[2,3,4,5],[2,3]].
