class Shape
{
  Vector2 position = new Vector2();
  
  color Color;
  color strokeColor;
  float weight = 1;
  
  boolean noStroke;
  boolean noFill;
  boolean visible = true;
  
  String type;
  
  void Display()
  {
    if(visible)
    {
      fill(Color);
      stroke(strokeColor);
      strokeWeight(weight);
      if(noStroke) noStroke();
      if(noFill) noFill();
    }
    else
    {
      noStroke();
      noFill();
    }
  }
  
  void CollideWith(Shape s) { }
}

class Rect extends Shape
{
  float Width, Height;
  Rect(Vector2 pos, float w, float h, color c)
  {
    position = pos;
    Color = c;
    Width = w;
    Height = h;
    type = "Rect";
  }
  Rect(float x, float y, float w, float h, color c)
  {
    position = new Vector2(x,y);
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
  
  void CollideWith(Shape s)
  {
    
  }
}

class Ellipse extends Shape
{
  float major, minor;
  
  Ellipse(Vector2 pos, float a, float b, color c)
  {
    position = pos;
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
  
  void CollideWith(Shape s)
  {
    
  }
}
