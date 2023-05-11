ArrayList<Panda> pandas = new ArrayList<Panda>();

void setup()
{
  size(600,600);
  background(124);
}

void draw()
{
  background(124);
  for(int i = 0; i < pandas.size(); i++)
  {
    pandas.get(i).Draw();
  }
}

void mouseClicked()
{
  Panda _panda = new Panda(mouseX, mouseY);
  pandas.add(_panda);
}
