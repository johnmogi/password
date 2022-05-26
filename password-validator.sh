
#! /bin/bash

## DESCRIPTION: a simple password validator script to check password complexity.
## AUTHOR: Jonathan Moguillansky- https://www.johnmogi.com

min_length=10 # avoiding magic number to set minimum amount of characters.
# colors for terminal messages:
Red='\033[0;31m'        # Red 
Green='\033[0;32m'      # Green
NC='\033[0m '           # No Color

# validate function tests password string for complexity: 
# to ensure exit code I'm using echo insted of plain checks so that exit codes will return upon each check.
validate (){ 
if [ ${#1} -lt $min_length ]; then
    printf "${Red}Try again... \nPassword must contain at least $min_length characters${NC}\n"
    exit 1
fi

echo "$1" | grep -Eq '.*[0-9]' 
if [ $? -eq 1 ] ; then
    printf "${Red}Try again... \nPassword must contain at least one number${NC}\n"
    exit 1
fi

echo "$1" | grep -Eq '.*[a-z]' 
if [ $? -eq 1 ] ; then
    printf "${Red}Try again... \nPassword must contain at least one small letter${NC}\n"
    exit 1
fi

echo "$1" | grep -Eq '.*[A-Z]'
if [ $? -eq 1 ] ; then
    printf "${Red}Try again... \nPassword must contain at least one capital letter${NC}\n"
    exit 1
fi
}

# check if the -f flag is set, if it does, run validate on password file.
# exit the program if no argument supplied
case $1 in
"-f" )
file=$2
# password_from_file=$(<$2) not working on some tests! trying the following instead of getopst:
while IFS= read -r password_from_file; do
    printf '%s\n' "$password_from_file"
done < "$file"
if [ $? -eq 0 ] ; then
validate $password_from_file
else
printf "${Red} Please specify a filepath along the -f <'./filepath>${NC}\n"
exit 1
fi
;;
*)
validate $1
;;
esac 

printf "${Green}success${NC}password is secured\n"
exit 0