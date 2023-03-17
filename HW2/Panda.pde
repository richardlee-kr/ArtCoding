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
  ellipse(200,450,300,400);
  
  //ears
  fill(70);
  noStroke();
  circle(centerX-80,centerY-80,80);
  circle(centerX+80,centerY-80,80);
  
  //face
  fill(255);
  stroke(0);
  circle(centerX,centerY,d*2);

  //cheek
  noStroke();
  fill(244,195,194,200);
  circle(centerX-60,centerY+20,45);
  circle(centerX+60,centerY+20,45);

  //eyeshadow
  fill(70);
  circle(centerX-40,centerY-10,d/2);
  circle(centerX+40,centerY-10,d/2);
  
  //eyes
  fill(0);
  circle(centerX-30,centerY-15,15);
  circle(centerX+30,centerY-15,15);

  //nose
  fill(0);
  ellipse(centerX,centerY+30,40,20);

  //bamboo
  fill(156,197,139);
  rect(centerX,340,30,150);
  fill(213,232,205);
  rect(centerX,310,30,10);
  rect(centerX,370,30,10);
  
  //arms
  fill(70);
  ellipse(centerX-70,330,130,70);
  ellipse(centerX+70,330,130,70);
}
