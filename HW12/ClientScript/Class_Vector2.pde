class Vector2
{
  float x, y;

  Vector2()
  {
    x = 0;
    y = 0;
  }
  Vector2(float a, float b)
  {
    x = a;
    y = b;
  }

  void Set(Vector2 pos)
  {
    x = pos.x;
    y = pos.y;
  }
  void Set(float a, float b)
  {
    x = a;
    y = b;
  }

  float GetMagnitude()
  {
    return sqrt(x*x+y*y);
  }

  void Normalize()
  {
    x = x / GetMagnitude();
    y = y / GetMagnitude();
  }
}
