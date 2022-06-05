
#! /bin/bash

## DESCRIPTION: a simple password validator script to check password complexity.
## AUTHOR: Jonathan Moguillansky- https://www.johnmogi.com

min_length=1 # avoiding magic number to set minimum amount of characters.
# colors for terminal messages:
Red='\033[0;31m'        # Red 
Green='\033[0;32m'      # Green
NC='\033[0m '           # No Color
valid=1

# validate function tests password string for complexity: 
# to ensure exit code I'm using echo insted of plain checks so that exit codes will return upon each check.

if [ ${#1} -lt $min_length ]; then
    printf "${Red}Password must contain at least $min_length characters${NC}\n"
    exit 1;
fi

validate (){ 

if [[ $1 =~ [0-9] ]]; then
    valid=0
else
    printf "${Red}Password must contain at least one number${NC}\n"
fi

if [[ $1 =~ [a-z] ]]; then
    valid=0
else
     printf "${Red}Password must contain at least one small character${NC}\n"
    valid=1
fi

if [[ $1 =~ [A-Z] ]]; then
    valid=0
else
     printf "${Red}Password must contain at least one capital character${NC}\n"
     valid=1
fi


echo $valid

}

# check if the -f flag is set, if it does, run validate on password file.
# exit the program if no argument supplied
case $1 in
"-f" )
file=$2
# password_from_file=$(<$2) not working on some tests! trying the following instead of getopts:
while IFS= read -r password_from_file; do
    printf "$password_from_file"
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


if [[ $valid -eq 1 ]]; then
     printf "${Red} Try again... ${NC}\n"
    exit 0
    else
printf "${Green}success${NC}password is secured\n"

fi
exit 0