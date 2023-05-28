import processing.net.*;

Renderer renderer = new Renderer();
Tank myTank;
Tank otherTank;

Vector2 myTankPos = new Vector2(300, 300);
Vector2 otherTankPos = new Vector2(-300, -300);

int isBulletFired = 0;

Client c;
String input;
float data[];

//Protocol structure: tank_x  tank_y  angle   isBulletFired \n
//                    data[0] data[1] data[2] data[3]


void setup()
{
  size(600, 600);

  background(0);
  stroke(0);
  rectMode(CENTER);

  renderer.bgColor = color(0);

  c = new Client(this, "127.0.0.1", 12345);

  myTank = new Tank(myTankPos, color(0,255,0));
  otherTank = new Tank(otherTankPos, color(255,0,0));

}

void draw()
{
  background(0);

  UserInput();

  renderer.Update();

  myTank.angle = myTank.CannonAngle();

  myTank.Update(myTankPos.x, myTankPos.y);
  otherTank.Update(otherTankPos.x, otherTankPos.y);

  c.write(myTankPos.x + " " + myTankPos.y + " " + myTank.angle + " " + isBulletFired + "\n");
  if (isBulletFired == 1)
  {
    thread("BulletFireReset");
  }

  if (c.available() > 0)
  {
    input = c.readString();
    input = input.substring(0, input.indexOf("\n"));
    data = float(split(input, ' '));

    println(data[0] + ", " + data[1] + ", " + data[2] + ", " + data[3]);
    otherTankPos.x = data[0];
    otherTankPos.y = data[1];
    otherTank.angle = data[2];
    if (data[3] == 1)
    {
      Bullet _bullet = new Bullet(new Vector2(otherTankPos.x, otherTankPos.y), new Vector2(cos(otherTank.angle), sin(otherTank.angle)));
      _bullet.speed = 10;
      renderer.Add(_bullet);
    }
  }
}

void UserInput()
{
  if (keyPressed)
  {
    if (key == 'w')
    {
      myTankPos.y--;
    }
    if (key == 's')
    {
      myTankPos.y++;
    }
    if (key == 'a')
    {
      myTankPos.x--;
    }
    if (key == 'd')
    {
      myTankPos.x++;
    }
  }
  if (mousePressed)
  {
    if (mouseButton == LEFT && myTank.CanFire())
    {
      Bullet _bullet = new Bullet(new Vector2(myTankPos.x, myTankPos.y), new Vector2(cos(myTank.CannonAngle()), sin(myTank.CannonAngle())));
      _bullet.speed = 10;
      renderer.Add(_bullet);
      isBulletFired = 1;
    }
  }
}

void BulletFireReset()
{
  delay(50);
  isBulletFired = 0;
}
