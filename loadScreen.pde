/*
Loadscreen is the method first called into the program when opened. It shows a loading screen animation, with alpha being used to fade in objects. The
loading bars progress is randomised, although because the randomization favour towards positive numbers, the progress bar will slowly increase. After reaching the end,
the program will fade into mainMenu.

The logo and the title text is a pun on the company, Microsoft Windows, and also a joke on the fact they skipped the number 9 with their releases of the OS.
*/
void loadScreen(){

  if (loadFinish){ //if loadFinish is true,
    
    //when alpha reaches 0, meaning all objects have faded away, the screen will completely switch to mainMenu.
    if (alpha < 0){
      screen = 2; //sets screen to 2. (mainMenu)
    }
    
    mainMenu(); //calls mainMenu method for the time being, so the loadScreen can fade away and leave the menu behind. 
    alpha -= 4; //lowers alpha by 5 each time it is run.  
    fill(0, alpha); //adds the ability to manipulate the background's transparency.

  } else { //if loadFinish is not true,
  
    if (alpha < 255){ //if alpha is below the 255,
      alpha++; //increment alpha.
    }
    
    if (loadbarPos > 0){ //if loadbarPos is more than 0,
      loadbarPos -= random(-1, 2); //keep subtracting a random number of 1 to 3.  
    } else { //if the loadbarPos becomes less than 0,
      loadbarPos = 0; //set the variable to 0.
      loadFinish = true; //set loadFinish as true.
    }
    fill(0); //sets the background as a solid black.
  }
  
  noStroke(); //resets the stroke set for the loadBar.
  
  //draws the translucent background.
  rectMode(CORNERS);
  rect(0, 0, width, height);
  
  //draws the orange square.
  fill(255, 110, 10, alpha);  
  quad(width/2-10, height/2-10, 250, height/2-10, 250, height/4+10, width/2-10, height/4);
  
  //draws the green square.
  fill(150, 195, 0, alpha);  
  quad(width/2+10, height/2-10, 550, height/2-10, 550, height/4-10, width/2+10, height/4);
  
  //draws the yellow square.
  fill(0, 100, 255, alpha);  
  quad(width/2+10, height/2+10, 550, height/2+10, 550, 3*height/4+10, width/2+10, 3*height/4);
  
  //draws the blue square.
  fill(255, 200, 0, alpha);  
  quad(width/2-10, height/2+10, 250, height/2+10, 250, 3*height/4-10, width/2-10, 3*height/4);
  
  //draws the loadbar's frame.
  stroke(255, alpha);
  strokeWeight(6);
  noFill();
  rectMode(CENTER);
  rect(width/2, 3*height/4+50, 300, 30, 200);
  
  //draws the loading bar inside the frame.
  stroke(10, 175, 255, alpha);
  strokeWeight(25);
  line(264, 3*height/4+50, 536-loadbarPos, 3*height/4+50);
  
  //draws the text for the loading bar.
  textFont(loadScreenFont);
  textAlign(CENTER,CENTER);
  fill(0, alpha);
  textSize(22);
  text("L  o  a  d  i  n  g ...", width/2, 3*height/4+50);
  
  //draws the title text for the logo.
  fill(255, alpha);
  textSize(48);
  text("Microsoft Min-dows 9", width/2, height/6);  
}
