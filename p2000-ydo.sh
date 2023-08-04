#https://gabrielstaples.com/ydotool-tutorial/#gsc.tab=0

#sudo -b ydotoold --socket-path="$HOME/.ydotool_socket" --socket-own="$(id -u):$(id -g)"

echo sleep 5

#added so an enter is typed for the first line
oldnumber=yes

cat $1 |\
while read line
do
linenumber=$(echo "$line"|cut -d" " -f1)

[[ $linenumber =~ ^[0-9]+$ ]] && number=yes || number=no
[[ $oldnumber == yes ]] && [[ $number == yes ]] && echo eval YDOTOOL_SOCKET="$HOME/.ydotool_socket" ydotool key 28:1 -d 100 28:0 -d 100
[[ $oldnumber == no ]] && [[ $number == yes ]] && echo eval YDOTOOL_SOCKET="$HOME/.ydotool_socket" ydotool key 28:1 -d 100 28:0 -d 100
#[[ $oldnumber == no ]] && [[ $number == no ]] && echo "skip enter"
[[ -z $line ]] && echo eval YDOTOOL_SOCKET="$HOME/.ydotool_socket" ydotool key 28:1 -d 100 28:0 -d 100

#replace space with copyright sign
line="$(echo "$line"|sed 's/ /©/g')"
echo "$line"|while read -n 1 char
do
[[ $char == '1' ]] && char=" 2"
[[ $char == '2' ]] && char=" 3"
[[ $char == '3' ]] && char=" 4"
[[ $char == '4' ]] && char=" 5"
[[ $char == '5' ]] && char=" 6"
[[ $char == '6' ]] && char=" 7"
[[ $char == '7' ]] && char=" 8"
[[ $char == '8' ]] && char=" 9"
[[ $char == '9' ]] && char=10
[[ $char == '0' ]] && char=11

[[ $char == 'a' ]] && char=30
[[ $char == 'b' ]] && char=48
[[ $char == 'c' ]] && char=46
[[ $char == 'd' ]] && char=32
[[ $char == 'e' ]] && char=18
[[ $char == 'f' ]] && char=33
[[ $char == 'g' ]] && char=34
[[ $char == 'h' ]] && char=35
[[ $char == 'i' ]] && char=23
[[ $char == 'j' ]] && char=36
[[ $char == 'k' ]] && char=37
[[ $char == 'l' ]] && char=38
[[ $char == 'm' ]] && char=50
[[ $char == 'n' ]] && char=49
[[ $char == 'o' ]] && char=24
[[ $char == 'p' ]] && char=25
[[ $char == 'q' ]] && char=16
[[ $char == 'r' ]] && char=19
[[ $char == 's' ]] && char=31
[[ $char == 't' ]] && char=20
[[ $char == 'u' ]] && char=22
[[ $char == 'v' ]] && char=47
[[ $char == 'w' ]] && char=17
[[ $char == 'x' ]] && char=45
[[ $char == 'y' ]] && char=21
[[ $char == 'z' ]] && char=44

[[ $char == 'A' ]] && char=42+30
[[ $char == 'B' ]] && char=42+48
[[ $char == 'C' ]] && char=42+46
[[ $char == 'D' ]] && char=42+32
[[ $char == 'E' ]] && char=42+18
[[ $char == 'F' ]] && char=42+33
[[ $char == 'G' ]] && char=42+34
[[ $char == 'H' ]] && char=42+35
[[ $char == 'I' ]] && char=42+23
[[ $char == 'J' ]] && char=42+36
[[ $char == 'K' ]] && char=42+37
[[ $char == 'L' ]] && char=42+38
[[ $char == 'M' ]] && char=42+50
[[ $char == 'N' ]] && char=42+49
[[ $char == 'O' ]] && char=42+24
[[ $char == 'P' ]] && char=42+25
[[ $char == 'Q' ]] && char=42+16
[[ $char == 'R' ]] && char=42+19
[[ $char == 'S' ]] && char=42+31
[[ $char == 'T' ]] && char=42+20
[[ $char == 'U' ]] && char=42+22
[[ $char == 'V' ]] && char=42+47
[[ $char == 'W' ]] && char=42+17
[[ $char == 'X' ]] && char=42+45
[[ $char == 'Y' ]] && char=42+21
[[ $char == 'Z' ]] && char=42+44

#if copyright sign then use space
[[ $char == '©' ]] && char=57 #KEY_SPACE

[[ $char == ',' ]] && char=51 #KEY_COMMA
#[[ $char == ',' ]] && char=42+51 #KEY_SHIFT + KEY_COMMA
[[ $char == '.' ]] && char=52 #KEY_DOT
#[[ $char == '.' ]] && char=42+52 ##KEY_SHIFT + KEY_DOT
[[ $char == '/' ]] && char=53 #KEY_SLASH
[[ $char == '?' ]] && char=42+53 #KEY_SHIFT + KEY_SLASH

[[ $char == ';' ]] && char=39
[[ $char == '+' ]] && char=42+39 #KEY_SHIFT + 
[[ $char == ':' ]] && char=40 #KEY_APOSTROPHE "'"
[[ $char == '*' ]] && char=42+40 #KEY_SHIFT + KEY_APOSTROPHE "'"
[[ $char == '#' ]] && char=43 #KEY_BACKSLASH "\"
[[ $char == '█' ]] && char=42+43 #KEY_SHIFT + KEY_BACKSLASH "\"
[[ $char == '' ]] && char=42+43 #KEY_SHIFT + KEY_BACKSLASH "\"

[[ $char == '@' ]] && char=26 #KEY_LEFTBRACE "["
[[ $char == '↑' ]] && char=42+26 #KEY_SHIFT + KEY_LEFTBRACE "["  / same as next
[[ $char == '' ]] && char=42+26 #KEY_SHIFT + KEY_LEFTBRACE "["
[[ $char == '→' ]] && char=27 #KEY_RIGHTBRACE "]"  / same as next
[[ $char == '' ]] && char=27 #KEY_RIGHTBRACE "]"
[[ $char == '←' ]] && char=42+27 #KEY_SHIFT + KEY_RIGHTBRACE "]"  / same as next
[[ $char == '' ]] && char=42+27 #KEY_SHIFT + KEY_RIGHTBRACE "]"

[[ $char == '!' ]] && char=42+2 #KEY_SHIFT + KEY_1
[[ $char == '"' ]] && char=42+3 #KEY_SHIFT + KEY_2
[[ $char == '£' ]] && char=42+4 #KEY_SHIFT + KEY_3
[[ $char == '$' ]] && char=42+5 #KEY_SHIFT + KEY_4
[[ $char == '%' ]] && char=42+6 #KEY_SHIFT + KEY_5
[[ $char == '&' ]] && char=42+7 #KEY_SHIFT + KEY_6
[[ $char == "'" ]] && char=42+8 #KEY_SHIFT + KEY_7
[[ $char == '(' ]] && char=42+9 #KEY_SHIFT + KEY_8
[[ $char == ')' ]] && char=42+10 #KEY_SHIFT + KEY_9
[[ $char == "=" ]] && char=42+11 #KEY_SHIFT + KEY_0
[[ $char == '-' ]] && char=12 #KEY_MINUS "-"
[[ $char == '_' ]] && char=42+12 #KEY_SHIFT + KEY_MINUS "-" / same as next
[[ $char == '`' ]] && char=42+12 #KEY_SHIFT + KEY_MINUS "-"

[[ $char == '¼' ]] && char=13 #KEY_EQUAL "=" / same as next
[[ $char == '{' ]] && char=13 #KEY_EQUAL "="
[[ $char == '¾' ]] && char=42+13 #KEY_SHIFT + KEY_EQUAL "=" / same as next
[[ $char == '}' ]] && char=42+13 #KEY_SHIFT + KEY_EQUAL "="

[[ $char == '<' ]] && char=111 #KEY_DELETE
[[ $char == '>' ]] && char=42+111 #KEY_SHIFT + KEY_DELETE

#unknown keys
[[ $char == '½' ]] && char= #  / same as next
[[ $char == '~' ]] && char=
#unknown keys
[[ $char == '÷' ]] && char= #  / same as next
[[ $char == '\' ]] && char=
#unknown keys
[[ $char == '||' ]] && char= #  / same as next
[[ $char == '|' ]] && char=

charcode=$(echo "$char"|sed "s/42+//g")
[[ -n $charcode ]] && echo eval YDOTOOL_SOCKET="$HOME/.ydotool_socket" ydotool key \
$([[ $char == 42+* ]] && echo 42:1 -d 200) \
$charcode:1 -d 100 $charcode:0 -d 100 \
$([[ $char == 42+* ]] && echo 42:0 -d 100)
done
linenumber=$(echo "$line"|cut -d" " -f1)
[[ $linenumber =~ ^[0-9]+$ ]] && oldnumber=yes || oldnumber=no
done
