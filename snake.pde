//Snake by Rahul.G //<>//


playerBlock s;
apple a;
boolean isLose = false;
boolean rectOver = false;
PImage apple;

//////////////////////////STARTING PARAMETERS
float gridSize = 50;
float startY = 450;
float startX = 0;
char keyPress = 'r';
int length = 0;
/////////////////////////////////////////
ArrayList<playerBlock> body; // an array list of the playerBlock class, called body

void setup() {
  size(900, 900);
  frameRate(10);
  body = new ArrayList<playerBlock>();
  s = new playerBlock();
  a = new apple();
  body.add(s); 
  s.xPos = startX;
  s.yPos = startY; 
  apple = loadImage("apple.png");
}

void draw() {

  if (isLose == false)
  {
    background(0);

    /*
  for (int i = 0; i<=countGrid; i++)
     {
     line((width/countGrid)*i, 0, (width/countGrid)*i, height);
     for (int y = 0; y <=countGrid; y++)
     {
     line(0, (height/countGrid)*i, width, (height/countGrid)*i);
     }
     }
     */
    //BACKGROUND///////////
    /* for (int i = 0; i<19; i++)
     {
     for (int y = 0; y<19; y++)
     {
     float fx = float(i);
     float fy = float(y);
     
     image(grass, fx*gridSize, fy*gridSize, gridSize, gridSize);
     }
     }
     */


    /////////////////////////
    // need to loop through all objects in the body
    drawApple();
    drawPlayer();
    colCheck();

    isLose();

    autoMove();
  } else
  {
    fill(255, 0, 0);
    rect(0, 0, 900, 900);
    fill(0);
    textSize(100);
    textAlign(CENTER);
    text("YOU LOSE", 450, 450);
    rect(300,600,300,90);
    textSize(50);
    fill(255);
    text("Retry?",450,660);
    //resetGame();
  }
}
void isLose()
{
  for (int i = 1; i <length+1; i++)
  {
    if (body.get(0).xPos == body.get(i).xPos && body.get(0).yPos == body.get(i).yPos)
    {
      isLose = true;
      return;
    }
  }
  if ((body.get(0).xPos<0 ||body.get(0).xPos > 900)||(body.get(0).yPos <0 ||body.get(0).yPos > 900))
  {
    isLose = true;
    return;
  }
}

void colCheck()
{
  playerBlock n;
  n = body.get(0);

  if (body.get(0).xPos == a.x && body.get(0).yPos == a.y)
  {
    a.rand();

    //HEAD

    body.add(new playerBlock());
    length++;    
    body.get(length);
    if (keyPress == 'l')
    {
      body.get(length).yPos = n.yPos;
      body.get(length).xPos = n.xPos + 50;
    } else if (keyPress == 'r')
    {
      body.get(length).yPos = n.yPos;
      body.get(length).xPos = n.xPos - 50;
    } else if (keyPress == 'u')
    {
      body.get(length).xPos = n.xPos;
      body.get(length).yPos = n.yPos + 50;
    } else if (keyPress == 'd')
    {
      body.get(length).xPos = n.xPos;
      body.get(length).yPos = n.yPos - 50;
    }

    println(body.size());
  }
}
void drawApple()
{

  fill(255, 0, 0);
  image(apple, a.x, a.y, gridSize, gridSize);
  // rect(a.x, a.y, gridSize, gridSize);
}


void drawPlayer()
{
  playerBlock n;
  for (int i= 0; i<body.size(); i++)
  {

    n = body.get(i);
    fill(255);
    rect(n.xPos, n.yPos, gridSize, gridSize);
    fill(255);
   
  }
}


void autoMove()
{

  for (int i = length; i >0; i--)
  {
    body.get(i).xPos = body.get(i-1).xPos;
    body.get(i).yPos = body.get(i-1).yPos;
  }
  playerBlock n;
  n = body.get(0);

  if (keyPress == 'd')
  {
    n.yPos = n.yPos + gridSize;
  }
  if (keyPress == 'u')
  {
    n.yPos = n.yPos - gridSize;
  }
  if (keyPress == 'l')
  {
    n.xPos = n.xPos - gridSize;
  }
  if (keyPress == 'r')
  {
    n.xPos = n.xPos + gridSize;
  }
}

void resetGame()
{
  isLose = false;

  keyPress = 'r';

  for (int i = length; i>0; i--)
  {
    body.remove(i);
  }
  length = 0;
  body.get(0).yPos = 450;
  body.get(0).xPos = 0;

}
void keyPressed()
{


  if (key == CODED)
  {
    if (keyCode == DOWN && keyPress != 'd')
    {

      keyPress = 'd';
    } else if (keyCode == UP && keyPress != 'u')
    {

      keyPress = 'u';
    } else if (keyCode == RIGHT && keyPress != 'l')
    {

      keyPress = 'r';
    } else if (keyCode == LEFT && keyPress != 'r')
    {

      keyPress = 'l';
    } else
    {
    }
  }
}

void mousePressed() {
 
  if ( clickRight(300,600,300,90) ){
    resetGame();
  }
}

boolean clickRight(int x, int y, int width, int height)  { //this clickover code was taken from the Processing documentation, https://processing.org/examples/button.html
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
