
#! /bin/bash

## DESCRIPTION: a simple password validator script to check password complexity.
## FEATURE: add an -f flag with a password inside a file to check all passwords in the file.
## AUTHOR: Jonathan Moguillansky- https://www.johnmogi.com

min_length=9
# colors for terminal messages:
Red='\033[0;31m'        # Red 
Green='\033[0;32m'      # Green
NC='\033[0m '           # No Color

validate (){ 

# exit the program if no argument supplied or the argument lenght is less than the minimum length:
if [ ${#1} -lt $min_length ]; then
printf "${Red}Try again... \nPassword on file is too short, there should be at least $min_length characters${NC}\n"
exit 1;
fi
# check for at least one digit:
if ! [[ $1 =~ [[:digit:]] ]]; 
then
    printf "${Red}Try again... \nPassword must contain at least one number${NC}\n"
    exit 1;
# check for at least one uppercase letter:
elif ! [[ $1 =~ [A-Z]  ]]; 
then
    printf "${Red}Try again... \nPassword must contain at least one capital letter${NC}\n"
    exit 1;
# check for at least one lowercase letter:
elif ! [[ $1 =~ [a-z]  ]]; 
then
    printf "${Red}Try again... \nPassword must contain at least one small letter${NC}\n"
    exit 1;
fi
}    




# check if the -f flag is set, if it does, run validate on password file.
# exit the program if no argument supplied
case $1 in
"-f" )


while getopts "f:" OPTION; do
        case "$OPTION" in
                f)
                PASSWORD=$(cat "$OPTARG")
                validate $PASSWORD
                ;;
                \?)
                printf "${Red} Please specify a filepath along the -f <'./filepath>${NC}\n"
                exit 1
                ;;

        esac
done

;;
*)
validate $1
;;
esac 

printf "${Green}success:${NC}password is secure\n"
exit 0