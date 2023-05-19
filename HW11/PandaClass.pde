class Panda
{
  float x;
  float y;
  
  float vx;
  float vy;
  
  float d;
  
  float angle;
  float rotSpeed;
  
  Hat hat;
  
  Panda(float a, float b)
  {
    x = a;
    y = b;
    vx = random(-5,5);
    vy = random(-5,5);
    d = random(10, 30);
    rotSpeed = random(20, 50);
    angle = 0;
    
    hat = new Hat(0,-d,d/20);
  }
  
  void Collide(Panda p)
  {
    float dist = sqrt((x-p.x)*(x-p.x)+(y-p.y)*(y-p.y));
    if(dist < (d+p.d))
    {
      float vx1i, vy1i, vx2i, vy2i;
      float vx1f, vy1f, vx2f, vy2f;
      float m1, m2;
      
      //define Velocity and mass
      vx1i = vx;
      vy1i = vy;
      vx2i = p.vx;
      vy2i = p.vy;
      m1 = d;
      m2 = p.d;
      
      //perfectly elastic collision
      vx1f = ((m1-m2)/(m1+m2)) * vx1i + ((2*m2)/(m1+m2)) * vx2i;
      vy1f = ((m1-m2)/(m1+m2)) * vx1i + ((2*m2)/(m1+m2)) * vy2i;
      
      vx2f = ((2*m1)/(m1+m2)) * vx1i + ((m2-m1)/(m1+m2)) * vx2i;
      vy2f = ((2*m1)/(m1+m2)) * vy1i + ((m2-m1)/(m1+m2)) * vy2i;
      
      //Assign velocity
      vx = vx1f;
      vy = vy1f;
      p.vx = vx2f;
      p.vy = vy2f;
      
      //float _vx = vx;
      //float _vy = vy;
      //vx = p.vx;
      //vy = p.vy;
      //p.vx = _vx;
      //p.vy = _vy;
    }
  }
  
  void Draw()
  {
    pushMatrix();
    translate(x,y);
    rotate(angle);
    
    Move();
    
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
    
    hat.Draw();
    
    popMatrix();
  }
  
  void Move()
  {
    x += vx;
    y += vy;
    if(x > width-d || x < d)
    {
      vx = -vx;
    }
    if(y > height-d || y < d)
    {
      vy = -vy;
    }
  }
}
