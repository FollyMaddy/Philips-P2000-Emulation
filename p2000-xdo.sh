#https://gitlab.com/cunidev/gestures/-/wikis/xdotool-list-of-key-codes
#https://www.ascii-code.com/

echo sleep 5

#added so an enter is typed for the first line
oldnumber=yes

cat $1 |\
while read line
do
linenumber=$(echo "$line"|cut -d" " -f1)
[[ $linenumber =~ ^[0-9]+$ ]] && number=yes || number=no
[[ $oldnumber == yes ]] && [[ $number == yes ]] && echo xdotool keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
[[ $oldnumber == no ]] && [[ $number == yes ]] && echo xdotool keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
#[[ $oldnumber == no ]] && [[ $number == no ]] && echo "skip enter"
[[ -z $line ]] && echo xdotool keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
#replace space with underscore
line="$(echo "$line"|sed 's/ /_/g')"
echo "$line"|while read -n 1 char
do 
char=${char,,} #char to lowercase
[[ $char == '_' ]] && char=space #space (underscore is space)
[[ $char == '$' ]] && char="Shift + 4"
[[ $char == ',' ]] && char=comma
[[ $char == '.' ]] && char=period
[[ $char == '&' ]] && char="Shift + 6" # ampersand
[[ $char == '+' ]] && char="Shift + semicolon" # plus
[[ $char == "=" ]] && char="Shift + 0" # equals
[[ $char == '"' ]] && char="Shift + 2" # quotedbl
[[ $char == '>' ]] && char="Shift + Delete" # greater
[[ $char == '<' ]] && char=Delete # less
[[ $char == '(' ]] && char="Shift + 8" #asterisk # parenleft
[[ $char == ')' ]] && char="Shift + 9" #parenleft # parenright
[[ $char == ';' ]] && char=semicolon
[[ $char == ':' ]] && char=quoteright #colon
[[ $char == '-' ]] && char=minus #colon
[[ $char == '*' ]] && char="Shift + apostrophe" #asterisk
[[ $char == '/' ]] && char=0x002f #slash
[[ $char == '?' ]] && char="Shift + slash" #question
[[ $char == '!' ]] && char="Shift + 1" #exclamdown
[[ $char == '`' ]] && char="Shift + 7"
[[ $char == '%' ]] && char="Shift + 5"
[[ $char == '#' ]] && char="Shift + backslash" #numbersign
#'~'
#'}'

echo xdotool $([[ $char == Shift* ]]&& echo keydown Shift sleep 0.05) keydown "$(echo "$char"|sed "s/Shift + //g")" sleep 0.05  keyup "$(echo "$char"|sed "s/Shift + //g")" sleep 0.05 $([[ $char == Shift* ]]&& echo keyup Shift sleep 0.05)
done
linenumber=$(echo "$line"|cut -d" " -f1)
[[ $linenumber =~ ^[0-9]+$ ]] && oldnumber=yes || oldnumber=no
#echo xdotool keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
#sleep 2
done
