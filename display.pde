/*
This method contains the actuall drawing portion of each screensaver the user chose. The values picked in displayChoice will be used inside this method to custimise the screensaver.

*/
void display(){
  
  //refreshed the background for animation.
  background(0);
  
  if (runOnce == false){ //if runOnce is true, (made to only run once.)
    
    //goes through each boolean variable in colorChoice and adds a color to colorUse based on if one variable is true.
    if (colorChoice[0] == true){
      colorUse[colorNum] = color(255, 100, 100);
      colorNum++;
    }
    if (colorChoice[1] == true){
      colorUse[colorNum] = color(255, 175, 100);
      colorNum++;
    }
    if (colorChoice[2] == true){
      colorUse[colorNum] = color(255, 255, 100);
      colorNum++;
    }
    if (colorChoice[3] == true){
      colorUse[colorNum] = color(100, 255, 100);
      colorNum++;
    }
    if (colorChoice[4] == true){
      colorUse[colorNum] = color(255, 130, 150);
      colorNum++;
    }
    if (colorChoice[5] == true){
      colorUse[colorNum] = color(230, 130, 255);
      colorNum++;
    }
    if (colorChoice[6] == true){
      colorUse[colorNum] = color(130, 175, 255);
      colorNum++;
    }
    if (colorChoice[7] == true){
      colorUse[colorNum] = color(130, 255, 180);
      colorNum++;
    }  

    if (choice == 1){ //if choice is 1 (meaning the user choose bubble),
    
      for (int x = 0; x < bubbleNum; x++){ //for 0 upto bubbleNum,
      
        bubbleX[x] = random(bubbleRadius, width-bubbleRadius); //set bubbleX random, taking into account the bubbleRadius.
        bubbleY[x] = random(bubbleRadius, height-bubbleRadius); //set bubbleY random, taking into account the bubbleRadius.
        
        objectColor[x] = floor(random(0, colorNum-0.01)); //sets the objectColor with a random number right below colorNum.
        
        while (bubbleDirectionX[x] == 0){ //while bubbleDirectionX value is 0, (needs to be -1 or 1.)
          bubbleDirectionX[x] = floor(random(-1,2)); //sets bubbleDirectionX value to either -1, 0 or 1.
        }
        while (bubbleDirectionY[x] == 0){ //while bubbleDirectionY value is 0, (needs to be -1 or 1.)
          bubbleDirectionY[x] = floor(random(-1,2)); //sets bubbleDirectionX value to either -1, 0 or 1.
        }
      }
    } else if (choice == 2){ //if choice is 2 (meaning the user choose box), 
      
      boxPosX = random(boxL, width-boxL); //set boxPosX random, taking into account the boxL.
      boxPosY = random(boxH, height-boxH); //set boxPosY random, taking into account the boxH.
      
      boxColor = floor(random(0, colorNum-0.01)); //sets the boxColor with a random number right below colorNum.
      
      while (boxDirectionX == 0){ //while boxDirectionX value is 0, (needs to be -1 or 1.)
        boxDirectionX = floor(random(-1,2)); //sets boxDirectionX value to either -1, 0 or 1.
      }
      while (boxDirectionY == 0){ //while boxDirectionY value is 0, (needs to be -1 or 1.)
        boxDirectionY = floor(random(-1,2)); //sets boxDirectionY value to either -1, 0 or 1.
      }      
    } else if (choice == 3){ //if choice is 3 (meaning the user choose curves,), 
      
      for (int x = 0; x < curveNum; x++){ //for 0 upto curveNum,
        
        objectColor[x] = floor(random(0, colorNum-0.01)); //sets objectColor with a random number right below colorNum.
        
        //sets each of the curve positions to random locations in the 
        curvePosX1[x] = random(0, 801); 
        curvePosY1[x] = random(0, 501);
        curvePosX2[x] = random(-200, 1001);
        curvePosY2[x] = random(-200, 701);
        curvePosX3[x] = random(-200, 1001);
        curvePosY3[x] = random(-200, 701);
      }
    }
  }
  
  runOnce = true; //sets runOnce to true. This makes the above if statement never run after it is called once. (a semi-setup method if you will)
 
  if (keyPressed){ //if any type of key has been pressed, 
  
    mousePressed = false; //sets mousePressed to false
    
    //resets all values to the normal initalization and sets screen to the mainMenu value.
    displayScreen = 0;
    choice = 0;
    runOnce = false;

    bubbleNum = 5;
    bubbleRadius = 10;
    boxH = 100;
    boxL = 100;
    curveRadius = 15;
    speedX = 3;
    speedY = 3;
    curveSpeed = 7.5;
    colorNum = 0;
    
    bubbleModifier = 0;
    boxPosX = 0;
    boxPosY = 0;
    boxDirectionX = 0;
    boxDirectionY = 0;
    boxColor = 0;

    for(int x = 0; x < 10; x++){ //uses a for loop to reset all values of the arrays.
      
      objectColor[x] = 0;
      
      bubbleDirectionX[x] = 0;
      bubbleDirectionY[x] = 0;
      bubbleX[x] = 0;
      bubbleY[x] = 0; 
      
      curveSlice[x] = 0;
      curveIncrement[x] = 0;
      curvePosX1[x] = 0;
      curvePosY1[x] = 0;
      curvePosX2[x] = 0;
      curvePosY2[x] = 0;
      curvePosX3[x] = 0;
      curvePosY3[x] = 0;
      curveBubbleX[x] = 0;
      curveBubbleY[x] = 0;
     
      if (x < 8){ //these two arrays are shorter than the others, needing it to stop clearing over the boundaries.
        colorChoice[x] = false;
        colorUse[x] = color(0);
      }
    }
      
    if (example){ //if example is true,
      screen = 4; //changes the screen to 4 (exampleChoice).
    } else {
      screen = 2; //changes the screen to 2 (mainMenu).
    }
  }
  
  if (choice == 1){ //if choice is 1 (meaning the user choose bubble),
    
    bubbleModifier += 0.01; //increases the variable by 0.01

    for (int x = 0; x < bubbleNum; x++){ //for 0 to bubbleNum,
      
      //if the circle is touching the west/east parts of the screen, reverse directionX.
      if (bubbleX[x] - bubbleRadius < 0 || bubbleX[x] + bubbleRadius > width){ 
        bubbleDirectionX[x] *= -1;
      }
      
      //if the circle is touching the north/south parts of the screen, reverse directionY.
      if (bubbleY[x] - bubbleRadius < 0 || bubbleY[x] + bubbleRadius > height){ 
        bubbleDirectionY[x] *= -1;
      }
      
      //updates the positions.
      bubbleX[x] += ((speedX + sin(bubbleModifier)) * bubbleDirectionX[x]); //adds speedX and the sine of bubbleModifier, then multiplies it by the directionX, moving bubbleX
      bubbleY[x] += ((speedY + sin(bubbleModifier)) * bubbleDirectionY[x]); //adds speedY and the sine of bubbleModifier, then multiplies it by the directionY, moving bubbleY
      
      //draws the bubble.
      fill(colorUse[objectColor[x]], 140); //the color used in the array is determined by objectColor's value, meaning one bubble has one specific color.
      stroke(255);
      strokeWeight(bubbleRadius * 0.15);
      ellipseMode(RADIUS);
      ellipse(bubbleX[x], bubbleY[x], bubbleRadius, bubbleRadius);
    }
  } else if (choice == 2){ //if choice is 2 (meaning the user choose box),
    
    //if the box is touching the west/east parts of the screen, reverse direction and change boxColor.
    if (boxPosX - (boxL/2) < 0 || boxPosX + (boxL/2) > width){
      boxDirectionX *= -1;
      boxColor = floor(random(0, colorNum-0.01)); //sets the boxColor with a random number right below colorNum.
    }
    
    //if the box is touching the north/south parts of the screen, reverse direction and change boxColor.
    if (boxPosY - (boxH/2) < 0 || boxPosY + (boxH/2) > height){
      boxDirectionY *= -1;
      boxColor = floor(random(0, colorNum-0.01)); //sets the boxColor with a random number right below colorNum.
    }
    
    //updates position of the box.
    boxPosX += speedX * boxDirectionX;
    boxPosY += speedY * boxDirectionY;
    
    //draws the box.
    fill(colorUse[boxColor], 140); //the color is determined by boxColor, which changes everytime the box reverses direction.
    stroke(255);
    strokeWeight(5);
    rectMode(CENTER);
    rect(boxPosX, boxPosY, boxL, boxH);
  } else if (choice == 3){ // if choice is 3 (meaning the user choose curves),
    
    for (int x = 0; x < curveNum; x++){ //for 0 upto curveNum,
      
      //if the bubble is outside of both the x axis and y axis, in other words, if the bubble is outside of the screen,
      if ( (curveBubbleX[x] < 0-curveRadius || curveBubbleX[x] > width+curveRadius) && (curveBubbleY[x] < 0-curveRadius || curveBubbleY[x] > height+curveRadius) ){
        
        //reset the increment value.
        curveIncrement[x] = 0;
        
        //reset the curveColor with a random number right below colorNum.
        objectColor[x] = floor(random(0, colorNum-0.01)); 
        
        //resets the curve's positions. This creates another random curve the bubble will follow.
        curvePosX1[x] = random(0, 801);
        curvePosY1[x] = random(0, 501);
        curvePosX2[x] = random(-200, 1001);
        curvePosY2[x] = random(-200, 701);
        curvePosX3[x] = random(-200, 1001);
        curvePosY3[x] = random(-200, 701);
      }
      
      //increments curveIncrement by speed multiplied by 0.2.
      curveIncrement[x] += curveSpeed * 0.2; 
      
      //sets slice to a decimal value created by increment/100.
      curveSlice[x] = curveIncrement[x] / 100;
      
      //updates the curveBubble's position using bezierPoint.
      curveBubbleX[x] = bezierPoint(width/2, curvePosX1[x], curvePosX2[x], curvePosX3[x], curveSlice[x]);
      curveBubbleY[x] = bezierPoint(height/2, curvePosY1[x], curvePosY2[x], curvePosY3[x], curveSlice[x]);
      
      //draws the bubble.
      fill(colorUse[objectColor[x]], 140); //the color used in the array is determined by objectColor's value, meaning one bubble has one specific color.
      stroke(255);
      strokeWeight(curveRadius * 0.15);
      ellipseMode(RADIUS);
      ellipse(curveBubbleX[x], curveBubbleY[x], curveRadius, curveRadius);
    }
  }
}
