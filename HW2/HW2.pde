boolean drawing;
boolean drawingRect;
boolean drawingEllipse;
boolean drawingLine;
boolean drawingVertexShape;

boolean firstMousePress = false;
boolean strokeToggle = true;

HScrollbar r,g,b;
Rect colorPreview = new Rect(300,625,50,50,color(0));
color previewColor = color(0);
Button strokeButton = new Button(530,630,40,40,color(255), color(200));
Line stroke = new Line(535,635,565,665);

Drawer drawer = new Drawer(255);
Shape shapeToAdd;

void setup()
{
  size(600,700);
  background(255);
  
  r = new HScrollbar(0,620,280,25,5, color(255,55,55));
  g = new HScrollbar(0,650,280,25,5, color(55,255,55));  
  b = new HScrollbar(0,680,280,25,5, color(55,55,255));  

  r.newspos = 255;
  g.newspos = 0;
  b.newspos = 0;
  
  Rect menu = new Rect(0,600,600,100, color(200));
  menu.noStroke = true;
  
  stroke.weight = 3;
  
  drawer.AddUI(menu);
  drawer.AddUI(colorPreview);
  drawer.AddUI(strokeButton);
  drawer.AddUI(stroke);
}

void draw()
{
  if(drawingRect)
  {
    drawer.DrawingRect();
  }
  if(drawingEllipse)
  {
    drawer.DrawingEllipse();
  }
  if(drawingLine)
  {
    drawer.DrawingLine();
  }
  if(drawingVertexShape)
  {
    if(mousePressed && mouseButton == LEFT)
    {
      drawer.AddPoint(mouseX, mouseY);
    }
    if(mousePressed && mouseButton == RIGHT)
    {
      drawing = false;
      drawer.Add(shapeToAdd);
      ResetDrawing();
      drawer.Reset();
      drawer.status = Status.None;
    }
  }
  
  drawer.Update();
  r.update();
  g.update();
  b.update();
  r.display();
  g.display();
  b.display();
  
  previewColor = color(r.spos, g.spos, b.spos);
  colorPreview.Color = previewColor;
  
  if (firstMousePress) 
  {
    firstMousePress = false;
  }
  
  println(strokeToggle);
}

void ResetDrawing()
{
  drawingRect = false;
  drawingEllipse = false;
  drawingLine = false;
  drawingVertexShape = false;
}

void mousePressed()
{
  if(mouseButton == LEFT)
  {
    if (!firstMousePress) 
    {
      firstMousePress = true;
    }
    if(strokeButton.overEvent())
    {
      strokeToggle = !strokeToggle;
      stroke.visible = strokeToggle;
    }
    if(drawing)
    {
      if(drawer.status != Status.None && drawer.status != Status.drawVertexShape)
      {
        drawing = false;
        drawer.Add(shapeToAdd);
        drawer.Reset();
        ResetDrawing();
        drawer.status = Status.None;
      }
    }
    else
    {
      if(drawer.status == Status.None)
        return;
      
      drawing = true;
      if(drawer.status == Status.drawRect)
      {
        drawer.StartDrawRect(mouseX, mouseY);
        shapeToAdd = drawer.r;
        drawer.r.noStroke = !strokeToggle;
        drawer.r.Color = previewColor;
        drawingRect = true;
      }
      if(drawer.status == Status.drawEllipse)
      {
        drawer.StartDrawEllipse(mouseX, mouseY);
        shapeToAdd = drawer.e;
        drawer.e.noStroke = !strokeToggle;
        drawer.e.Color = previewColor;
        drawingEllipse = true;
      }
      if(drawer.status == Status.drawLine)
      {
        drawer.StartDrawLine(mouseX, mouseY);
        shapeToAdd = drawer.l;
        drawer.l.strokeColor = previewColor;
        drawingLine = true;
      }
      if(drawer.status == Status.drawVertexShape)
      {
        drawer.StartDrawVertexShape(mouseX, mouseY);
        shapeToAdd = drawer.v;
        drawer.v.noStroke = !strokeToggle;
        drawer.v.Color = previewColor;
        drawingVertexShape = true;
      }
    }
  }
}

void mouseWheel(MouseEvent event)
{
  float e = event.getCount();
  if(drawing)
  {  
    if(drawer.shapeToDraw.type == "Line")
    {
      if(drawer.l.weight > 0)
        drawer.l.weight -= e;
    }
  }
}

void keyPressed()
{
  if(key == 'r')
    drawer.status = Status.drawRect;
  if(key == 'e')
    drawer.status = Status.drawEllipse;
  if(key == 'l')
    drawer.status = Status.drawLine;
  if(key == 'v')
    drawer.status = Status.drawVertexShape;
  if(key == ESC)
  {
    key = 0;
    shapeToAdd = null;
    drawer.Reset();
    ResetDrawing();
    drawer.status = Status.None;
  }
  if(keyCode == 90)
  {
    if(drawer.shapes.size() > 0)
      drawer.shapes.remove(drawer.shapes.size()-1);
  }
}
