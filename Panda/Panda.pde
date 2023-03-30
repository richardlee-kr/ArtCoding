float centerX = 200;
float centerY = 200;

float d = 50;

void setup()
{
  size(400,400);
  rectMode(CENTER);
  noStroke();
  
  //body
  stroke(0);
  ellipse(centerX,centerY+d*2.5,d*3,d*4);
  
  //ears
  fill(70);
  noStroke();
  circle(centerX-d*0.8,centerY-d*0.8,d*0.8);
  circle(centerX+d*0.8,centerY-d*0.8,d*0.8);
  
  //face
  fill(255);
  stroke(0);
  circle(centerX,centerY,d*2);

  //cheek
  noStroke();
  fill(244,195,194,200);
  circle(centerX-d*0.6,centerY+d*0.2,d*0.45);
  circle(centerX+d*0.6,centerY+d*0.2,d*0.45);

  //eyeshadow
  fill(70);
  circle(centerX-d*0.4,centerY-d*0.1,d/2);
  circle(centerX+d*0.4,centerY-d*0.1,d/2);
  
  //eyes
  fill(0);
  circle(centerX-d*0.3,centerY-d*0.15,d*0.15);
  circle(centerX+d*0.3,centerY-d*0.15,d*0.15);

  //nose
  fill(0);
  ellipse(centerX,centerY+d*0.3,d*0.4,d*0.2);

  //bamboo
  fill(156,197,139);
  rect(centerX,centerY+d*1.4,d*0.3,d*1.5);
  fill(213,232,205);
  rect(centerX,centerY+d*1.1,d*0.3,d*0.1);
  rect(centerX,centerY+d*1.7,d*0.3,d*0.1);
  
  //arms
  fill(70);
  ellipse(centerX-d*0.7,centerY+d*1.3,d*1.3,d*0.7);
  ellipse(centerX+d*0.7,centerY+d*1.3,d*1.3,d*0.7);
}
