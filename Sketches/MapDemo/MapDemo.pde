void setup()
{
 size(500,500); 
  
}

void draw()
{
 background(128);
 
 
 //float p = mouseX / (float) width;
 //float degrees = lerp(0,360, p); //angles, converted to degrees
 
 //positions of something between two numbers, and converting to a different range of numbers
 float degrees = map(mouseX, 0,width, 0,360);
 
 pushMatrix();
 translate(width/2, height/2);
 rotate(radians(degrees));
 rect(-200,-200, 400,400);
 popMatrix();
  
}
