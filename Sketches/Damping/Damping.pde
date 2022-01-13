//exponential slide
//asymptotic easing (almost without reaching a line)
//damping


//3 circle x positions
float x1, x2, x3;

//circle 2 velocity
float v2;

void setup()
{

 size(500,500);
}

void draw()
{
  background(0);
  
  //linear movement
  if(x1 < mouseX)
  {
    x1+=5;
    if (x1 > mouseX) x1 = mouseX;
  }
  else
  {
    x1 -= 5;
    if (x1 < mouseX) x1 = mouseX;
  }
  
  if(x2 < mouseX) v2++;
  else v2--;
  
  //use physics on circle 2:
  x2 += v2; //euler intergration
  v2 *= .96;
  
  //use damping
  //each tick move 50% to target
  //x3 += (mouseX - x3 )* .1;
  x3 = lerp(x3, mouseX, .1);
  
  
  ellipse(x1, height*1/4, 25,25);
  ellipse(x2, height*1/2, 25,25);
  ellipse(x3, height*3/4, 25,25);
}
