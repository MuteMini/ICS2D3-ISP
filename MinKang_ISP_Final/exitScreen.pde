/*
This method acts at the middle man from fully exiting the game and the mainMenu. This gives the user another chance to return to the program. A small darkening animation plays,
where the background slowly gets darker to a certain transparency. Two buttons are present, the GO BACK and EXIT. Pressing the buttons will do what the button says.
*/
void exitScreen(){

  //calls the background into the method.
  mainBackground();
  
  //adds to alpha until it becomes bigger than 150.
  if (alpha < 150){
    alpha += 2;
  }
  
  //if the mouse is currently in between the range of "GO BACK!" button,
  if (width/4-90 < mouseX && mouseX < width/4+90 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
    
    displayButton1 = color(160, 210, 110); //sets the variable as a green color.
    
    if (mousePressed){ //if the mouse is pressed in the area,
      mousePressed = false; //sets mousePressed to false
      screen = 2; //set screen to 2. (mainMenu)
      alpha = 0; //reset alpha to 0.
    }
  } 

  //if the mouse is currently in between the range of "EXIT!" button,
  if (3*width/4-90 < mouseX && mouseX < 3*width/4+90 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){
    
    displayButton2 = color(70); //sets the variable as a grey color.
    
    if (mousePressed){ //if the mouse is pressed in the area, change screen number.
      screen = -1; //set screen to -1. (goodbye)
    }
  }
  
  //draws the background.
  fill(0, alpha);
  rectMode(CORNERS);
  rect(0, 0, width, height);
  
  //draws the "GO BACK" button.
  fill(255);
  strokeWeight(5);
  stroke(displayButton1);
  rectMode(CENTER);
  rect(width/4, 5*height/6, 180, 50, 50); 
  
  //draws the "EXIT" button.
  stroke(displayButton2);
  rect(3*width/4, 5*height/6, 180, 50, 50);  
  
  //draws the text for the two buttons.
  fill(0);
  textFont(mainMenuFont, 36);
  textAlign(CENTER, CENTER);
  text("GO BACK!", width/4, 5*height/6);
  text("EXIT!", 3*width/4, 5*height/6);
  
  //makes the title text, asking if the user want to exit.
  fill(255, alpha+20);
  textFont(mainMenuFont, 64);
  text("Do you really want to exit?", width/2, 2*height/6);
}
