/*
This method is called from mainMenu and simply shows the instructions on how to use the program.
*/
void instruction(){

  //calls the background into the method.
  mainBackground();
  
  //if the mouse is inside the exit button,
  if (width/2-175 < mouseX && mouseX < width/2+175 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){ 
    
    displayButton1 = color(70); //sets the variable as a grey color.
    
    if (mousePressed){ //if the mouse is pressed in the area,
      mousePressed = false; //sets mousePressed to false
      screen = 2; //set screen to 2. (mainMenu)
    }
  }
  
  //draws the exit button.
  rectMode(CENTER);
  fill(255);
  stroke(displayButton1);
  strokeWeight(5);
  rect(width/2, 5*height/6, 350, 50, 50);  
  
  //draws the title text.
  fill(0);
  textAlign(CENTER, CENTER);
  textFont(mainMenuFont, 64);
  text("Instructions", width/2, height/6);
 
  //draws the button text.
  textSize(48);
  text("Exit", width/2, 5*height/6);
  
  //draws the instructions onto the middle of the screen.
  fill(0);
  textAlign(CENTER, TOP);
  textFont(instructionFont, 24);
  text("On the creation page, the program will instruct you to choose certain customizable option. When all catagories have been picked, the program will show a animation created by your choices. To exit, press any key.", width/2, height/2, 600, 250);
  text("On the example page, you will be given three options. The examples correspond to its button. When clicked, the screensaver will run until any key is pressed.", width/2, 3*height/4, 600, 250);
}
