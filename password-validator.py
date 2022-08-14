import sys
from colorama import Fore
from colorama import Style

min_length=10
p1 =  str(sys.argv[1])

if len(p1) < min_length:
    print(f'Try again... \n {Fore.RED}Password on file is too short,{Style.RESET_ALL} there should be at least {min_length} characters')
    exit(1)

def validate(param):
    a = any(chr.isdigit() for chr in param)
    b = any(chr.islower() for chr in param)
    c = any(chr.isupper() for chr in param)

    if a != True:
        print(f'Try again... \n {Fore.RED}Password must contain at least one number{Style.RESET_ALL}')
        exit(1)
    if b != True:
        print(f'Try again... \n {Fore.RED}Password must contain at least one small letter{Style.RESET_ALL}')
        exit(1)
    if c != True:
        print(f'Try again... \n {Fore.RED}Password must contain at least one capital letter{Style.RESET_ALL}')
        exit(1)

validate(p1)

print(f'success: \n {Fore.GREEN} password is secure{Style.RESET_ALL} ')
