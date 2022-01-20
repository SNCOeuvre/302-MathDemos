// Animate 3 electrons orbiting around a nucleus.
// Each electron should follow a path and match
// colors with its respective path.

// Don't use rotate()
// Use vectors and trigonometry

void setup(){
  size(400, 400);
}
void draw(){
  
  drawBackground();
  
  ///////////////// START YOUR CODE HERE:
  
  float time = millis() / 1000.0;
  float size = 5;
  float y = height/2 + sin(time * 2) * 50;
  float x = width/2 + cos(time * 2) * 150;
  float a2 = atan2(PI/1.5,PI/1.5);
  float a3 = atan2(y,x);
  
  //the first circle
  pushMatrix();
  noStroke();
  fill(255);
  ellipse(x,y, size,size);
  popMatrix();
  
  //second circle
  pushMatrix();
  translate(250,-50);
  rotate(a2);
  noStroke();
  fill(255,255,0);
  ellipse(x,y, size,size);
  popMatrix();
  
  //pushMatrix();
  ////translate(width/2,height/2);
  //rotate(a3 /4);
  //noStroke();
  //fill(255,0,0);
  //ellipse(x,y, size,size);
  //popMatrix();
  
  //third circle
  pushMatrix();
  translate(475,125);
  rotate(PI/1.5);
  noStroke();
  fill(255,0,255);
  atan2(5,30);
  ellipse(x,y, size,size);
  
  popMatrix();
  
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
void drawBackground(){
  background(0);
  noStroke();
  fill(255);
  ellipse(200,200,50,50);
  noFill();
  strokeWeight(5);
  
  pushMatrix();
  translate(200,200);
  stroke(255,100,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(PI/1.5);
  stroke(100,255,100);
  ellipse(0,0,300,100);
  popMatrix();
  
  pushMatrix();
  translate(200,200);
  rotate(2*PI/1.5);
  stroke(100,100,255);
  ellipse(0,0,300,100);
  popMatrix();
}
