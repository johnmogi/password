import sys
from colorama import Fore
from colorama import Style

min_length=2
p1 =  str(sys.argv[1])

if len(p1) < min_length:
    print(f'Try again... \n {Fore.RED}Password on file is too short,{Style.RESET_ALL} there should be at least {min_length} characters')

def validate(param):
    a = any(chr.isdigit() for chr in param)
    if a:
        print(a)

validate(p1)

print(f'success: \n {Fore.GREEN} password is secure{Style.RESET_ALL} ')



# if min_length <