import sys
from colorama import Fore
from colorama import Style

min_length=2
p1 =  str(sys.argv[1])

if len(p1) < min_length:
    printf('Try again... \nPassword on file is too short, there should be at least ${min_length} characters')
# else:
#     print('the password is ok')


print(f"The password {Fore.GREEN}is ok{Style.RESET_ALL}!")

# if min_length <