int COUNT = 150;

float[] pt;
int[] style;

void setup()
{
  size(800, 800, P3D);
  background(255);

  pt = new float[6 * COUNT];
  style = new int[2 * COUNT];

  int index = 0;
  for (int i = 0; i < COUNT; i++) {
    pt[index++] = random(2*PI); //rotX
    pt[index++] = random(2*PI); //rotY

    pt[index++] = random(60, 80); //degree

    pt[index++] = int(random(2, 50)*5); //radian

    pt[index++] = random(4, 32); //width

    pt[index++] = radians(random(5, 30)) / 5; //speed

    float prob = random(100);
    if (prob < 50)
    {
      style[i*2] = colorBlended(random(1), 200, 255, 0, 50, 120, 0, 210);
    }
    else if (prob <90)
    {
      style[i*2] = colorBlended(random(1), 255, 100, 0, 255, 255, 0, 210);
    }
    else
    {
      style[i*2] = color(255, 255, 255, 220);
    }

    style[i*2+1] = floor(random(100)) % 3;
  }
}


void draw()
{
  background(0);

  translate(width/2, height/2, 0);
  rotateX(PI / 6);
  rotateY(PI / 6);

  int index = 0;
  for (int i = 0; i < COUNT; i++)
  {
    pushMatrix();
    rotateX(pt[index++]);
    rotateY(pt[index++]);

    if (style[i*2+1] == 0)
    {
      stroke(style[i*2]);
      noFill();
      strokeWeight(1);
      arcLine(0, 0, pt[index++], pt[index++], pt[index++]);
    }
    else if (style[i*2+1] == 1)
    {
      fill(style[i*2]);
      noStroke();
      arcLineBars(0, 0, pt[index++], pt[index++], pt[index++]);
    }
    else
    {
      fill(style[i*2]);
      noStroke();
      arc(0, 0, pt[index++], pt[index++], pt[index++]);
    }

    pt[index-5] += pt[index] / 10;
    pt[index-4] += pt[index++] / 20;

    popMatrix();
  }
}


int colorBlended(float fract, float r, float g, float b, float r2, float g2, float b2, float a)
{
  return color(r + (r2 - r) * fract, g + (g2 - g) * fract, b + (b2 - b) * fract, a);
}


void arcLine(float x, float y, float degrees, float radius, float w)
{
  int lineCount = floor(w/2);

  for (int j = 0; j < lineCount; j++)
  {
    beginShape();
    for (int i = 0; i < degrees; i++)
    {
      float angle = radians(i);
      vertex(x + cos(angle) * radius,
        y + sin(angle) * radius);
    }
    endShape();
    radius += 2;
  }
}

void arcLineBars(float x, float y, float degrees, float radius, float w)
{
  beginShape(QUADS);
  for (int i = 0; i < degrees/4; i += 4)
  {
    float angle = radians(i);
    vertex(x + cos(angle) * radius, y + sin(angle) * radius);
    vertex(x + cos(angle) * (radius+w), y + sin(angle) * (radius+w));

    angle = radians(i+2);
    vertex(x + cos(angle) * (radius+w), y + sin(angle) * (radius+w));
    vertex(x + cos(angle) * radius, y + sin(angle) * radius);
  }
  endShape();
}


void arc(float x, float y, float degrees, float radius, float w)
{
  beginShape(QUAD_STRIP);
  for (int i = 0; i < degrees; i++)
  {
    float angle = radians(i);
    vertex(x + cos(angle) * radius, y + sin(angle) * radius);
    vertex(x + cos(angle) * (radius+w), y + sin(angle) * (radius+w));
  }
  endShape();
}
