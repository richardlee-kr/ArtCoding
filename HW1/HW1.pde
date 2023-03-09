class Shape
{
  float xPos, yPos, size;
  int r,g,b;
  Shape(float x, float y, int _r, int _g, int _b, float s)
  {
    xPos = x;
    yPos = y;
    r = _r;
    g = _g;
    b = _b;
    size = s;
  }
  
  void Display()
  {
    fill(r,g,b);
  }
}

class Square extends Shape
{
  Square(float x, float y, int _r, int _g, int _b, float s)
  {
    super(x,y,_r,_g,_b,s);
  }
  
  void Display()
  {
    super.Display();
    square(xPos,yPos,size);
  }
}
class Circle extends Shape
{
  Circle(float x, float y, int _r, int _g, int _b, float r)
  {
      super(x,y,_r,_g,_b,r);
  }
  
  void Display()
  {
    super.Display();
    circle(xPos,yPos,size);
  }
}


ArrayList<Shape> shapes = new ArrayList<Shape>();
Shape shapeToDraw;

void setup()
{
  size(400, 400);
  background(0);
  rectMode(CENTER);
  noStroke();
}

void draw()
{
  background(0);
  for(int i = 0; i < shapes.size(); i++)
  {
    shapes.get(i).Display();
  }
  if(shapeToDraw != null)
  {
    shapeToDraw.xPos = mouseX;
    shapeToDraw.yPos = mouseY;
    shapeToDraw.Display();
    
    if(mousePressed && mouseButton == LEFT)
    {
      shapes.add(shapeToDraw);
      
      shapeToDraw = null;
    }
  }
}

void keyPressed()
{
  if(key == 'e')
  {
    shapeToDraw = new Circle(mouseX, mouseY, 255,255,255, 50);
  }
  if(key == 'r')
  {
    shapeToDraw = new Square(mouseX, mouseY, 255,255,255, 50);
  }
}


void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  if(shapeToDraw != null)
  {
    if(shapeToDraw.size > 0 && shapeToDraw.size < 200)
    {
        shapeToDraw.size -= e*5;
    }
  }
}
