Renderer renderer = new Renderer();
Tank tankPlayer;

Vector2 playerPos = new Vector2(300,300);

void setup()
{
  size(600,600);
  
  tankPlayer = new Tank(playerPos);
  
  noStroke();
  background(0);
  rectMode(CENTER);
  
  renderer.bgColor = color(0);
}

void draw()
{
  background(0);
  UserInput();
  
  renderer.Update();
  tankPlayer.Update(playerPos.x, playerPos.y);
}

void UserInput()
{
  if(keyPressed)
  {
    if(key == 'w')
    {
      playerPos.y--;
    }
    if(key == 's')
    {
      playerPos.y++;
    }
    if(key == 'a')
    {
      playerPos.x--;
    }
    if(key == 'd')
    {
      playerPos.x++;
    }
  }
  if(mousePressed)
  {
    if(mouseButton == LEFT && tankPlayer.CanFire())
    {
      Bullet _bullet = new Bullet(new Vector2(playerPos.x, playerPos.y), new Vector2(cos(tankPlayer.CannonAngle()),sin(tankPlayer.CannonAngle())));
      _bullet.speed = 10;
      renderer.Add(_bullet);
    }
  }
}
