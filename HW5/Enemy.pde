class Enemy extends Ellipse
{
  Vector2 position;
  Vector2 velocity;

  Enemy(Vector2 pos)
  {
    super(pos, 50, 50, color(0,255,255));
    
    position = pos;
  }
  
  void Display()
  {
    super.Display();
  }
  
  boolean Collide(Shape b)
  {
    float dx = position.x - b.position.x;
    float dy = position.y - b.position.y;
    float distance = sqrt(dx*dx + dy*dy);
    if(distance < 30)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
}
