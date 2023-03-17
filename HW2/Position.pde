class Position
{
  float x,y;
  
  Position()
  {
    x = 0;
    y = 0;
  }
  
  Position(float a, float b)
  {
    x = a;
    y = b;
  }
  
  void Set(float a, float b)
  {
    x = a;
    y = b;
  }
  void Set(Position pos)
  {
    x = pos.x;
    y = pos.y;
  }
}
