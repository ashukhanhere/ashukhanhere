from lib import response
import mechanize
import os
from time import sleep
import datetime
import sys
browser = mechanize.Browser()
browser.set_handle_robots(False)
cookies = mechanize.CookieJar()
browser.set_cookiejar(cookies)
browser.addheaders = [('User-agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.76 Safari/537.36')]
browser.set_handle_refresh(False)

url = 'https://m.facebook.com/login.php'

def clear():
    if os.name == 'nt':
        os.system('cls')
    else:
        os.system('clear')
        
def sp(stri):
    for letter in stri:
        print(letter, end = "")
        sys.stdout.flush()
        sleep(0.01)
        
clear()

def login():
    browser.open(url)
    browser.select_form(nr = 0)
    browser.form['email'] = ASHUKHAN
    browser.form['pass'] = ASHU786
    r = browser.submit()
    f = open("login.html", "wb")
    f.write(r.read())
    f.close()
    browser.select_form(nr = 0)
    print("\033[1;33;40m", end = "")
    sp("\nEnter two factor code by google authenticator :\n")
    print("\033[1;37;40m")
    apr = str(input())
    print()
    try:
        browser.form['approvals_code'] = apr
    except mechanize._form_controls.ControlNotFoundError:
        print("Wrong password or some shit, check generated file")
        f = open("epage_" + str(ASHUKHAN) + ".html", "wb")
        f.write(r.read())
        f.close()
        exit(1)
    r = browser.submit()
    browser.select_form(nr = 0)
    try:
        browser.form['name_action_selected'] = ['save_device']
    except mechanize._form_controls.ControlNotFoundError:
        print("Some shit gone down, check generated file")
        f = open("epage_" + str(ASHUKHAN) + ".html", "wb")
        f.write(r.read())
        f.close()
        exit(1)
    r = browser.submit()
    f = open("full_login_" + str() + ".html", "wb")
    f.write(r.read())
    f.close()

def findfbchat(curl):
    r = browser.open(curl)
    x = browser.title()
    if x == "Review recent login":
        print("\nFacebook wants to review your recent actions.\nPlease fix that and then re run the program.")
        exit(1)
    if x == "Login approval needed":
        print("\nYour account is stuck on verification\nPlease do it and then re run the program.")
        exit(1)
    if x == "Epsilon":
        print("\nYour account got locked, recover it kindly and re run the script.")
        exit(1)

def sendtextchat(comment):
    try:
        browser.select_form(nr = 1)
    except mechanize._mechanize.FormNotFoundError:
        print("\033[1;31;40m", end="")
        print("»»", comment, "\n")
    try:
        browser.form['body'] = comment
    except mechanize._form_controls.ControlNotFoundError:
        print("\033[1;31;40m", end="")
        print("»»", comment, "\n")
    r = browser.submit()
    print("\033[1;32;40m", end = "")
    e = datetime.datetime.now()
    print (e.strftime("»» %d/%m/%Y   %I:%M:%S %p"))
    print("»»", comment, "\n")
 
print("\033[1;33;40m", end = "")
sp("\nEnter your email or mob no.. :\n")
print("\033[1;37;40m")
USERNAME = str(input())
print("\033[1;33;40m", end = "")
sp("\nEnter your password :\n")
print("\033[1;37;40m")
PASSWORD = str(input())
login()
print("\033[1;33;40m", end = "")
sp("Enter the person id. whose sister you want to fuck :\n")
print("\033[1;37;40m")
cid = str(input())
curl = 'https://m.facebook.com/messages/t/' + str(cid)

print()
print("\033[1;33;40m", end = "")
sp("Enter notepad file :\n")
print("\033[1;37;40m")
np = str(input())
f = open(np, 'r')
lines = f.readlines()
f.close()
print()
print("\033[1;33;40m", end = "")
sp("Enter time delay in seconds :\n")
print("\033[1;37;40m")
t = int(input())

clear()
print("\033[1;35;40m", end = "")
print("This will run till your phone dies, but to be on safe side, please re - run the program after some days to avoid memory shortage of your phone. To quit it press CTRL + C\n")
print("\033[0;37;41m")
print("‎-CODED BY ASHU KHAN-\n")
print("\033[1;37;40m")
e = datetime.datetime.now()
print(e.strftime("Start Time = %d/%m/%Y   %I:%M:%S %p"))
print()
count = 0
while True:
    for line in lines:
        if len(line) > 0:
            if count != 0:
                sleep(t)
            findfbchat(curl)
            sendtextchat(line)
            count += 1
            if count % 50 == 0:
                sleep(1)
                clear()
