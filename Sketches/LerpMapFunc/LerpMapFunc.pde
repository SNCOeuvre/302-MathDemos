void setup()
{
 size(500,500); 
}

void draw()
{
  background(0);
  
  //float p = //mouseX/ (float)width;
  float d = mappinstan(mouseX, 0,width, 10,400);
  ellipse(width/2, height/2, d,d);
  
}

float lerpinstan(float min, float max, float p)
{
  //what teh f is the math?
  return (max - min) * p + min;
}

float mappinstan(float val, float inMin, float inMax, float outMin, float outMax)
{
  //1. figure out the percent value
 
 // p = (val - min) / (max - min)
 float p = (val - inMin) / (inMax - inMin);
 
 //2. Lerp using the p
  
  return lerpinstan(outMin, outMax, p);
}
