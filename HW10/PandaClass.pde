class Panda
{
  float x;
  float y;
  
  float d;
  
  float angle;
  float rotSpeed;
  
  Panda(float a, float b)
  {
    x = a;
    y = b;
    d = random(50);
    rotSpeed = random(10, 30);
    angle = 0;
  }
  
  void Draw()
  {
    pushMatrix();
    translate(x,y);
    rotate(angle);
    //ears
    fill(70);
    noStroke();
    circle(-d*0.8,-d*0.8,d*0.8);
    circle(+d*0.8,-d*0.8,d*0.8);
    
    //face
    fill(255);
    stroke(0);
    circle(0,0,d*2);
  
    //cheek
    noStroke();
    fill(244,195,194,200);
    circle(-d*0.6,+d*0.2,d*0.45);
    circle(+d*0.6,+d*0.2,d*0.45);
  
    //eyeshadow
    fill(70);
    circle(-d*0.4,-d*0.1,d/2);
    circle(+d*0.4,-d*0.1,d/2);
    
    //eyes
    fill(0);
    circle(-d*0.3,-d*0.15,d*0.15);
    circle(+d*0.3,-d*0.15,d*0.15);
  
    //nose
    fill(0);
    ellipse(0,+d*0.3,d*0.4,d*0.2);
    angle += PI / rotSpeed;  
    
    popMatrix();
  }
}
