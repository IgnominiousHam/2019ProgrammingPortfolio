#overall entry pt.
#by Bryce Crouse
#create vars
#all of the "changes" things should start with the starting x/y value of their respective turtles
#4/30/19 Bryce redid line drawing functionality
#5/2/19 added line colors, fixed bugs. Death & start screens, edge detection, & most turtle logic by Spencer H, lightcycles by Addison P.
y1Changes= [200]
x1Changes= [200]
y2Changes= [-200]
x2Changes= [-200]

#import stuff:
from tkinter import *
from turtle import *
from random import *
bikeSpeed = 2
root = Tk()
canvas = Canvas(master = root, width = 900, height = 900)
canvas.pack()
m = 1
startScreen = 1
running = 1
p1Lives = 3
p2Lives = 3
def spawnPowerUp():
    
    pu = RawTurtle(canvas)
    pu.shape('circle')
    ypu = randint(-250,250)
    xpu = randint(-250,250)
    pu.penup()
    pu.setx(xpu)
    pu.sety(ypu)
def start(event):
    global startScreen
    if (startScreen == 1):
        global m
        m = 0
        startScreen = 0
        global running1
        running = 0
        canvas.delete("all")
root.bind('<t>',start)
#starting screen by Spencer Hamilton, implemented by Bryce


while m == 1:
    p3 = RawTurtle(canvas)
    p3.hideturtle()
    p3.color('blue')
    p4 = RawTurtle(canvas)
    p4.hideturtle()
    p4.color('orange')

    while startScreen == 1:
        if(running == 0):
            canvas.delete("all")
            break
        p4.speed(20)
        p3.speed(20)
        zz = randint(0,4)
        yy = randint(0,4)
        canvas.create_text(0,-100,fill = 'red', font = 'Calibri 30 bold', text = 'TRON')
        canvas.create_text(0,100,fill = 'black',font = 'Arial 15 bold',text = 'Press t to start.')
        if zz == 1:
            zzzz = randint(0,50)
            p3.seth(0)
            p3.forward(zzzz)
        if zz == 2:
            zzzzz = randint(0,50)
            p3.seth(90)
            p3.forward(zzzzz)
        if zz == 3:
            zzzzzz = randint(0,50)
            p3.seth(180)
            p3.forward(zzzzzz)
        if zz == 4:
            zzzzzzz = randint(0,50)
            p3.seth(270)
            p3.forward(zzzzzzz)
        if int(p3.ycor()) > 250:
            p3.seth(270)
            p3.forward(100)
        if int(p3.ycor()) < -250:
            p3.seth(90)
            p3.forward(100)
        if int(p3.xcor()) > 250:
            p3.seth(180)
            p3.forward(100)
        if int(p3.xcor()) < -250:
            p3.seth(0)
            p3.forward(100)
        if yy == 1:
            zzzz = randint(0,50)
            p4.seth(0)
            p4.forward(zzzz)
        if yy == 2:
            zzzzz = randint(0,50)
            p4.seth(90)
            p4.forward(zzzzz)
        if yy == 3:
            zzzzzz = randint(0,50)
            p4.seth(180)
            p4.forward(zzzzzz)
        if yy == 4:
            zzzzzzz = randint(0,50)
            p4.seth(270)
            p4.forward(zzzzzzz)
        if int(p4.ycor()) > 250:
            p4.seth(270)
            p4.forward(100)
        if int(p4.ycor()) < -250:
            p4.seth(90)
            p4.forward(100)
        if int(p4.xcor()) > 250:
            p4.seth(180)
            p4.forward(100)
        if int(p4.xcor()) < -250:
            p4.seth(0)
            p4.forward(100)
def createCycles():
    global x
    global y
    global points
    global points2
    global light1
    global cycle1
    global light2
    global cycle2
    global p1trail
    global p2trail
    x = p1.xcor()
    y = -(p1.ycor())
    #this part instantiates the lightcycles

    points = [(x-10),(y-10),(x+10),(y-10),(x+2),(y-4),(x+2),(y+10),(x-2),(y+10),(x-2),(y-4)]
    points2 = [(x-7),(y-7),(x+8),(y-7),(x+8),(y),(x+5),(y+7),(x-4),(y+7),(x-7),(y)]
    light1 = canvas.create_polygon(points2, fill='#60a6f7')
    cycle1 = canvas.create_polygon(points, outline='#60a6f7', fill='black')
    light2 = canvas.create_polygon(points2, fill='orange')
    cycle2 = canvas.create_polygon(points, outline='#60a6f7', fill='black')
    p1trail = canvas.create_polygon(p1.xcor(),p1.ycor(),100,100,outline='blue')
    p2trail = canvas.create_polygon(p2.xcor(),p2.ycor(),-100,-100,outline='orange')
def resetScreen():
    canvas.delete("all")
    canvas.configure(bg='white')
    global p1
    p1 = RawTurtle(canvas)
    global p2
    p2 = RawTurtle(canvas)
    p1.hideturtle()
    p2.hideturtle()
    p1.penup()
    p2.penup()
    p1.setposition(100,100)
    p2.setposition(-100,-100)
    global true
    true = 100
    p2.left(180)
    global true2
    true2=100
    global y1Changes
    global y2Changes
    global x1Changes
    global x2Changes
    y1Changes.clear()
    y2Changes.clear()
    x1Changes.clear()
    x2Changes.clear()
    y1Changes= [100]
    x1Changes= [100]
    y2Changes= [-100]
    x2Changes= [-100]
    canvas.create_text(-190,-190,fill = 'blue',font = 'Arial 13 bold',text = "Player 1 Lives: " + str(p1Lives))
    canvas.create_text(-190,-180,fill = 'orange',font = 'Arial 13 bold',text = "Player 2 Lives: " + str(p2Lives))
    createCycles()
    #create map 1
    canvas.create_line(450-80, 450-360, 450-80, 450-80, 450-360, 450-80, fill='black')
    canvas.create_line(450-540, 450-80, 450-810, 450-80, 450-810, 450-360, fill='black')
    canvas.create_line(450-80, 450-540, 450-80, 450-810, 450-360, 450-810, fill='black')
    canvas.create_line(450-540, 450-810, 450-810, 450-810, 450-810, 450-540, fill='black')
    canvas.create_line(450-400, 450-400, 450-500, 450-400, 450-500, 450-500, 450-400,450- 500,450- 400,450- 400, fill='black')
resetScreen()




#grid/collision logic by Bryce Crouse
#works by recording the coordinates at which the players turn, and then
#checks if players cross "lines" between those points

def changeDir():
    y1Changes.append(p1.ycor())
    x1Changes.append(p1.xcor())
    canvas.create_polygon(p1.xcor(),-p1.ycor(),x1Changes[len(x1Changes)-2],-y1Changes[len(y1Changes)-2],outline='blue')

def changeDir2():
    y2Changes.append(p2.ycor())
    x2Changes.append(p2.xcor())
    canvas.create_polygon(p2.xcor(),-p2.ycor(),x2Changes[len(x2Changes)-2],-y2Changes[len(y2Changes)-2],outline='orange')

#check collision:
def refreshCol():
    display()
    i = 0
    #col detection for p1
    while i < (len(y1Changes)-1):
        checkCol(x1Changes[i], y1Changes[i], x1Changes[i+1], y1Changes[i+1])
        
        i = i + 1
        
    i = 0
    while i < len(y2Changes):
        if (i == len(y2Changes)-1):
            checkCol(p2.xcor(), p2.ycor(), x2Changes[i], y2Changes[i])
        else:
            checkCol(x2Changes[i], y2Changes[i], x2Changes[i+1], y2Changes[i+1])
        i = i + 1
    i = 0
    #col detection for p2
    while i < len(y2Changes)-1:
        checkCol2(x2Changes[i], y2Changes[i], x2Changes[i+1], y2Changes[i+1])
        i = i + 1
    i = 0
    while i < len(y1Changes):
        if (i == len(y1Changes)-1):
            checkCol2(p1.xcor(), p1.ycor(), x1Changes[i], y1Changes[i])
        else:
            checkCol2(x1Changes[i], y1Changes[i], x1Changes[i+1], y1Changes[i+1])
        i = i + 1
def die1():
    canvas.configure(bg ='black')
    canvas.create_text(0,0,fill = 'white',font = 'Arial 20 bold',text = 'Player 1 is dead.')
    global p1Lives
    p1Lives -= 1
    resetScreen()
def die2():
    canvas.configure(bg ='black')
    canvas.create_text(0,0,fill = 'white',font = 'Arial 20 bold',text = 'Player 2 is dead.')
    global p2Lives
    p2Lives -= 1
    resetScreen()
    #edge detection by Spencer Hamilton, implemented by Bryce
def edgeDetect():
    x = p1.xcor()
    y = p1.ycor()
    x1 = p2.xcor()
    y1 = p2.ycor()
    if (x>450) or (x<-450) or (y>450) or (y<-450):
        die1()
    if (x1>450) or (x1<-450) or (y1>450) or (y1<-450):
        die2()
    if (x==370) and ((y<-90) or (y>90)) and (y<370) and (y>-370):
        die1()
    if (x1==370) and ((y1<-90) or (y1>90)) and (y1<370) and (y1>-370):
        die2()
    if (x==-370) and ((y<-90) or (y>90)) and (y<370) and (y>-370):
        die1()
    if (x1==-370) and ((y1<-90) or (y1>90)) and (y1<370) and (y1>-370):
        die2()
    if (y==370) and ((x<-90) or (x>90)) and (x<370) and (x>-370):
        die1()
    if (y1==370) and ((x1<-90) or (x1>90)) and (x1<370) and (x1>-370):
        die2()
    if (y==-370) and ((x<-90) or (x>90)) and (x<370) and (x>-370):
        die1()
    if (y1==-370) and ((x1<-90) or (x1>90)) and (x1<370) and (x1>-370):
        die2()
    if ((x==50)or(x==-50)) and ((y>-50) and (y<50)):
        die1()
    if ((x1==50)or(x1==-50)) and ((y1>-50) and (y1<50)):
        die2()
    if ((y==50) or (y ==-50)) and ((x>-50) and (x<50)):
        die1()
    if ((y1==50) or (y1 ==-50)) and ((x1>-50) and (x1<50)):
        die2()
def checkCol(x1, y1, x2, y2):
    edgeDetect()
    if (y1 <= p1.ycor() <= y2 or y2 <= p1.ycor() <= y1):
        if (x1 <= p1.xcor() <= x2 or x2 <= p1.xcor() <= x1):
            #death screens by Spencer Hamilton
            die1()
    
def checkCol2(x1, y1, x2, y2):
    edgeDetect()
    if (y1 <= p2.ycor() <= y2 or y2 <= p2.ycor() <= y1):
        if (x1 <= p2.xcor() <= x2 or x2 <= p2.xcor() <= x1):
            die2()
#key stuff
def key(event):
    msg = event.char

    while true == 100:
        p1.speed(5)
        p1.forward (bikeSpeed)
        p2.speed(5)
        p2.forward (bikeSpeed)
        refreshCol()
        if (msg == 'w'):
            p1.seth(90)
            msg = 'x'
            changeDir()
        if (msg == 'a'):
            p1.seth(180)
            msg = 'x'
            changeDir()
        if (msg == 's'):
            p1.seth(270)
            changeDir()
            msg = 'x'
        if (msg == 'd'):
            p1.seth(0)
            msg = 'x'
            changeDir()
        
    #edge detection by Spencer Hamilton:
    
def leftkey(event):
    changeDir2()
    while true2 == 100:
        p1.speed(5)
        p1.forward (bikeSpeed)
        p2.speed(5)
        p2.seth(180)
        p2.forward (bikeSpeed)
        refreshCol()

def rightkey(event):
    changeDir2()
    while true2 == 100:
        p1.speed(5)
        p1.forward (bikeSpeed)
        p2.speed(5)
        p2.seth(0)
        p2.forward(bikeSpeed)

        refreshCol()

def upkey(event):
    changeDir2()
    while true2 == 100:
        p1.speed(5)
        p1.forward (bikeSpeed)
        p2.speed(5)
        p2.seth(90)
        p2.forward (bikeSpeed)

        refreshCol()

def downkey(event):
    changeDir2()
    while true2 == 100:
        p1.speed(5)
        p1.forward (bikeSpeed)
        p2.speed(5)
        p2.seth(270)
        p2.forward (bikeSpeed)
        refreshCol()



#lightcycle by Addison Powell
#Implimented by Bryce

createCycles()
def faceDown(x,y):
    points = [(x-10),(y-10),(x+10),(y-10),(x+2),(y-4),(x+2),(y+10),(x-2),(y+10),(x-2),(y-4)]
    points2 = [(x-7),(y-7),(x+8),(y-7),(x+8),(y),(x+5),(y+7),(x-4),(y+7),(x-7),(y)]
    canvas.coords(light1, points)
    canvas.coords(cycle1, points2)
def faceUp(x,y):
    points = [(x-10),(y+10),(x+10),(y+10),(x+2),(y+4),(x+2),(y-10),(x-2),(y-10),(x-2),(y+4)]
    points2 = [(x-7),(y+7),(x+8),(y+7),(x+8),(y),(x+5),(y-7),(x-4),(y-7),(x-7),(y)]
    canvas.coords(light1, points)
    canvas.coords(cycle1, points2)
def faceRight(x,y):
    points = [(x-10),(y-10),(x-10),(y+10),(x-4),(y+2),(x+10),(y+2),(x+10),(y-2),(x-4),(y-2)]
    points2 = [(x-7),(y-7),(x-7),(y+8),(x),(y+8),(x+7),(y+5),(x+7),(y-4),(x),(y-7)]
    canvas.coords(light1, points)
    canvas.coords(cycle1, points2)
def faceLeft(x,y):
    points = [(x+10),(y-10),(x+10),(y+10),(x+4),(y+2),(x-10),(y+2),(x-10),(y-2),(x+4),(y-2)]
    points2 = [(x+7),(y-7),(x+7),(y+8),(x),(y+8),(x-7),(y+5),(x-7),(y-4),(x),(y-7)]
    canvas.coords(light1, points)
    canvas.coords(cycle1, points2)
def faceDown2(x,y):
    points = [(x-10),(y-10),(x+10),(y-10),(x+2),(y-4),(x+2),(y+10),(x-2),(y+10),(x-2),(y-4)]
    points2 = [(x-7),(y-7),(x+8),(y-7),(x+8),(y),(x+5),(y+7),(x-4),(y+7),(x-7),(y)]
    canvas.coords(light2, points)
    canvas.coords(cycle2, points2)
def faceUp2(x,y):
    points = [(x-10),(y+10),(x+10),(y+10),(x+2),(y+4),(x+2),(y-10),(x-2),(y-10),(x-2),(y+4)]
    points2 = [(x-7),(y+7),(x+8),(y+7),(x+8),(y),(x+5),(y-7),(x-4),(y-7),(x-7),(y)]
    canvas.coords(light2, points)
    canvas.coords(cycle2, points2)
def faceRight2(x,y):
    points = [(x-10),(y-10),(x-10),(y+10),(x-4),(y+2),(x+10),(y+2),(x+10),(y-2),(x-4),(y-2)]
    points2 = [(x-7),(y-7),(x-7),(y+8),(x),(y+8),(x+7),(y+5),(x+7),(y-4),(x),(y-7)]
    canvas.coords(light2, points)
    canvas.coords(cycle2, points2)
def faceLeft2(x,y):
    points = [(x+10),(y-10),(x+10),(y+10),(x+4),(y+2),(x-10),(y+2),(x-10),(y-2),(x+4),(y-2)]
    points2 = [(x+7),(y-7),(x+7),(y+8),(x),(y+8),(x-7),(y+5),(x-7),(y-4),(x),(y-7)]
    canvas.coords(light2, points)
    canvas.coords(cycle2, points2)
def displayLightCycle1():
    
    x = p1.xcor()
    y = -(p1.ycor())
    if (p1.heading() == 0):
        faceRight(x,y)
    elif (p1.heading() == 90):
        faceUp(x,y)
    elif (p1.heading() == 180):
        faceLeft(x,y)
    elif (p1.heading() == 270):
        faceDown(x,y)


    
def displayLightCycle2():
    x = p2.xcor()
    y = -(p2.ycor())
    if (p2.heading() == 0):
        faceRight2(x,y)
    elif (p2.heading()== 90):
        faceUp2(x,y)
    elif (p2.heading() == 180):
        faceLeft2(x,y)
    elif (p2.heading() == 270):
        faceDown2(x,y)

def display():
    displayLightCycle1()
    displayLightCycle2()
    canvas.coords(p1trail,p1.xcor(),-p1.ycor(),x1Changes[len(x1Changes)-1],-y1Changes[len(y1Changes)-1])
    canvas.coords(p2trail,p2.xcor(),-p2.ycor(),x2Changes[len(x2Changes)-1],-y2Changes[len(y2Changes)-1])

root.bind_all('<Key>', key)
root.bind('<Left>', leftkey)
root.bind('<Right>', rightkey)
root.bind('<Up>', upkey)
root.bind('<Down>', downkey)
refreshCol()
root.mainloop()
