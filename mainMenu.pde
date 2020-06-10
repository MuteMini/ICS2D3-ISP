/*
This method is the main hub for moving around the program. After loadScreen's animation, mainMenu will give four options to the user. 
Create, Example, Instruction, and Exit. These all call their respective methods by changing values of screen and other variables. 
*/
void mainMenu(){
  
  //calls the background into the program.
  mainBackground();
  
  //if the mouse is currently in between the range of the "CREATE" button,
  if (width/2-175 < mouseX && mouseX < width/2+175 && 2*height/6-25 < mouseY && mouseY < 2*height/6+25){  
    
    displayButton1 = color(160, 210, 110); //sets the variable as a green color.
    
    if (mousePressed){ //if the mouse is pressed in the area.
      mousePressed = false; //sets mousePressed to false
      screen = 5; //set screen to 5. (displayChoice)
    }
  }
  
  //if the mouse is currently in between the range of the "EXAMPLE" button,
  if (width/2-175 < mouseX && mouseX < width/2+175 && 3*height/6-25 < mouseY && mouseY < 3*height/6+25){  
    
    displayButton2 = color(255, 145, 120); //sets the variable as a pinkish color.
    
    if (mousePressed){ //if the mouse is pressed in the area,
      mousePressed = false; //sets mousePressed to false
      example = true; //set example to true.
      screen = 4; //set screen to 4. (exampleChoice)
    }
  }
  
  //if the mouse is currently in between the range of the "INSTRUCTION" button,
  if (width/2-175 < mouseX && mouseX < width/2+175 && 4*height/6-25 < mouseY && mouseY < 4*height/6+25){   
    
    displayButton3 = color(180, 145, 180); //sets the variable as a purple color.
    
    if (mousePressed){ //if the mouse is pressed in the area,
      mousePressed = false; //sets mousePressed to false
      screen = 3; //set screen to 3. (instruction)
    }  
  }
  
  //if the mouse is currently in between the range of the "EXIT" button,
  if (width/2-175 < mouseX && mouseX < width/2+175 && 5*height/6-25 < mouseY && mouseY < 5*height/6+25){   
    
    displayButton4 = color(70); //sets the variable as a grey color.
    
    if (mousePressed){ //if the mouse is pressed in the area, change screen number.
      mousePressed = false; //sets mousePressed to false
      screen = 0; //set screen to 0. (exit)
    }
  }
  
  //draws the "CREATE" button.
  strokeWeight(5);
  strokeCap(ROUND);
  fill(255);
  stroke(displayButton1);
  rect(width/2, 2*height/6, 350, 50, 50);
  
  //draws the "EXAMPLE" button.
  stroke(displayButton2);
  rect(width/2, 3*height/6, 350, 50, 50);
  
  //draws the "INSTRUCTION" button.
  stroke(displayButton3);
  rect(width/2, 4*height/6, 350, 50, 50);
  
  //draws the "EXIT" button.
  stroke(displayButton4);
  rect(width/2, 5*height/6, 350, 50, 50);
  
  //draws the title of the program.
  textFont(mainMenuFont);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(64);
  text("Screensaver Generator", width/2, height/6);
  
  //draws the button texts on the appropriate places.
  textSize(48);
  text("Create", width/2, 2*height/6);
  text("Example", width/2, 3*height/6);
  text("Instruction", width/2, 4*height/6);
  text("Exit", width/2, 5*height/6);  
}
