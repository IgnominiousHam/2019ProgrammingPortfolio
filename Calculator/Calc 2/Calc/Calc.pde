Button[] numBtns = new Button[10];
Button[] opBtns = new Button[13];
String value, lValue, rValue;
char opVal;
float result;
boolean firstNum, dec;

void setup () {
  size (500, 500);
  numBtns[0] = new Button(60, 440, 40, 40, color(#FF270F)).asNumber(0);
  numBtns[1] = new Button(60, 360, 40, 40, color(#FF270F)).asNumber(1);
  numBtns[2] = new Button(140, 360, 40, 40, color(#FF270F)).asNumber(2);
  numBtns[3] = new Button(220, 360, 40, 40, color(#FF270F)).asNumber(3);
  numBtns[4] = new Button(60, 280, 40, 40, color(#FF270F)).asNumber(4);
  numBtns[5] = new Button(140, 280, 40, 40, color(#FF270F)).asNumber(5);
  numBtns[6] = new Button(220, 280, 40, 40, color(#FF270F)).asNumber(6);
  numBtns[7] = new Button(60, 200, 40, 40, color(#FF270F)).asNumber(7);
  numBtns[8] = new Button(140, 200, 40, 40, color(#FF270F)).asNumber(8);
  numBtns[9] = new Button(220, 200, 40, 40, color(#FF270F)).asNumber(9);
  opBtns[0] = new Button(220, 440, 40, 40, color(#F6FA44)).asOperator("+/-");
  opBtns[1] = new Button(140, 440, 40, 40, color(#FF270F)).asDecimal(".");
  opBtns[2] = new Button(290, 440, 60, 40, color(#F644FA)).asOperator("√");
  opBtns[3] = new Button(290, 360, 60, 40, color(#F644FA)).asOperator("tan(x)");
  opBtns[4] = new Button(290, 280, 60, 40, color(#F644FA)).asOperator("cos(x)");
  opBtns[5] = new Button(290, 200, 60, 40, color(#F644FA)).asOperator("sin(x)");
  opBtns[6] = new Button(410, 195, 140, 30, color(#44FA67)).asRect("CE");
  opBtns[7] = new Button(370, 250, 60, 60, color(#F1CBFF)).asRect("x");
  opBtns[8] = new Button(450, 250, 60, 60, color(#F1CBFF)).asRect("÷");
  opBtns[9] = new Button(370, 320, 60, 60, color(#F1CBFF)).asRect("+");
  opBtns[10] = new Button(450, 320, 60, 60, color(#F1CBFF)).asRect("-");
  opBtns[11] = new Button(410, 375, 140, 30, color(#7F9BFC)).asRect("%");
  opBtns[12] = new Button(410, 430, 140, 60, color(#FFC800)).asRect("=");
  value = "0.0";
  lValue = "";
  rValue = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  dec = false;
}
void draw() {
  //noStroke();
  background(#29E8FF);
  textSize(12);
  for (int i=0; i<numBtns.length; i++) {
    numBtns[i].display();
    numBtns[i].hover();
  }
  for (int i=0; i<opBtns.length; i++) {
    opBtns[i].display();
    opBtns[i].hover();
  }
  updateDisplay();
}

void updateDisplay() {
  fill(#C1C1C1);
  rect(250, 100, 460, 80, 5);
  fill(0); 
  text("Created by Spencer Hamilton", 250, 40);
  textSize(21);
  text(value, 250, 100);
}

void mouseReleased () {
  for (int i=0; i<numBtns.length; i++) {
    if (numBtns[i].hover) {
      if (firstNum) {
        lValue += str(numBtns[i].v);
        value = lValue;
      } else {
        rValue += str(numBtns[i].v);
        value = rValue;
      }
    }
  }
  for (int i=0; i<opBtns.length; i++) {
    if (opBtns[i].hover) {
      if (opBtns[i].op == "+") {
        opVal = '+';
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "-") {
        opVal = '-';
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "x") {
        opVal = 'x';
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "÷") {
        opVal = '÷';
        firstNum = false;
        dec = false;
      } else if (opBtns[i].op == "+/-") {
        if (firstNum) {
          lValue = str(float(lValue) * -1);
          value = lValue;
        } else {
          rValue = str(float(rValue) * -1);
          value = rValue;
        }
      } else if (opBtns[i].op == "=") {
        performCalc();
      } else if (opBtns[i].op == "CE") {
        clearButton();
      } else if (opBtns[i].op == ".") {
        if (!dec) {
          if (firstNum) {
            lValue += opBtns[i].op;
            value = lValue;
            dec = true;
          } else {
            rValue += opBtns[i].op;
            value = rValue;
            dec = true;
          }
        }
      } else if (opBtns[i].op == "√") {
        if (firstNum) {
          lValue = str(sqrt(float(lValue)));
          value = lValue;
          firstNum = false;
          dec = false;
        } else {
          rValue = str(sqrt(float(rValue)));
          value = rValue;
          firstNum = false;
          dec = false;
        }
      } else if (opBtns[i].op == "sin(x)") {
        if (firstNum) {
          lValue = str(sin(float(lValue)));
          value = lValue;
          firstNum = false;
          dec = false;
        } else {
          rValue = str(sin(float(rValue)));
          value = rValue;
          firstNum = false;
          dec = false;
        }
      } else if (opBtns[i].op == "cos(x)") {
        if (firstNum) {
          lValue = str(cos(float(lValue)));
          value = lValue;
          firstNum = false;
          dec = false;
        } else {
          rValue = str(cos(float(rValue)));
          value = rValue;
          firstNum = false;
          dec = false;
        }
      } else if (opBtns[i].op == "tan(x)") {
        if (firstNum) {
          lValue = str(tan(float(lValue)));
          value = lValue;
          firstNum = false;
          dec = false;
        } else {
          rValue = str(tan(float(rValue)));
          value = rValue;
          firstNum = false;
          dec = false;
        }
      } else if (opBtns[i].op == "%") {
        if (firstNum) {
          lValue = str(float(lValue) * 0.01);
          value = lValue;
          firstNum = false;
          dec = false;
        } else {
          rValue = str(float(rValue)*0.01);
          value = rValue;
          firstNum = false;
          dec = false;
        }
      }
    }
  }
}


void performCalc() {
  if (opVal == '+') {
    result = float (lValue) + float (rValue);
    value = str(result);
  } else  if (opVal == '-') {
    result = float (lValue) - float (rValue);
    value = str(result);
  } else  if (opVal == 'x') {
    result = float (lValue) * float (rValue);
    value = str(result);
  } else  if (opVal == '÷') {
    result = float (lValue) / float (rValue);
    value = str(result);
  } 
  lValue = "";
  rValue = "";
  dec = false;
  firstNum = true;
  lValue = value;
  firstNum = false;
}

void clearButton() {
  value = "0.0";
  lValue = "";
  rValue = "";
  opVal = ' ';
  result = 0.0;
  firstNum = true;
  dec = false;
}

void keyPressed() {
  if (key == '1') {
    handleKeyPress(true, false, "1");
  } else if (key == '2') {
    handleKeyPress(true, false, "2");
  } else if (key == '3') {
    handleKeyPress(true, false, "3");
  } else if (key == '4') {
    handleKeyPress(true, false, "4");
  } else if (key == '5') {
    handleKeyPress(true, false, "5");
  } else if (key == '6') {
    handleKeyPress(true, false, "6");
  } else if (key == '7') {
    handleKeyPress(true, false, "7");
  } else if (key == '8') {
    handleKeyPress(true, false, "8");
  } else if (key == '9') {
    handleKeyPress(true, false, "9");
  } else if (key == '+') {
    handleKeyPress(false, false, "+");
  } else if (key == '-') {
    handleKeyPress(false, false, "-");
  } else if (key == 'x') {
    handleKeyPress(false, false, "x");
  } else if (key == '/') {
    handleKeyPress(false, false, "÷");
  } else if (key == ENTER) {
    handleKeyPress(false, false, "=");
  } else if (key == '0') {
    handleKeyPress(true, false, "0");
  } else if (key == BACKSPACE) {
    handleKeyPress(false, false, "CE");
  } else if (key == '.') {
    handleKeyPress(false, true, ".");
  }
}

void handleKeyPress(boolean num, boolean deci, String val) {
  if (!deci) {
    if (num) {
      if (firstNum) {
        lValue += val;
        value = lValue;
      } else {
        rValue += val;
        value = rValue;
      }
    } else {
      if (val == "+") {
        opVal = '+';
        firstNum = false;
        dec = false;
      } else if (val == "-") {
        opVal = '-';
        firstNum = false;
        dec = false;
      } else if (val == "x") {
        opVal = 'x';
        firstNum = false;
        dec = false;
      } else if (val == "/") {
        opVal = '÷';
        firstNum = false;
        dec = false;
      } else if (val == "=") {
        performCalc();
        firstNum = false;
        dec = false;
      } else if (val == "CE") {
        clearButton();
        firstNum = false;
        dec = false;
      }
      lValue = "";
      rValue = "";
      dec = false;
      firstNum = true;
      lValue = value;
      firstNum = false;
    }
  } else {
    if (val == ".") {
      if (!dec) {
        if (firstNum) {
          lValue += '.';
          value = lValue;
          dec = true;
        } else {
          rValue += '.';
          value = rValue;
          dec = true;
        }
      }
    }
  }
}
