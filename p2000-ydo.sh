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
[[ $oldnumber == yes ]] && [[ $number == yes ]] && echo xdotool keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
[[ $oldnumber == no ]] && [[ $number == yes ]] && echo xdotool keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
#[[ $oldnumber == no ]] && [[ $number == no ]] && echo "skip enter"
[[ -z $line ]] && echo xdotool sleep 0.05 keydown "Return" sleep 0.05 keyup "Return" sleep 0.05
#replace space with underscore
line="$(echo "$line"|sed 's/ /_/g')"
echo "$line"|while read -n 1 char
do
[[ $char == '1' ]] && char=2
[[ $char == '2' ]] && char=3
[[ $char == '3' ]] && char=4
[[ $char == '4' ]] && char=5
[[ $char == '5' ]] && char=6
[[ $char == '6' ]] && char=7
[[ $char == '7' ]] && char=8
[[ $char == '8' ]] && char=9
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

[[ $char == '_' ]] && char=57 #KEY_SPACE

[[ $char == ',' ]] && char=52
[[ $char == '.' ]] && char=51
[[ $char == '/' ]] && char=53

[[ $char == ';' ]] && char=39
[[ $char == ':' ]] && char=40 #KEY_APOSTROPHE "'"
[[ $char == '#' ]] && char=43 #KEY_RIGHTBRACE "\"

[[ $char == '@' ]] && char=26 #KEY_LEFTBRACE "["
#NOT defines : KEY_RIGHTBRACE		27

[[ $char == '-' ]] && char=12

[[ $char == '<' ]] && char=111

[[ $char == '$' ]] && char=

[[ $char == '&' ]] && char=
[[ $char == '+' ]] && char=
[[ $char == "=" ]] && char=
[[ $char == '"' ]] && char=
[[ $char == '>' ]] && char=42+111
[[ $char == '(' ]] && char=
[[ $char == ')' ]] && char=



[[ $char == '*' ]] && char=

[[ $char == '?' ]] && char=
[[ $char == '!' ]] && char=
[[ $char == '`' ]] && char=
[[ $char == '%' ]] && char=

#'~'
#'}'

output="$(echo "$char"|sed "s/Shift + //g")"
[[ -n $output ]] && YDOTOOL_SOCKET="$HOME/.ydotool_socket" ydotool key 42+:1 -d 200 43:1 -d 100 43:0 -d 100 42+:0 -d 100
done
linenumber=$(echo "$line"|cut -d" " -f1)
[[ $linenumber =~ ^[0-9]+$ ]] && oldnumber=yes || oldnumber=no
done