class Bullet extends Ellipse
{
  Vector2 position;
  Vector2 velocity;
  
  float speed = 1;

  Bullet(Vector2 pos, Vector2 vel)
  {
    super(pos, 10, 10, color(255,0,0));
    
    position = pos;
    velocity = vel;
  }
  
  void Display()
  {
    super.Display();
    
    position.x += velocity.x * speed;
    position.y += velocity.y * speed;
  }
}
