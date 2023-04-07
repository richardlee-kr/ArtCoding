Renderer renderer = new Renderer();
Tank tankPlayer;

Vector2 playerPos = new Vector2(300,300);

ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

int enemySpawnTime = 3000;
int time;

void setup()
{
  size(600,600);
  
  time = millis();
  
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
  LogicUpdate();
  tankPlayer.Update(playerPos.x, playerPos.y);
}

void LogicUpdate()
{
  if(millis() - time >= enemySpawnTime)
  {
    Enemy _e = new Enemy(new Vector2(random(0,width),random(0,height)));
    enemyList.add(_e);
    time = millis();
  }
  
  Loop1:
  for(int j = 0; j < renderer.shapes.size(); j++)
  {
    for(int i = 0; i < enemyList.size(); i++)
    {
      if(enemyList.get(i).Collide(renderer.shapes.get(j)))
      {
        enemyList.remove(i);
        renderer.shapes.remove(j);
        break Loop1;
      }
    }
  }
  
  for(int i = 0; i < enemyList.size(); i++)
  {
    if(enemyList.get(i) != null)
      enemyList.get(i).Display();
    else
      enemyList.remove(i);
  }
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
