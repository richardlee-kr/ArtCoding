PShape s;
float ry = 0;

void setup()
{
  size(800,800,P3D);
  
  s = loadShape("Stander.obj");
}

void draw()
{
  background(0);
  translate(width/2, height/2);
  sphere(100);
  rotateX(PI);
  rotateY(ry);
  shape(s, 0, 0);
  
  ry += 0.02;
}
