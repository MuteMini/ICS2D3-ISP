/*
This program plays the animation before exiting the program.
*/
void goodbye(){
  
  //calls the background into the method.
  mainBackground();
  
  //adds 1 to alpha.
  alpha += 1;
  
  //when alpha is 500, exit the program.
  if (alpha > 500){
    exit();
  }
  
  //draws the translucent background.
  fill(0, alpha);
  rectMode(CORNERS);
  rect(0, 0, width, height);
  
  //draws the orange square, but starts a bit lighter.
  fill(255, 110, 10, alpha-150);  
  quad(width/2-10, height/2-10, 250, height/2-10, 250, height/4+10, width/2-10, height/4);
  
  //draws the green square, but starts a bit lighter.
  fill(150, 195, 0, alpha-150);  
  quad(width/2+10, height/2-10, 550, height/2-10, 550, height/4-10, width/2+10, height/4);
  
  //draws the yellow square, but starts a bit lighter.
  fill(0, 100, 255, alpha-150);  
  quad(width/2+10, height/2+10, 550, height/2+10, 550, 3*height/4+10, width/2+10, 3*height/4);
  
  //draws the blue square, but starts a bit lighter.
  fill(255, 200, 0, alpha-150);  
  quad(width/2-10, height/2+10, 250, height/2+10, 250, 3*height/4-10, width/2-10, 3*height/4);
  
  //draws the goodbye text.
  textFont(loadScreenFont);
  textAlign(CENTER,CENTER);
  fill(255, alpha);
  
  //draws the top texts.
  textSize(24);
  text("Thank you for using the", width/2, 0.5*height/6);
  textSize(48);
  text("Screensaver Generator!", width/2, height/6);
  
  //draws the bottom texts.
  textSize(24);
  text("Made by Min Kang from ICS2O3.", width/2, 5*height/6);
  text("The program will automatically close.", width/2, 5.3*height/6);
}
