/*
This method stores the buttons that will lead to certain examples premade my, your precious, Min Kang himself.

The examples are called by setting values in if statements that call if a button is pressed. Then display is called, where when the user exits, because entering this screen sets
example (the boolean) to true, the screen will transition back to this screen rather than mainMenu.
*/
void exampleChoice(){

  //calls the background into the method.
  mainBackground();
  
  //if the cursor is over the circular button,
  if (dist(width/4, height/2, mouseX, mouseY) <= 50){ 
    
    displayButton1 = color(255, 80, 150); //sets the variable as a pink color.
    
    if (mousePressed){ //if the mouse is pressed in the area,
    
      mousePressed = false; //sets mousePressed to false
      
      //change values to fit the examples.
      choice = 1; 
      bubbleNum = 5;
      bubbleRadius = 30;
      speedX = 4;
      speedY = 2.5;
      colorChoice[6] = true;
      colorChoice[7] = true;
      
      screen = 6; //set screen to 6. (display)
    }
  } 
  
  //if the cursor is over the square button,
  if (width/2-50 < mouseX && mouseX < width/2+50 && height/2-50 < mouseY && mouseY < height/2+50){
    
    displayButton2 = color(255, 80, 150); //sets the varsiable as a pink color. 
    
    if (mousePressed){ //if the mouse is pressed in the area,
      
      mousePressed = false; //sets mousePressed to false
      
      //change values to fit the examples.
      choice = 2;
      boxH = 50;
      boxL = 150;
      speedX = 2;
      speedY = 2;
      colorChoice[1] = true;
      colorChoice[2] = true;
      
      screen = 6; //set screen to 6. (display)
    } 
  } 
  
  //if the cursor is over the curve button, (acts as a square button,)
  if (3*width/4-50 < mouseX && mouseX < 3*width/4+50 && height/2-50 < mouseY && mouseY < height/2+50){ 
    
    displayButton3 = color(255, 80, 150); //sets the variable as a pink color.
    
    if (mousePressed){ //if the mouse is pressed in the area, 
    
      mousePressed = false; //sets mousePressed to false 
      
      //change values to fit the examples.
      choice = 3;
      curveNum = 8;
      curveRadius = 25;
      curveSpeed = 5;
      colorChoice[0] = true;
      colorChoice[1] = true;
      colorChoice[4] = true;
      colorChoice[5] = true;

      screen = 6; //set screen to 6. (display)
    }
  } 
  
  //if the cursor is over the "Go Back" button,
  if (width/2-100 < mouseX && mouseX < width/2+100 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
    
    displayButton4 = color(160, 210, 110); //sets the variable as a green color.
    
    if (mousePressed){ //if the mouse is clicked,
      mousePressed = false; //sets mousePressed to false
      example = false; //sets example to false.
      screen = 2; //set screen to 2. (mainMenu)
    }
  }
  
  //draws the first, circular button.
  fill(130, 175, 255);
  strokeWeight(5);
  stroke(displayButton1);
  ellipseMode(CENTER);
  ellipse(width/4, height/2, 100, 100);
  
  //draws the second, square button.
  fill(255, 255, 100);
  stroke(displayButton2); 
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);
  
  //draws the last, curve button.
  fill(255, 175, 100);
  stroke(displayButton3); 
  ellipse(3*width/4, height/2, 40, 40);  
  noFill();
  bezier(3*width/4-50, height/2-50, 3*width/4-100, height/2+100, 3*width/4+100, height/2-100, 3*width/4+50, height/2+50);
  
  //draws the "Go Back" button.
  fill(255);
  strokeWeight(5);
  stroke(displayButton4);
  rect(width/2, 5*height/6, 200, 50, 50);
  
  //draws the title.
  textFont(mainMenuFont);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(52);
  text("Choose the example you want to see!", width/2, height/5);
  
  //draws the button names.
  textSize(32);
  text("Soap Bubbles", width/4, 2*height/3);
  text("Thick Box", width/2, 2*height/3);
  text("Desert-y Curves", 3*width/4, 2*height/3);
  text("Go Back", width/2, 5*height/6);
}
