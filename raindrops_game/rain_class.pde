class rain_class
{
  PVector loc;//location
  float d;//diameter
  //float xs,ys;// x and y floats for access
  boolean evil,scored;
  
  rain_class(float x)// x and Y values for location
  {
    loc = new PVector(x,0);// make location x and y
    //spe = new PVector(4,4);// sets speed of falling raindops
    d=10; //diameter = 10
    if(int(random(6))==5)
    {
      evil = true;
    }
    else
    {
      evil = false;
    }
    scored = false;
  }
  
  void display()// function to display
  {
    if(evil == true)
    {
      fill(255,0,0);
    }
    else
    {
      fill(0,0,255);
    }
    ellipse(loc.x,loc.y,d,d);// draw rain
   // xs= loc.x;// set the x location to integer x location
    //ys= loc.y;// set the y location to integer y location
  }
  
  void fall()// function to fall
  {
    loc.y+=4;
    if(loc.y == 500)
    {
      score -=2;
    }
  }
}
