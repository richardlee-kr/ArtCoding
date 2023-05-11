enum Status
{
  None,
  drawRect,
  drawEllipse,
  drawLine,
  drawVertexShape
};

class Drawer
{
  color bgColor;
  ArrayList<Shape> shapes = new ArrayList<Shape>();
  ArrayList<Shape> UI = new ArrayList<Shape>();
  Shape shapeToDraw;
  
  Rect r;b
  Ellipse e;
  Line l;
  VertexShape v;
  ArrayList<Position> points = new ArrayList<Position>();
  ArrayList<Ellipse> pins = new ArrayList<Ellipse>();
  
  Status status = Status.None;
  
  Drawer(color c)
  {
    bgColor = c;
  }
  
  void StartDrawRect(float startX, float startY)
  {
    r = new Rect(startX, startY, abs(startX-mouseX), abs(startY-mouseY), color(255));
    shapeToDraw = r;
  }
  void DrawingRect()
  {
    r.Width = abs(r.position.x-mouseX);
    r.Height = abs(r.position.y-mouseY);
  }
  
  void StartDrawEllipse(float startX, float startY)
  {
    e = new Ellipse(startX, startY, abs(startX-mouseX), abs(startY-mouseY), color(255));
    shapeToDraw = e;
  }
  void DrawingEllipse()
  {
    if(keyPressed && key == SHIFT)
    {
      e.minor = e.major;
    }
    e.major = abs(e.position.x-mouseX);
    e.minor = abs(e.position.y-mouseY);
  }
  
  void StartDrawLine(float startX, float startY)
  {
    l = new Line(new Position(startX, startY), new Position(mouseX, mouseY));
    shapeToDraw = l;
  }
  void DrawingLine()
  {
    l.end.x = mouseX;
    l.end.y = mouseY;
  }
  
  void StartDrawVertexShape(float startX, float startY)
  {
    points.add(new Position(startX, startY));
    v = new VertexShape(points, color(255));
  }
  void AddPoint(float x, float y)
  {
    v.Add(x,y);
    pins.add(new Ellipse(x,y, 5,5, color(255,0,0)));
  }
  
  void Add(Shape s)
  {
    shapes.add(s);
  }
  void AddUI(Shape s)
  {
    UI.add(s);
  }
  
  void Reset()
  {
    shapeToDraw = null;
    r = null;
    e = null;
    l = null;
    v = null;
    pins.clear();
    points.clear();
  }
  
  void Update()
  {
    background(bgColor);
    for(int i = 0; i < shapes.size(); i++)
    {
      if(shapes.get(i) != null)
        shapes.get(i).Display();
      else
        shapes.remove(i);
    }
    for(int i = 0; i < pins.size(); i++)
    {
      pins.get(i).Display();
    }
    if(shapeToDraw != null)
    {
      shapeToDraw.Display();
    }
    for(int i = 0; i < UI.size(); i++)
    {
      UI.get(i).Display();
    }
  }
}
