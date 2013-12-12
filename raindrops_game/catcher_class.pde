class catcher
{
  PVector loc;//location
  boolean con;// tests for connecion

    catcher()
  {
    loc = new PVector(mouseX, 100);//set location to MouseX for control on only X direction
  }

  boolean catching(int i)//tests if raindrops are above/nearby, returns true or false
  {
    if (abs(loc.x- rain[i].loc.x)<50 && abs(loc.y- rain [i].ys) < 10)// if rain touches catcher
    {
      return (true);// return that it touches the catcher
    }
    else// if rain doesn't touch the catcher
    {
      return (false);// return that it does not
    }
  }

  void display()//display catcher
  {
    ellipse(loc.x, loc.y,100, 20);//catcher shape
    loc = new PVector(mouseX, height-50);//track location of mouseX
  }
}

