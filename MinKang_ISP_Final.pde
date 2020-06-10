/*
Min Kang
Ms.Basaraba
June 10, 2019
Screensaver ICS ISP.

This program uses simple functions such as ellipse and rect to create a custimazable screensaver creation program. To switch around methods, one variable, declared as "screen", was used to call certain methods into draw.
This allowed for transitions between methods to be easier, as by initialising screen as a different number, the user could switch screens efforlessly. For screensavers with multiple objects, arrays were used to store the values, but with 
the exception of one displayChoice screen, arrays are not used in any other places. Buttons create a well functioning UI and make errortraping useless, as a user does not need to input a value. The only choice the user has is to press 
buttons provided to them. After creating a screensaver, the user needs to press any key to return to the mainMenu. Variables are reset after every screensaver, and this makes the program re-runable without exiting.

To make button presses not collide with different buttons on other screens, i initalised mousePressed as false. The difference of using this idea rather than the delay function is that it allowes for easier and smoother transitions 
between screen changes.

Each method is seperated into different tabs to create navigation easier, with the exclusion of myBackground, which is in the main tab. At the start of each tab, there is a quick paragraph of what the method included does
and what it adds to the program. Certain details not mentioned in in-line comments will be mentioned.
*/

/*---------------------------CITATION---------------------------*|
CurveVertex was researched on during our copycat workshop, and also found on
https://processing.org/reference/curveVertex_.html

Bezier related functions was learned in 
https://processing.org/reference/bezier_.html
https://processing.org/reference/bezierPoint_.html

BezierPoint was well taught in an interactable program like
https://www.khanacademy.org/computer-programming/bezierpointa-b-c-d-t-processingjs/4551007698681856

The color data type and function was learned in
https://processing.org/reference/color_datatype.html
https://processing.org/reference/color_.html

I learned the use of arrays in past experince in coding and in
https://processing.org/reference/Array.html
https://processing.org/reference/arrayaccess.html

I learned the sin function in math class and in
https://processing.org/reference/sin_.html

The nf() function was taught in
https://processing.org/reference/nf_.html

The idea of the bouncing circle was taught in this Processing example
https://processing.org/examples/bounce.html
|*---------------------------CITATION---------------------------*/

/*---------------------------Global Declaration and Initialization---------------------------*/

//Used in multiple methods.
PFont loadScreenFont, mainMenuFont, instructionFont; //these are the fonts used in all of the programs. 
byte screen = 1; //dictates which screen the draw method is running.
int alpha = 0; //controls the alpha channel of the loading and exit screens.

//When the cursor is above the corresponding button, the button stroke will change to these colors.
//the variables are reused as they only act as a method of temporary storage for button strokes.
color displayButton1, displayButton2, displayButton3, displayButton4, displayButton5, displayButton6, displayButton7, displayButton8, displayButton9;

//Used in loadScreen.
float loadbarPos = 272; //controls the loadbar's progress.
boolean loadFinish = false; //checks if the loadbar has finished loading.

//Used in displayChoice.
byte displayScreen; //used for changing screens in display.
byte choice; //user's choice of what kind of screensaver they want to create.
byte colorNum = 0; //stores the amount of colors the user choose.

float speedX = 3, speedY = 3; //used as the speed modifier for bubbles and box screensaver.
boolean runOnce = false; //checks if any screensaver has been run once, this is used to initialise variables only once.
boolean example = false; //checks if display is being run from example. (explained in exampleChoice)

int[] objectColor = new int[10]; //contains the color an object is using, for screensavers with multiple objects such as bubbles and curves.
boolean[] colorChoice = new boolean[8]; //contains the true and false states for the colorful buttons pressed in displayChoices.
color[] colorUse = new color[8]; //actually contains the colors being used in the screensaver.

//Used in the bubbles shape screensaver.
int bubbleNum = 5, bubbleRadius = 30; //Num affects the # of bubbles, Radius affects the radius of the bubbles.

int[] bubbleDirectionX = new int[10]; //stores the directional value in the X axis. Either 1 or -1.
int[] bubbleDirectionY = new int[10]; //stores the directional value in the Y axis. Either 1 or -1.
float[] bubbleX = new float[10]; //stores the position of the bubble in the X axis.
float[] bubbleY = new float[10]; //stores the position of the bubble in the Y axis.
float bubbleModifier; //contains the value the sin function will use to slow and speed up the bubble.

//Used in the box shape screensaver.
int boxH = 100, boxL = 100; //box height and box length.
int boxDirectionX, boxDirectionY; //stores the directional value of the box. Either -1 or 1.
int boxColor; //stores the color being used for the box.
float boxPosX, boxPosY; //stores the position of the box.

//Used in the curve shape screensaver.
int curveNum = 5, curveRadius = 15; //Num affects the # of bubbles, Radius affects the radius of the bubbles.
float curveSpeed = 7.5; //Speed affects the increment of curveIncrement.

//increment / 100 create the fraction for slice, which is feeded into the bezierPoint function.
float[] curveIncrement = new float[10]; //stores the value of the increment value for the bubbles.
float[] curveSlice = new float[10]; //stores the section of the bezier curve the bubble will be drawn at.

//positions of the bezier curve points, excluding the beginning as it is set to the middle.
float[] curvePosX1 = new float[10]; 
float[] curvePosY1 = new float[10];
float[] curvePosX2 = new float[10];
float[] curvePosY2 = new float[10];
float[] curvePosX3 = new float[10];
float[] curvePosY3 = new float[10];

float[] curveBubbleX = new float[10]; //stores the position of the bubble in the X axis.
float[] curveBubbleY = new float[10]; //stores the position of the bubble in the Y axis.

void setup(){ //<>//
  
  size(800, 500);
  background(0);
  
  //initialises the fonts.
  loadScreenFont = loadFont("SegoeUI-Light-48.vlw");
  mainMenuFont = loadFont("TwCenMT-Italic-64.vlw");
  instructionFont = loadFont("Cambria-48.vlw");  
}

//this method contains the background the majority of the screens use, such as the mainMenu, instruction, exampleChoice, displayChoice, and exitScreen.
void mainBackground(){
  
  //redraws the background.
  background(130,200,255);
  
  //sets descriptive attributes for all clouds.
  noStroke();
  fill(235);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  //draws the left cloud.
  rect(100, 110, 140, 50, 50);
  rect(80, 80, 60, 40, 100);
  ellipse(115, 85, 70, 70);
  
  //draws the right cloud.
  rect(630, 150, 140, 50, 50);
  rect(655, 130, 50, 40, 100);
  ellipse(615, 135, 70, 70);
  
  //draws the land with its colour.
  fill(90, 180, 0);
  beginShape();
  curveVertex(0, height);
  curveVertex(0, height);
  curveVertex(0, 3*height/4);
  curveVertex(0, 3*height/4);
  curveVertex(width/6, 3.5*height/5);
  curveVertex(width/3, 3.5*height/5);
  curveVertex(width/2, 3*height/4);
  curveVertex(2*width/3, 4*height/5);
  curveVertex(5*width/6, 4*height/5);
  curveVertex(width, 3*height/4);
  curveVertex(width, 3*height/4);
  curveVertex(width, height);
  curveVertex(width, height);
  endShape();
}

void draw(){ //<>//
  
  //resets all colours to black, for it to be changed if the cursor is on a button.
  displayButton1 = color(0);
  displayButton2 = color(0);
  displayButton3 = color(0); 
  displayButton4 = color(0); 
  displayButton5 = color(0);
  displayButton6 = color(0);
  displayButton7 = color(0); 
  displayButton8 = color(0); 
  displayButton9 = color(0);

  if (screen == -1){ //if screen is -1.
    goodbye();
  } else if (screen == 0){ //if screen is 0, 
    exitScreen();
  } else if (screen == 1){ //if screen is 1, (always initialized as 1.)
    loadScreen();  
  } else if (screen == 2){ //if screen is 2,
    mainMenu();
  } else if (screen == 3){ //if screen is 3,
    instruction();
  } else if (screen == 4){ //if screen is 4,
    exampleChoice();
  } else if (screen == 5){ //if screen is 5,
    displayChoice();
  } else if (screen == 6){ //if screen is 6,
    display();
  }
}
