class Tank
{
  Shape body;
  Shape cannon;
  
  Vector2 position;
  float scale = 50;
  
  float fireRate = 10;
  float startTime = 0;
  float elapsedTime = 0;
  
  Tank(Vector2 pos)
  {
    position = pos;
    body = new Ellipse(pos, scale, scale, color(124));
    cannon = new Rect(new Vector2(position.x + scale*0.5, position.y), scale, scale*0.25, color(255));
    body.noStroke = true;
    cannon.noStroke = true;
  }
  
  float CannonAngle()
  {
    return atan2(mouseY - position.y, mouseX - position.x);    
  }
  
  boolean CanFire()
  {
    if(elapsedTime >= (1/fireRate) * 1000)
    {
      startTime = millis();
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void Update(float x, float y)
  {
    elapsedTime = millis() - startTime;
    
    position.Set(x,y);
    
    body.position = new Vector2(x,y);
    body.Display();
    
    pushMatrix();
    translate(x,y);
    rotate(CannonAngle());
    cannon.position = new Vector2(scale*0.5,0);
    cannon.Display();
    popMatrix();
  }
}
