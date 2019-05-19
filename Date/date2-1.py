import datetime
import time
b=0
lpy1 = 1
c = 0
d = 0
years = int(datetime.datetime.now().strftime('%Y'))
while (lpy1 != years):
    if (lpy1 % 4) == 0:
        if (lpy1 % 100) ==0:
            if (lpy1 % 400) ==0:
                b = b+1
                lpy1 = lpy1+1
            else:
                lpy1 = lpy1+1
        else:
            b = b+1
            lpy1 = lpy1+1
    else:
        lpy1 = lpy1+1
months1 = int(datetime.datetime.now().strftime('%m'))
if (months1 ==1):
    c = 0
if (months1 == 2):
    c = 31
if (months1 ==3):
    c = 59
if (months1 ==4):
    c = 90
if (months1 ==5):
    c = 120
if (months1 ==6):
    c = 151
if (months1 ==7):
    c = 181
if (months1 ==8):
    c = 212
if (months1 ==9):
    c = 242
if (months1 ==10):
    c = 273
if (months1 ==11):
    c = 304
if (months1 ==12):
    c = 334
        
    
    
    
months = int(datetime.datetime.now().strftime('%m'))+12*years
days = int(datetime.datetime.now().strftime('%d'))+365*years+c +b
hours = int(datetime.datetime.now().strftime('%H'))+24*days
minutes = int(datetime.datetime.now().strftime('%M'))+60*hours
seconds = int(datetime.datetime.now().strftime('%S'))+60*minutes
print ('Birthdate:')
yr = int(input('Enter year: '))
a=0
lpy = 0
#leap year detection
while (lpy != yr):
    if (lpy % 4) == 0:
        if (lpy % 100) ==0:
            if (lpy % 400) ==0:
                a = a+1
                lpy = lpy+1
            else:
                lpy = lpy+1
        else:
            a = a+1
            lpy = lpy+1
    else:
        lpy = lpy+1

m1 = int(input('Enter month: '))
if (m1 ==1):
    d = 0
if (m1 == 2):
    d = 31
if (m1 ==3):
    d = 59
if (m1 ==4):
    d = 90
if (m1 ==5):
    d = 120
if (m1 ==6):
    d = 151
if (m1 ==7):
    d = 181
if (m1 ==8):
    d = 212
if (m1 ==9):
    d = 242
if (m1 ==10):
    d = 273
if (m1 ==11):
    d = 304
if (m1 ==12):
    d = 334
        
m = m1 +12*yr
day = int(input('Enter day: ')) +365*yr +d+ a
h = int(input('Enter hour: ')) +24*day
mi = int(input('Enter minute: ')) +60*h
sec = int(input('Enter second: ')) +60*mi
y2 = years - yr-1
print ('Age:')
print ('Millenia: ' + str(y2/1000))
print ('Centuries: ' + str(y2/100))
print ('Decades: ' + str(y2 /10))
print ('Years: ' + str(y2))
print ('Months: ' + str(months - m))
print ('Days: ' + str(days - day))
print ('Hours: ' + str(hours - h))
print ('Minutes: ' + str(minutes - mi))
print ('Seconds: ' + str(seconds - sec))

