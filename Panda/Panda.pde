float centerX = 200;
float centerY = 200;

float d = 100;

void setup()
{
  size(400,400);
  rectMode(CENTER);
  noStroke();
  
  //body
  stroke(0);
  ellipse(centerX,centerY+250,d*3,d*4);
  
  //ears
  fill(70);
  noStroke();
  circle(centerX-80,centerY-80,d*0.8);
  circle(centerX+80,centerY-80,d*0.8);
  
  //face
  fill(255);
  stroke(0);
  circle(centerX,centerY,d*2);

  //cheek
  noStroke();
  fill(244,195,194,200);
  circle(centerX-60,centerY+20,d*0.45);
  circle(centerX+60,centerY+20,d*0.45);

  //eyeshadow
  fill(70);
  circle(centerX-40,centerY-10,d/2);
  circle(centerX+40,centerY-10,d/2);
  
  //eyes
  fill(0);
  circle(centerX-30,centerY-15,d*0.15);
  circle(centerX+30,centerY-15,d*0.15);

  //nose
  fill(0);
  ellipse(centerX,centerY+30,d*0.4,d*0.2);

  //bamboo
  fill(156,197,139);
  rect(centerX,centerY+140,d*0.3,d*1.5);
  fill(213,232,205);
  rect(centerX,centerY+110,d*0.3,d*0.1);
  rect(centerX,centerY+170,d*0.3,d*0.1);
  
  //arms
  fill(70);
  ellipse(centerX-70,centerY+130,d*1.3,d*0.7);
  ellipse(centerX+70,centerY+130,d*1.3,d*0.7);
}
