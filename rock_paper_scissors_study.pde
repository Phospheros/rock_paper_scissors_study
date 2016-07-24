//  R.A. Robertson 2016

int contestant1, contestant2;
String str1, str2;

contestant1 = int(random(0, 3));
contestant2 = int(random(0, 3));
str1 = contestant1 == 0 ? "Rock" : contestant1 == 1 ? "Paper" : "Scissors" ;
str2 = contestant2 == 0 ? "Rock" : contestant2 == 1 ? "Paper" : "Scissors" ;

println(contestant1 + "  " + contestant2);
if (contestant1 == contestant2) println("Tie");
else if (((3 + contestant1 - contestant2) % 3) == 1) println(str1 + " beats " + str2);
else println(str1 + " loses to " + str2);

//// Rock/Scissors 0, 2 special case:
//else if (abs(contestant1 - contestant2) == 2) {
//  if (contestant1 < contestant2) println(str1 + " beats " + str2);
//  else println(str1 + " loses to " + str2);
//// Normal cases:
//} else if (contestant1 > contestant2) println (str1 + " beats " + str2);
//else println(str1 + " loses to " + str2);  

exit();

/*
Simple evaluation of Rock/Paper/Scissors dynamic:
            
               Rock = 0; Paper = 1; Scissors = 2

Discounting ties, six outcomes are possible:

0 :: 1    Loss (First player)
0 :: 2    Win*
1 :: 2    Loss
1 :: 0    Win
2 :: 1    Win
2 :: 0    Loss*

* Win/Loss is as expected with > or <, except the two cases involving 0 and 2.
Would love to find a more elegant solution for handling all cases.

http://stackoverflow.com/questions/9553058/scalable-solution-for-rock-paper-scissor

In, Rock-Paper-Scissor games, it is easy to decide if move a wins against move b using
their index at a cycle. So you don't have to manually decide in your code the result of 
every combination as other answers here suggest.

For the Rock-Paper-Scissor-Spock-Lizard version:

Let's assign a number to each move (0, 1, 2, 3, 4).

Notice that every move beats two moves:

    The move previous to it in the cycle (or four cases ahead)
    The move two cases ahead in the cycle

So let d = (5 + a - b) % 5. Then:

    d = 1 or d = 3 => a wins
    d = 2 or d = 4 => b wins
    d = 0 => tie

For the Rock-Paper-Scissor version:

let d = (3 + a - b) % 3. Then:

    d = 1 => a wins
    d = 2 => b wins
    d = 0 => tie

Generalization For n >= 3 and n odd:

Let d = (n + a - b) % n. Then:

    If d = 0 => tie
    If d % 2 = 1 => a wins
    If d % 2 = 0 => b wins

 */