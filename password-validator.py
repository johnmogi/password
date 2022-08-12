import sys
from colorama import Fore
from colorama import Style

min_length=2
p1 =  str(sys.argv[1])

if len(p1) < min_length:
    print('the password is too short')
# else:
#     print('the password is ok')


print(f"The password {Fore.GREEN}is ok{Style.RESET_ALL}!")

# if min_length <