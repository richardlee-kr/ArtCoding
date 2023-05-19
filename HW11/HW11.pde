ArrayList<Panda> pandas = new ArrayList<Panda>();

void setup()
{
  size(600,600);
  background(124);
}

void draw()
{
  background(124);
  
  if(mousePressed)
  {
    if(mouseButton == RIGHT)
    {
      AddPanda();
    }
  }
  
  for(int i = 0; i < pandas.size(); i++)
  {
    pandas.get(i).Draw();
  }
  
  for(int i = 0; i < pandas.size(); i++)
  {
    if(i != pandas.size()-1)
    {
      for(int j = i+1; j < pandas.size(); j++)
      {
        pandas.get(i).Collide(pandas.get(j));
      }
    }
  }
}

void mouseClicked()
{
  if(mouseButton == LEFT)
  {
    AddPanda();
  }
}

void AddPanda()
{
    Panda _panda = new Panda(random(40,width-40), random(40,height-40));
    pandas.add(_panda);
}
