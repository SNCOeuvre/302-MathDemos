

void setup()
{
 size(800,500); 
 
}

void draw()
{
  background(64);
  stroke(sin(random(50,255)), cos(random(50,255)), tan(random(50,255)));
  float time = millis()/1000.0;
  
  
  //-1 to 1 starting
  //getting to 2 - 20 (18)
  float t = sin(time * 2) * 9 + 11; 
  strokeWeight(t);
  
  ellipse(width/2, height/2, 400, 400);
}
