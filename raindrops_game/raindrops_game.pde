//Recognition?
rain_class rain []= new rain_class[10000];// 10K raindrops
catcher mitt;
int index, currentTime, oldTime, score, lose;
PImage background;
boolean start;
void setup()
{
  size(800, 500);
  mitt = new catcher();// create catcher mitt
  for (int i=0; i < rain.length; i++)//initialize rain
  {
    rain[i] = new rain_class(random(width), 0);// create new rain at random width for testing purposes
  }
  index=1;
  lose=0;
  background = loadImage("Rain-Background.jpg");//load background image
  start = false;
}

void draw()
{
  currentTime= millis();//current time is currentTime
  background(background);//set background
  if (start == false)//if the game hasn't started
  {
    fill(255, 0, 0);
    textSize(32);
    text("Click to Start", width/2, height/2);//text start screen
    if (mousePressed)//if click, then make the game start
    {
      start=true;
    }
  }
  if (score < 200 && score > -200 && start==true)//if you havent lost or won
  {
    for (int i=0; i < index; i++)
    {
      rain[i].display();// display all indexed rain and make them fall
      rain[i].fall();
    }
  }
  if (currentTime-oldTime>500 && start==true)//spawn a new raindrop every .5 seconds
  {
    index++;
    oldTime=currentTime;
  }
  if (start==true)
  {
    mitt.display();//display catcher
  }
  for (int i=0; i < index; i++)
  {
    if (mitt.catching(i)==true)//check if rain is caught
    {
      if (rain[i].evil==true)//if rain is evil
      {
        if (rain[i].scored==false)// if rain has already been scored
        {
          score-=200;// evil rain subtracts 200 points
          rain[i].scored = true;//now its been scored
          rain[i].loc.x=1200;//remove rain
        }
      }
      if (rain[i].scored==false)
      {
        score+=5;//caught rain adds 1 point
        rain[i].scored=true;// now it is caught
      }
      rain[i].loc.x=1200;// remove rain
    }
  }
  textSize(25);
  if(start==true)//if we start the game
  {
  text(score, width/2, height/2);//display score
  }
  textSize(50);
  if (score > 199)//display win coditions
  {
    text("Winner", width/2, height/2-100);
    textSize(32);
    text("Click to play again", width/2-100, height/2 + 100);
    if (lose == 0)
    {
      lose = 1;
    }
    if (mousePressed)//if click, reset game
    {
      index = 0;
      score = 0;
      for (int i=0; i < rain.length; i++)//initialize rain
      {
        rain[i] = new rain_class(random(width), 0);// create new rain at random width for testing purposes
      }
    }
    textSize(30);
  }
  if (score<-199)//if lost
  {
    text("Loser", width/2, height/2-100);
    textSize(32);
    text("Click to play again", width/2-100, height/2 + 100);
    if (lose == 0)
    {
      lose = 1;
    }
    if (mousePressed)//if clicked, reset
    {
      index = 0;
      score = 0;
      for (int i=0; i < rain.length; i++)//initialize rain
      {
        rain[i] = new rain_class(random(width), 0);// create new rain at random width for testing purposes
      }
    }
    println(lose);
    textSize(30);
  }
}


