# password-validator - feature branch

Wellcome to the feature branch.

on this branch we add the -f option for a file 

![feature](feature.png?raw=true?style=centerme "feature passed validation")

this means that you add a file to the same folder and in this txt file for instance-
a check on the content is being made.

for example - the attached demo.txt file has a mock password:
Sample-pass1

feel free to update it with any desired password.


## fix after review:

- changed code from using switch case passing the variable in argument 2 from -f to getopst.
old code looked like this:
<pre>
# check if the -f flag is set, if it does, run validate on password file.
# exit the program if no argument supplied
case $1 in
"-f" )
file=$2
## crucial bug fix below:
{# password_from_file=$(<$2) not working on some tests! trying the following instead of getopts:}
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
</pre>
- made sure the same validation goes for both the supplied file and the initial argument.

