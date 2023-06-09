float rotX, rotZ;
float cx, cy, cz;
float tx, ty, tz;

int i=0;

boolean FPS = true;

void setup() {
  size(600, 400, P3D);
  frameRate(60);
}
void draw()
{
  background(124);

  if (FPS)
  {
    tx = 200*cos(radians(rotZ));
    ty = 200*sin(radians(rotZ));
    tz = 0;
    axis();
    camera(0, 0, 0, tx, ty, tz, 0, 0, 1);
  }
  else
  {
    axis();
    cx = 400*cos(radians(rotX));
    cy = 400*sin(radians(rotX));
    camera(cx, cy, 250, 0, 0, 0, 0, 0, -1);
  }

  UserInput();
}

void UserInput()
{
  if(keyPressed)
  {
    if (key == 'f')
      FPS = !FPS;
    if (key == 'a')
      rotX += 5;
    if (key == 'd')
      rotX -= 5;
  }

}
void mouseDragged()
{
  rotZ -= (mouseX - pmouseX) * 0.05;
}

void axis() {
  float r = 200;
  for (int i=0; i<360; i+=30) {
    float x = i/180.0-1.0;
    fill(x*x*255, 0, 255*(1-x*x));
    noStroke();
    translate(r*cos(radians(i)), r*sin(radians(i)), 0.);
    sphere(20);
    translate(-r*cos(radians(i)), -r*sin(radians(i)), 0.);
  }
}
