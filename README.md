# password-validator

## Sela Devops week 2 project submission:

<h1>Password validation script using bash.</h1>

<a href="https://www.youtube.com/watch?v=CbTpxKKyyNg" target="_blank">
Come see a short video describing this project :

[![IMAGE ALT TEXT](http://img.youtube.com/vi/CbTpxKKyyNg/0.jpg)](https://www.youtube.com/watch?v=CbTpxKKyyNg" "Portfolio Video #1 : Password Validator Project
")

</a>
<br/>
<p>successfull demonstration of the project running on the terminal in bash: </p> <br/>

![validation](password_validator1.png?raw=true?style=centerme "passed validation")

<h3>how to run this script:</h3>

1. git clone this link into a new folder:
   git clone https://github.com/johnmogi/password.git
2. from the terminal on folder run the script in the following manner:
   ./password-validator.sh

the return message should look like:
Try again...
Password on file is too short, there should be at least 9 characters

3. supply an argument to the validation, example:
   ./password-validator.sh 123456789

now the return message should look like:
Try again...
Password must contain at least one capital letter

4. repeat validation attempts until all checks pass

## additional info:

a password validation script-
the script will be supplied with an argument - the password.
that argument will be checked for complexity:
small letters, capital, numbers and minimum lengh (10)
// using echo $? to validate the exit status codes.

added branches:
Password validation using bash.
[feature] branch - same script with the anbility to retrieve password from a file.
[powershell] branch - same script for powershell

Cheers... john.

“Intelligence is the ability to avoid doing work, yet getting the work done.” ... Linus Torvalds

![my_devops](my_devops.jpg?raw=true?style=centerme "draw by John")
