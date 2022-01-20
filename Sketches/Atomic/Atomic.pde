// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.

// Don't use rotate()
// Use vectors and trigonometry

void setup() {
  size(400, 400);
}
void draw() {

  drawBackground();
  noStroke();
  fill(255);
  ///////////////// START YOUR CODE HERE:
  PVector red = FindOvalPos(0,0);
  PVector green = FindOvalPos(60,1);
  PVector blue = FindOvalPos(-60,2);
  
  ellipse(red.x, red.y,10,10);
  ellipse(green.x, green.y, 10,10);
  ellipse(blue.x,blue.y,10,10);
  
  
  
  
  
  
  
  
  
  
  
  ////the first circle
  //pushMatrix();
  //noStroke();
  //fill(255);
  //ellipse(x1, y1, size, size);
  //popMatrix();

  ////second circle
  //pushMatrix();
  //translate(250, -50);
  //rotate(a2);
  //noStroke();
  //fill(255, 255, 0);
  //ellipse(x2, y2, size, size);
  //popMatrix();

  ////pushMatrix();
  //////translate(width/2,height/2);
  ////rotate(a3 /4);
  ////noStroke();
  ////fill(255,0,0);
  ////ellipse(x,y, size,size);
  ////popMatrix();

  ////third circle
  //pushMatrix();
  //translate(475, 125);
  //rotate(PI/1.5);
  //noStroke();
  //fill(255, 0, 255);
  //atan2(5, 30);
  //ellipse(x3, y3, size, size);

  //popMatrix();

  //testing of atan2
  //pushMatrix();
  ////background(204);
  //translate(width/2, height/2);
  //float a = atan2(5, 5);
  //rotate(a);
  //rect(-30, -5, 60, 10);
  //popMatrix();

  ///////////////// END YOUR CODE HERE
}

PVector FindOvalPos(float rotateAmount, float timeOffset)
{
  
   float time = millis() / 1000.0;
  //float size = 5;
  
  //find path on three ovals
  float y1 =  sin(time + timeOffset) * 50;
  float x1 =  cos(time + timeOffset) * 150;
  //float y2 = height/2 + sin(time * 2) * 50;
  //float x2 = width/2 + cos(time * 2) * 150;
  //float y3 = height/2 + sin(time * 2) * 50;
  //float x3 = width/2 + cos(time * 2) * 150;
  //float a2 = atan2(PI/1.5, PI/1.5);
  //float a3 = atan2(y1, x1);
  
  //covert coordinate to polar
  float angle1 = atan2(y1, x1);
  float mag1 =  sqrt(x1*x1 + y1*y1);
  
  //rotate vector
  angle1 -= radians(rotateAmount);
  //float angle3 = angle1 - radians(120);
  
  //convert back to carteasian
  x1 = mag1 * cos(angle1);
  y1 = mag1 * sin(angle1);
  //x2 = mag1 * cos(angle2);
  //y2 = mag1 * sin(angle2);
  
  //translate to center
  x1 += width/2;
  y1 += height/2;
  
  return new PVector(x1,y1);
}
void drawBackground() {
  background(0);
  noStroke();
  fill(255);
  ellipse(200, 200, 50, 50);
  noFill();
  strokeWeight(5);

  pushMatrix();
  translate(200, 200);
  stroke(255, 100, 100);
  ellipse(0, 0, 300, 100);
  popMatrix();

  pushMatrix();
  translate(200, 200);
  rotate(PI/1.5);
  stroke(100, 255, 100);
  ellipse(0, 0, 300, 100);
  popMatrix();

  pushMatrix();
  translate(200, 200);
  rotate(2*PI/1.5);
  stroke(100, 100, 255);
  ellipse(0, 0, 300, 100);
  popMatrix();
}
