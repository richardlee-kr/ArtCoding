class Hat
{
  float x;
  float y; 
  float d;

  Hat(float l, float m, float n)
  {
    x=l;
    y=m;
    d=n;
  }

    void Draw()
    {
    fill(255);
    stroke(0);
    ellipse(x, y+5*d/2, 24*d, 12*d);
    ellipse(x, y+2*d, 19*d, 8*d);
    fill(0);
    arc(x, y+2*d, 18*d, 5*d, 0, PI);
    fill(255);
    quad(x-9*d, y+2*d, x+9*d, y+2*d, x+7*d, y-7*d+d/6, x-7*d, y-7*d+d/6);
    ellipse(x, y-7*d+d/6, 14*d, 3*d);
    //beginShape();
    //vertex(x-7*d, y-7*d+d/6);
    //bezierVertex(x-8*d, y-4*d-d/2, x-7*d-3*d/10, y-3*d-d/10, x-32*d/5, y-19*d/5);
    //bezierVertex(x-27*d/5, y-9*d/2, x-9*d/2, y-7*d/2, x-4*d, y-5*d/2);
    //bezierVertex(x-19*d/5, y-55*d/55, x-66*d/30, y-55*d/30, x-2*d, y-5*d/2);
    //bezierVertex(x-3*d/2, y-7*d/2, x-d/6, y-7*d/2, x, y-5*d/2);
    //bezierVertex(x+d/5, y-2*d, x+24*d/30, y-59*d/30, x+d, y-5*d/2);
    //bezierVertex(x+3*d/2, y-114*d/30, x+105*d/30, y-105*d/30, x+110*d/30, y-80*d/30);
    //bezierVertex(x+5*d, y+d/2, x+6*d, y-d/2, x+174*d/30, y-75*d/30);
    //bezierVertex(x+174*d/30, y-75*d/30, x+171*d/30, y-105*d/30, x+195*d/30, y-55*d/30);
    //bezierVertex(x+7*d, y-35*d/30, x+255*d/30, y-105*d/30, x+7*d, y-7*d);
    //endShape();
    //fill(0);
    //ellipse(x-d, y-d/6, d, 2*d);
    //ellipse(x+d, y-d/6, d, 2*d);
  }
}
