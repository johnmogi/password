
#! /bin/bash

## DESCRIPTION: a simple password validator script to check password complexity.
## AUTHOR: Jonathan Moguillansky- https://www.johnmogi.com

min_length=10 # avoiding magic number to set minimum amount of characters.
# colors for terminal messages:
Red='\033[0;31m'        # Red 
Green='\033[0;32m'      # Green
NC='\033[0m '           # No Color

# exit the program if no argument supplied:
if [ ${#1} -lt $min_length ]; then
printf "${Red}Try again... \nPassword on file is too short, there should be at least $min_length characters${NC}\n"
exit 1;
fi

# validate function tests password string for complexity: 
# to ensure exit code I'm using echo insted of plain checks so that exit codes will return upon each check.
validate (){ 
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

validate $1

printf "${Green}success${NC}password is secured\n"
exit 0