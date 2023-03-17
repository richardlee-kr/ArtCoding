class Shape
{
  Position position = new Position();
  color Color;
  color strokeColor = color(0);
  float weight = 1;
  boolean noFill;
  boolean noStroke;
  boolean visible = true; //<>//
  
  String type;
  
  void Display()
  {
    fill(Color);
    stroke(strokeColor);
    strokeWeight(weight);
    if(noStroke) noStroke();
    if(noFill) noFill();
    if(!visible)
    {
      noFill();
      noStroke();
    }
  }
}

class Rect extends Shape
{
  float Width, Height;
  Rect(float xPos, float yPos, float w, float h, color c)
  {
    position.Set(xPos, yPos);
    Color = c;
    Width = w;
    Height = h;
    type = "Rect";
  }
  
  void Display()
  {
    super.Display();
    rect(position.x, position.y, Width, Height);
  }
}

class Button extends Rect
{
  color defaultColor;
  color overColor;
  Button(float xPos, float yPos, float w, float h, color c1, color c2)
  {
    super(xPos, yPos, w, h, c1);
    defaultColor = c1;
    overColor = c2;
  }
  
  boolean overEvent()
  {
    if (mouseX > position.x && mouseX < position.x+Width && mouseY > position.y && mouseY < position.y+Height)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void Display()
  {
    if(overEvent())
    {
      fill(overColor);
      stroke(strokeColor);
      strokeWeight(weight);
      if(noStroke) noStroke();
      if(noFill) noFill();
      rect(position.x, position.y, Width, Height);
    }
    else
    {
      fill(defaultColor);
      stroke(strokeColor);
      strokeWeight(weight);
      if(noStroke) noStroke();
      if(noFill) noFill();
      rect(position.x, position.y, Width, Height);
    }
  }
}

class Ellipse extends Shape
{
  float major, minor;
  Ellipse(float xPos, float yPos, float a, float b, color c)
  {
    position.Set(xPos, yPos);
    Color = c;
    major = a;
    minor = b;
    type = "Ellipse";
  }
  
  void Display()
  {
    super.Display();
    ellipse(position.x, position.y, major, minor);
  }
}

class Line extends Shape
{
  Position start, end;
  Line(Position s, Position e)
  {
    start = s;
    end = e;
    type = "Line";
  }
  Line(float startX, float startY, float endX, float endY)
  {
    start = new Position(startX, startY);
    end = new Position(endX, endY);
    type = "Line";
  }
  
  void Display()
  {
    super.Display();
    line(start.x, start.y, end.x, end.y);
  }
}

class VertexShape extends Shape
{
  ArrayList<Position> vertexs = new ArrayList<Position>();
  
  VertexShape(ArrayList<Position> pos, color c)
  {
    position.Set(Center(pos));
    Color = c;
    type = "VertexShape";
  }
  
  Position Center(ArrayList<Position> pos)
  {
    float _x = 0;
    float _y = 0;
    for(int i = 0; i < pos.size(); i++)
    {
      _x += pos.get(i).x;
      _y += pos.get(i).y;
    }
    
    _x /= pos.size();
    _y /= pos.size();
    
    return new Position(_x,_y);
  }
  
  void Add(float x, float y)
  {
    vertexs.add(new Position(x,y));
    position = Center(vertexs);
  }
  
  void Display()
  {
    super.Display();
    beginShape();
    for(int i = 0; i < vertexs.size(); i++)
    {
      vertex(vertexs.get(i).x, vertexs.get(i).y);
    }
    if(vertexs.size() > 0)
      vertex(vertexs.get(0).x, vertexs.get(0).y);
    endShape();
  }
}
