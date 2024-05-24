## JUST to remember the commands in terminal and comment what they do

camper: /project$ cat stdin.txt
camper: /project$ cat < name.txt
camper: /project$ cat < name.txt
camper: /project$ echo $NAME | cat name.txt


<!--Exe the file --> 
/project$ ./script.sh

<!--      Echo <flag> <"\nTEXT" >> into <filename> -->
/project$ echo -e "\nNumber of lines:" >> kitty_info.txt
/project$ echo -e "\nNumber of words:" >> kitty_info.txt
/project$ echo -e "\nNumber of characters:" >> kitty_info.txt

<!--      insert data from <filename> | World Count <-flag> >> into <filename> -->
/project$ cat kitty_ipsum_1.txt | wc -l >> kitty_info.txt
/project$ cat kitty_ipsum_1.txt | wc -w >> kitty_info.txt
/project$ cat kitty_ipsum_1.txt | wc -m >> kitty_info.txt

<!--      Find <'pattern'> in <Filename> -->
/project$ grep 'meow' kitty_ipsum_1.txt
<!-- Return all lines where 'pattern string was find -->

<!--      FIND <-flag> <'Pattern'> in <filename> -->
/project$ grep --color 'meow' kitty_ipsum_1.txt
<!-- Return all lines where <'Pattern'> was found with powerful color -->

/project$ grep -n --color 'meow' kitty_ipsum_1.txt
<!-- Return all lines where <'Pattern'> was found with powerful color and each line where can find the strings -->

<!--      Find <-flag> <'pattern'>  in <filename> | REGEX <flag> 's/'if str'[If Num]+/1/' -->  
/project$ grep -n 'meow[a-z]*' kitty_ipsum_1.txt | sed -E 's/[0-9]+/1/'
<!-- Returns the all lines where pattern can be find | but all numbers are 1 --> 

<!-- REGEX 's/<letter or word>/<regex wanted>/' <filename> -->
/project$ sed 's/freecodecamp/f233C0d3C@mp/i' name.txt

<!-- RETURN only the lines where pattern can be find
grep -n 'meow[a-z]*' kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/'
-->

grep -n --color 'cat[a-z]*' kitty_ipsum_2.txt

grep -n 'cat[a-z]*' kitty_ipsum_2.txt | sed -E 's/([0-9]+).*/\1/' >> kitty_info.txt

<!--    EXE FILE<filename> <filename> | find with high contrast color where can find <-flag> <pattern1>*|<patter2>*' -->
/project$ ./translate.sh kitty_ipsum_1.txt | grep --color -E 'dog[a-z]*|woof[a-z]*'

grep --color -E 'cat[a-z]*|meow[a-z]*' >> kitty_ipsum_1.txt