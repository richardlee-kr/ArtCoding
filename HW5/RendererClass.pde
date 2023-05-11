class Renderer
{
  color bgColor;
  ArrayList<Shape> shapes = new ArrayList<Shape>();
  
  Renderer()
  {
    bgColor = color(255);
  }
  Renderer(color c)
  {
    bgColor = c;
  }
  
  void Add(Shape s)
  {
    shapes.add(s);
  }
  
  void Clear()
  {
    shapes.clear();
  }
  
  void Update()
  {
    background(bgColor);
    
    for(int i = 0; i <  shapes.size(); i++)
    {
      if(shapes.get(i) != null)
        shapes.get(i).Display();
      else
        shapes.remove(i);
    }
  }
}
