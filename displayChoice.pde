/*
This method uses lots of nested if statements to gather input from the user. One main method of achieving this was with the use of displayScreen and choice. choice held the 
type of screensaver the user wanted to create, and displayScreen held certain screen states for different inputs. This meant each screensaver choice could contain multiple
user custimisable parts in one, long if statement. This does mean the tab became very long, more than 700 lines.

Each nested if statement also has brackets next to it, stating what the variable means. This makes it easier to navigate through.
*/
void displayChoice(){
  
  //calls the background into the method.
  mainBackground();
  
  if (displayScreen == 0){ //if displayScreen is 0 (always initialized as 0),
  
    //if the cursor is over the circular button,
    if (dist(width/4, height/2, mouseX, mouseY) <= 50){ 
      
      displayButton1 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is pressed in the area,
        mousePressed = false; //sets mousePressed to false
        choice = 1; //set choice as 1.
        displayScreen = 1; //set displayScreen as 1.
      }
    } 
    
    //if the cursor is over the square button,
    if (width/2-50 < mouseX && mouseX < width/2+50 && height/2-50 < mouseY && mouseY < height/2+50){
      
      displayButton2 = color(255, 80, 150); //sets the variable as a pink color. 
      
      if (mousePressed){ //if the mouse is pressed in the area,
        mousePressed = false; //sets mousePressed to false
        choice = 2; //set choice as 2.
        displayScreen = 1; //set displayScreen as 1.
      } 
    } 
    
    //if the cursor is over the curve button (acts as a square button),
    if (3*width/4-50 < mouseX && mouseX < 3*width/4+50 && height/2-50 < mouseY && mouseY < height/2+50){ 
      
      displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is pressed in the area,
        mousePressed = false; //sets mousePressed to false 
        choice = 3; //set choice as 3.
        displayScreen = 1; //set displayScreen as 1.
      }
    } 
   
    //draws the first, circular button.
    fill(255);
    strokeWeight(5);
    stroke(displayButton1);
    ellipseMode(CENTER);
    ellipse(width/4, height/2, 100, 100);
    
    //draws the second, square button.
    stroke(displayButton2);
    rectMode(CENTER);
    rect(width/2, height/2, 100, 100);
    
    //draws the last, curve button.
    stroke(displayButton3); 
    ellipse(3*width/4, height/2, 40, 40);
    noFill();
    bezier(3*width/4-50, height/2-50, 3*width/4-100, height/2+100, 3*width/4+100, height/2-100, 3*width/4+50, height/2+50);
    
    //draws the title.
    textFont(mainMenuFont);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(52);
    text("Choose your type of screensaver!", width/2, height/5);
    
    //draws the button names.
    textSize(32);
    text("Bubbles", width/4, 2*height/3);
    text("Box", width/2, 2*height/3);
    text("Curves", 3*width/4, 2*height/3);
    
  } else if (displayScreen == 1){ //if displayScreen is 1 (after the screensaver choice screen),
    
    if (choice == 1){ //if choice is 1 (meaning the user picked bubble),
    
      //if the cursor is over the confirm button,
      if (width/2-100 < mouseX && mouseX < width/2+100 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
        
        displayButton1 = color(160, 210, 110); //sets the variable as a green color.
        
        if (mousePressed){ //if the mouse is clicked, 
          mousePressed = false; //sets mousePressed to false
          displayScreen = 2; //set display screen to 2.
        }
      }

      if (bubbleNum > 1){ //if bubbleNum is more than 1, 
      
        //if the cursor is inside the down button,
        if (width/4-125 < mouseX && mouseX < width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton2 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            bubbleNum--; //decrement bubbleNum.
          }
        }  
      } else { //else bubbleNum NOT more than 1,
        displayButton2 = color(100); //sets the variable as a grey color.
      }
      
      if (bubbleNum < 10) { //if bubbleNum is less than 10, 
      
        //if the cursor is inside the up button,
        if (width/4+75 < mouseX && mouseX < width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            bubbleNum++; //increment bubbleNum.
          }
        }  
      } else { //else bubbleNum NOT less than 10,
        displayButton3 = color(100); //sets the variable as a grey color.
      }
      
      if (bubbleRadius > 20){ //if bubbleRadius is more than 20, 
      
        //if the cursor is inside the down button,
        if (3*width/4-125 < mouseX && mouseX < 3*width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton4 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked, 
            mousePressed = false; //sets mousePressed to false
            bubbleRadius -= 5; //decrement bubbleRadius by 5.
          }
        }  
      } else { //else bubbleRadius is NOT more than 20,
        displayButton4 = color(100); //sets the variable as a grey color.
      }
      
      if (bubbleRadius < 70) { //if bubbleRadius is less than 70, 
      
        //if the cursor is inside the up button,
        if (3*width/4+75 < mouseX && mouseX < 3*width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton5 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked, 
            mousePressed = false; //sets mousePressed to false
            bubbleRadius += 5; //increment bubbleRadius by 5.
          }
        }  
      } else { //else bubbleRadius is NOT less than 70,
        displayButton5 = color(100); //sets the variable as a grey color.
      }
      
      //draws the white box that contains the amount the user chose.
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(width/4, height/2, 100, 100, 50); 
      rect(3*width/4, height/2, 100, 100, 50); 
      
      //draws the confirmation button.
      strokeWeight(5);
      stroke(displayButton1);
      rect(width/2, 5*height/6, 150, 50, 50);
      
      //draws the up and down buttons for bubbleNum.
      stroke(displayButton2);
      rect(width/4-100, height/2, 50, 100, 25);
      triangle(width/4-90, height/2-15, width/4-110, height/2-15, width/4-100, height/2+10);
      stroke(displayButton3);
      rect(width/4+100, height/2, 50, 100, 25);
      triangle(width/4+90, height/2+10, width/4+110, height/2+10, width/4+100, height/2-15);
      
      //draws the up and down button for bubbleRadius.
      stroke(displayButton4);
      rect(3*width/4-100, height/2, 50, 100, 25);
      triangle(3*width/4-90, height/2-15, 3*width/4-110, height/2-15, 3*width/4-100, height/2+10);
      stroke(displayButton5);
      rect(3*width/4+100, height/2, 50, 100, 25);
      triangle(3*width/4+90, height/2+10, 3*width/4+110, height/2+10, 3*width/4+100, height/2-15);

      //draws the title text.
      textFont(mainMenuFont);
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(52);
      text("Set the below values:", width/2, height/6);
      
      //draws the button texts as well as the value texts.
      textSize(32);
      text("The amount of objects.", width/4, height/3);
      text("The radius of the bubbles.", 3*width/4, height/3);
      text(bubbleNum, width/4, height/2);
      text(bubbleRadius, 3*width/4, height/2);
      text("Confirm", width/2, 5*height/6);
      
    } else if (choice == 2){ //else if the choice is 2 (meaning they chose box),
      
      //if the cursor is over the confirm button,
      if (width/2-100 < mouseX && mouseX < width/2+100 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
        
        displayButton1 = color(160, 210, 110); //sets the variable as a green color.
        
        if (mousePressed){ //if the mouse is clicked, 
          mousePressed = false; //sets mousePressed to false
          displayScreen = 2; //set displayScreen to 2.
        }
      }
      
      if (boxH > 20){ //if boxH is more than 20, 
      
        //if the cursor is inside the down button,
        if (width/4-125 < mouseX && mouseX < width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton2 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            boxH -= 5; //decrement boxH by 5.
          }
        }  
      } else { //else boxH is NOT more than 20,
        displayButton2 = color(100); //sets the variable as a grey color.
      }
      
      if (boxH < 100) { //if boxH is less than 100, 
      
        //if the cursor is inside the up button,
        if (width/4+75 < mouseX && mouseX < width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){ 
          
          displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            boxH += 5; //increment boxH by 5.
          }
        }  
      } else { //else boxH is NOT less than 100,
        displayButton3 = color(100); //sets the variable as a grey color.
      } 
      
      if (boxL > 20){ //if boxL is more than 20, 
      
        //if the cursor is inside the down button,
        if (3*width/4-125 < mouseX && mouseX < 3*width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton4 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked, decrement boxL.
            mousePressed = false; //sets mousePressed to false
            boxL -= 5;
          }
        }  
      } else { //else boxL is NOT more than 20, 
        displayButton4 = color(100); //sets the variable as a grey color.
      }  
      
      if (boxL < 100) { //if boxL is less than 100, 
      
        //if the cursor is inside the up button,
        if (3*width/4+75 < mouseX && mouseX < 3*width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton5 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            boxL += 5; //increment boxL by 5.
          }
        }  
      } else { //else boxL is NOT less than 100,
        displayButton5 = color(100); //sets the variable as a grey color.
      }
      
      //draws the white box that contains the amount the user chose.
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(width/4, height/2, 100, 100, 50); 
      rect(3*width/4, height/2, 100, 100, 50); 
      
      //draws the confirmation button.
      strokeWeight(5);
      stroke(displayButton1);
      rect(width/2, 5*height/6, 150, 50, 50);
      
      //draws the up and down buttons for boxH.
      stroke(displayButton2);
      rect(width/4-100, height/2, 50, 100, 25);
      triangle(width/4-90, height/2-15, width/4-110, height/2-15, width/4-100, height/2+10);
      stroke(displayButton3);
      rect(width/4+100, height/2, 50, 100, 25);
      triangle(width/4+90, height/2+10, width/4+110, height/2+10, width/4+100, height/2-15);
      
      //draws the up and down button for boxL.
      stroke(displayButton4);
      rect(3*width/4-100, height/2, 50, 100, 25);
      triangle(3*width/4-90, height/2-15, 3*width/4-110, height/2-15, 3*width/4-100, height/2+10);
      stroke(displayButton5);
      rect(3*width/4+100, height/2, 50, 100, 25);
      triangle(3*width/4+90, height/2+10, 3*width/4+110, height/2+10, 3*width/4+100, height/2-15);

      //draws the title text.
      textFont(mainMenuFont);
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(52);
      text("Set the below values:", width/2, height/6);
      
      //draws the button texts as well as the value texts.
      textSize(32);
      text("Height of the box.", width/4, height/3);
      text("Length of the box.", 3*width/4, height/3);
      text(boxH, width/4, height/2);
      text(boxL, 3*width/4, height/2);
      text("Confirm", width/2, 5*height/6);
      
    } else if (choice == 3){ //else if the choice is 3 (meaning they choose curves),
      
      //if the cursor is over the confirm button,
      if (width/2-100 < mouseX && mouseX < width/2+100 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
        
        displayButton1 = color(160, 210, 110); //sets the variable as a green color.
        
        if (mousePressed){ //if the mouse is clicked,
          mousePressed = false; //sets mousePressed to false
          displayScreen = 2; //set displayScreen to 2.
        }
      }

      if (curveNum > 3){ //if curveNum is more than 3, 
      
        //if the cursor is inside the down button,
        if (width/4-125 < mouseX && mouseX < width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton2 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            curveNum--; //decrement curveNum.
          }
        }  
      } else { //else curveNum is NOT more than 3, 
        displayButton2 = color(100); //sets the variable as a grey color.
      }
      
      if (curveNum < 10) { //if curveNum is less than 10, 
      
        //if the cursor is inside the up button,
        if (width/4+75 < mouseX && mouseX < width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            curveNum++; //increment curveNum.
          }
        }  
      } else { //else curveNum is NOT less than 10, 
         displayButton3 = color(100); //sets the variable as a grey color.
      }
      
      if (curveRadius > 10){ //if curveRadius is more than 10, 
      
        //if the cursor is inside the down button,
        if (3*width/4-125 < mouseX && mouseX < 3*width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton4 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            curveRadius -= 5; //decrement curveRadius by 5.
          }
        }  
      } else { //else curveRadius is NOT more than 10, 
        displayButton4 = color(100); //sets the variable as a grey color.
      }
      
      if (curveRadius < 50) { //if curveRadius is less than 50, 
      
        //if the cursor is inside the up button,
        if (3*width/4+75 < mouseX && mouseX < 3*width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton5 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            curveRadius += 5; //increment curveRadius by 5.
          }
        }  
      } else { //else curveRadius is NOT less than 50, 
        displayButton5 = color(100); //sets the variable as a grey color.
      }
      
      //draws the white box that contains the amount the user chose.
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(width/4, height/2, 100, 100, 50); 
      rect(3*width/4, height/2, 100, 100, 50); 
      
      //draws the confirmation button.
      strokeWeight(5);
      stroke(displayButton1);
      rect(width/2, 5*height/6, 150, 50, 50);
      
      //draws the up and down buttons for curveNum.
      stroke(displayButton2);
      rect(width/4-100, height/2, 50, 100, 25);
      triangle(width/4-90, height/2-15, width/4-110, height/2-15, width/4-100, height/2+10);
      stroke(displayButton3);
      rect(width/4+100, height/2, 50, 100, 25);
      triangle(width/4+90, height/2+10, width/4+110, height/2+10, width/4+100, height/2-15);
      
      //draws the up and down button for the curveRadius.
      stroke(displayButton4);
      rect(3*width/4-100, height/2, 50, 100, 25);
      triangle(3*width/4-90, height/2-15, 3*width/4-110, height/2-15, 3*width/4-100, height/2+10);
      stroke(displayButton5);
      rect(3*width/4+100, height/2, 50, 100, 25);
      triangle(3*width/4+90, height/2+10, 3*width/4+110, height/2+10, 3*width/4+100, height/2-15);

      //draws the title text.
      textFont(mainMenuFont);
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(52);
      text("Set the below values:", width/2, height/6);
      
      //draws the button texts as well as the value texts.
      textSize(32);
      text("The amount of objects.", width/4, height/3);
      text("The radius of the curves.", 3*width/4, height/3);
      text(curveNum, width/4, height/2);
      text(curveRadius, 3*width/4, height/2);
      text("Confirm", width/2, 5*height/6);
    }    
  } else if (displayScreen == 2){ //if the displayScreen is 2,
    
    if (choice == 1 || choice == 2){ //if choice is 1 or 2 (meaning the user chose either bubbles or box,)
    
      //if the cursor is over the confirm button,
      if (width/2-100 < mouseX && mouseX < width/2+100 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
        
        displayButton1 = color(160, 210, 110); //sets the variable as a green color.
        
        if (mousePressed){ //if the mouse is clicked,
          mousePressed = false; //sets mousePressed to false
          displayScreen = 3; //change displayScreen to 3.
        }
      }
  
      if (speedX > 1){ //if speedX is more than 1, 
      
        //if the cursor is inside the down button,
        if (width/4-125 < mouseX && mouseX < width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton2 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            speedX -= 0.5; //decrement speedX by 0.5.
          }
        }  
      } else { //else speedX is NOT more than 1, 
        displayButton2 = color(100); //sets the variable as a grey color.
      }
      
      if (speedX < 10) { //if speedX is less than 10, 
      
        //if the cursor is inside the up button,
        if (width/4+75 < mouseX && mouseX < width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            speedX += 0.5; //increment speedX by 0.5.
          }
        }  
      } else { //else speedX is NOT less than 10,
        displayButton3 = color(100); //sets the variable as a grey color.
      }
      
      if (speedY > 1){ //if speedY is more than 1, 
      
        //if the cursor is inside the down button,
        if (3*width/4-125 < mouseX && mouseX < 3*width/4-75 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton4 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            speedY -= 0.5; //decrement speedY by 0.5.
          }
        }  
      } else {
        displayButton4 = color(100); //sets the variable as a grey color.
      }
      
      if (speedY < 10) { //if speedY is less than 10, 
      
        //if the cursor is inside the up button,
        if (3*width/4+75 < mouseX && mouseX < 3*width/4+125 && height/2-50 < mouseY && mouseY < height/2+50){
          
          displayButton5 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked, 
            mousePressed = false; //sets mousePressed to false
            speedY += 0.5; //increment speedY by 0.5.
          }
        }  
      } else { //else speedY is NOT less than 10, 
        displayButton5 = color(100); //sets the variable as a grey color.
      }
      
      //draws the white box that contains the amount the user chose.
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(width/4, height/2, 100, 100, 50); 
      rect(3*width/4, height/2, 100, 100, 50); 
      
      //draws the confirmation button.
      strokeWeight(5);
      stroke(displayButton1);
      rect(width/2, 5*height/6, 150, 50, 50);
      
      //draws the up and down buttons for speedX.
      stroke(displayButton2);
      rect(width/4-100, height/2, 50, 100, 25);
      triangle(width/4-90, height/2-15, width/4-110, height/2-15, width/4-100, height/2+10);
      stroke(displayButton3);
      rect(width/4+100, height/2, 50, 100, 25);
      triangle(width/4+90, height/2+10, width/4+110, height/2+10, width/4+100, height/2-15);
      
      //draws the up and down button for speedY.
      stroke(displayButton4);
      rect(3*width/4-100, height/2, 50, 100, 25);
      triangle(3*width/4-90, height/2-15, 3*width/4-110, height/2-15, 3*width/4-100, height/2+10);
      stroke(displayButton5);
      rect(3*width/4+100, height/2, 50, 100, 25);
      triangle(3*width/4+90, height/2+10, 3*width/4+110, height/2+10, 3*width/4+100, height/2-15);
  
      //draws the title text.
      textFont(mainMenuFont);
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(52);
      text("Set the below values:", width/2, height/6);
      
      //draws the button texts as well as the value texts.
      textSize(32);
      text("Horizontal Speed", width/4, height/3);
      text("Vertical Speed", 3*width/4, height/3);
      text(nf(speedX, 0, 1), width/4, height/2);
      text(nf(speedY, 0, 1), 3*width/4, height/2);
      text("Confirm", width/2, 5*height/6);
      
    } else if (choice == 3){ // if choce is 3 (meaning the user choose curves,)
      
      //if the cursor is over the confirm button,
      if (width/2-100 < mouseX && mouseX < width/2+100 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
        
        displayButton1 = color(160, 210, 110); //sets the variable as a green color.
        
        if (mousePressed){ //if the mouse is clicked,
          mousePressed = false; //sets mousePressed to false
          displayScreen = 3; //change displayScreen to 3.
        }
      }
      
      if (curveSpeed > 5){ //if curveSpeed is more than 5, 
      
        //if the cursor is inside the down button,
        if (width/2-125 < mouseX && mouseX < width/2-75 && height/2-50 < mouseY && mouseY < height/2+50){     
          
          displayButton2 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked, 
            mousePressed = false; //sets mousePressed to false
            curveSpeed -= 0.5; //decrement curveSpeed by 0.5.
          }
        }  
      } else {
        displayButton2 = color(100); //sets the variable as a grey color.
      }
      
      if (curveSpeed < 10) { //if curveSpeed is less than 30, 
      
        //if the cursor is inside the up button,
        if (width/2+75 < mouseX && mouseX < width/2+125 && height/2-50 < mouseY && mouseY < height/2+50){   
          
          displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
          
          if (mousePressed){ //if the mouse is clicked,
            mousePressed = false; //sets mousePressed to false
            curveSpeed += 0.5; //increment curveSpeed by 0.5.
          }
        }  
      } else { //else curveSpeed is NOT less than 30, 
        displayButton3 = color(100); //sets the variable as a grey color.
      }
      
      //draws the white box that contains the amount the user chose.
      rectMode(CENTER);
      fill(255);
      noStroke();
      rect(width/2, height/2, 100, 100, 50); 
      
      //draws the confirmation button.
      strokeWeight(5);
      stroke(displayButton1);
      rect(width/2, 5*height/6, 150, 50, 50);
      
      //draws the up and down buttons for curveSpeed.
      stroke(displayButton2);
      rect(width/2-100, height/2, 50, 100, 25);
      triangle(width/2-90, height/2-15, width/2-110, height/2-15, width/2-100, height/2+10);
      stroke(displayButton3);
      rect(width/2+100, height/2, 50, 100, 25);
      triangle(width/2+90, height/2+10, width/2+110, height/2+10, width/2+100, height/2-15);

      //sets the descriptive factors for the text.
      textFont(mainMenuFont);
      textAlign(CENTER, CENTER);
      fill(0);
      
      //draws the title text.
      textSize(52);
      text("Set the below values:", width/2, height/6);
      
      //draws the button texts as well as the value texts.
      textSize(32);
      text("Speed of the curves.", width/2, height/3);
      text(nf(curveSpeed, 0, 1), width/2, height/2);
      text("Confirm", width/2, 5*height/6);   
    } 
  } else if (displayScreen == 3){ //if displayScreen is 3,
  
    //if all of the colorChoice are false, set the display to grey.
    if (colorChoice[0] == false && colorChoice[1] == false && colorChoice[2] == false && colorChoice[3] == false && colorChoice[4] == false && colorChoice[5] == false && colorChoice[6] == false && colorChoice[7] == false){
      displayButton1 = color(100);
      
    //else if the cursor is over the "FINISH CREATION" button,
    } else if (width/2-150 < mouseX && mouseX < width/2+150 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){ 
      
      displayButton1 = color(160, 210, 110); //sets the variable as a green color.  
      
      if (mousePressed){ //if the mouse is clicked, 
        mousePressed = false; //sets mousePressed to false
        screen = 6; //set screen to 6. (display)
      }
    }  
    
    //if the cursor is in the first color button,
    if (width/5-45 < mouseX && mouseX < width/5+45 && 2*height/5-35 < mouseY && mouseY < 2*height/5+35){
      
      displayButton2 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[0] = !colorChoice[0]; //change colorChoice to the opposite of what it currently is.
      }
    } else if (colorChoice[0] == true){ //if colorChoice is true, 
      displayButton2 = color(255);  //change displayButton to white.
    }
    
    //if the cursor is in the second color button,
    if (2*width/5-45 < mouseX && mouseX < 2*width/5+45 && 2*height/5-35 < mouseY && mouseY < 2*height/5+35){
      
      displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[1] = !colorChoice[1]; //change colorChoice to the opposite of what it currently is.
      }  
    } else if (colorChoice[1] == true){ //if colorChoice is true, 
      displayButton3 = color(255);  //change displayButton to white.
    }
    
    //if the cursor is in the third color button,
    if (3*width/5-45 < mouseX && mouseX < 3*width/5+45 && 2*height/5-35 < mouseY && mouseY < 2*height/5+35){
      
      displayButton4 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[2] = !colorChoice[2]; //change colorChoice to the opposite of what it currently is.
      }
    } else if (colorChoice[2] == true){ //if colorChoice is true, 
      displayButton4 = color(255);  //change displayButton to white.
    }
    
    //if the cursor is in the fourth color button,
    if (4*width/5-45 < mouseX && mouseX < 4*width/5+45 && 2*height/5-35 < mouseY && mouseY < 2*height/5+35){
      
      displayButton5 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[3] = !colorChoice[3]; //change colorChoice to the opposite of what it currently is.
      }    
    } else if (colorChoice[3] == true){ //if colorChoice is true, 
      displayButton5 = color(255);  //change displayButton to white.
    }
    
    //if the cursor is in the fifth color button,
    if (width/5-45 < mouseX && mouseX < width/5+45 && 3*height/5-35 < mouseY && mouseY < 3*height/5+35){
      
      displayButton6 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[4] = !colorChoice[4]; //change colorChoice to the opposite of what it currently is.
      }   
    } else if (colorChoice[4] == true){ //if colorChoice is true, 
      displayButton6 = color(255);  //change displayButton to white.
    }
    
    //if the cursor is in the sixth color button,
    if (2*width/5-45 < mouseX && mouseX < 2*width/5+45 && 3*height/5-35 < mouseY && mouseY < 3*height/5+35){
      
      displayButton7 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[5] = !colorChoice[5]; //change colorChoice to the opposite of what it currently is.
      }
    } else if (colorChoice[5] == true){ //if colorChoice is true,
      displayButton7 = color(255);  //change displayButton to white.
    }
    
    //if the cursor is in the seventh color button,
    if (3*width/5-45 < mouseX && mouseX < 3*width/5+45 && 3*height/5-35 < mouseY && mouseY < 3*height/5+35){
      
      displayButton8 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[6] = !colorChoice[6]; //change colorChoice to the opposite of what it currently is.
      }
    } else if (colorChoice[6] == true){ //if colorChoice is true
      displayButton8 = color(255); //change displayButton to white.
    }
    
    //if the cursor is in the eight color button,
    if (4*width/5-45 < mouseX && mouseX < 4*width/5+45 && 3*height/5-35 < mouseY && mouseY < 3*height/5+35){
      
      displayButton9 = color(255, 80, 150); //sets the variable as a pink color.
      
      if (mousePressed){ //if the mouse is clicked,
        mousePressed = false; //sets mousePressed to false
        colorChoice[7] = !colorChoice[7]; //change colorChoice to the opposite of what it currently is.
      }
    } else if (colorChoice[7] == true){ //if colorChoice is true, 
      displayButton9 = color(255); //change displayButton to white.
    }
    
    //draws the confirm button.
    rectMode(CENTER);
    fill(255);
    strokeWeight(5);
    stroke(displayButton1);
    rect(width/2, 5*height/6, 300, 50, 50);
    
    //draws the color choice buttons.
    fill(255, 100, 100); //first color
    stroke(displayButton2);
    rect(width/5, 2*height/5, 90, 70, 50); 
    fill(255, 175, 100); //second color
    stroke(displayButton3);
    rect(2*width/5, 2*height/5, 90, 70, 50); 
    fill(255, 255, 100); // third color
    stroke(displayButton4);
    rect(3*width/5, 2*height/5, 90, 70, 50); 
    fill(100, 255, 100); // fourth color
    stroke(displayButton5);
    rect(4*width/5, 2*height/5, 90, 70, 50); 
    fill(255, 130, 150); // fifth color
    stroke(displayButton6);
    rect(width/5, 3*height/5, 90, 70, 50); 
    fill(230, 130, 255); // sixth color
    stroke(displayButton7);
    rect(2*width/5, 3*height/5, 90, 70, 50); 
    fill(130, 175, 255); // seventh color
    stroke(displayButton8);
    rect(3*width/5, 3*height/5, 90, 70, 50); 
    fill(130, 255, 180); // eighth color
    stroke(displayButton9);
    rect(4*width/5, 3*height/5, 90, 70, 50); 
    
    //sets the descriptive factors for the text.
    textFont(mainMenuFont);
    textAlign(CENTER, CENTER);
    fill(0);
    
    //draws the title text.
    textSize(52);
    text("Choose your colors:", width/2, height/6);
    
    //draws the confirm button text.
    textSize(32);
    text("Finish Creation!", width/2, 5*height/6);
    
    //draws a small warning below the button.
    textSize(24);
    text("*To exit, just press any key*", width/2, 5.5*height/6);
  }
}
