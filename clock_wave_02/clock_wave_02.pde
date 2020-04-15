import processing.opengl.*;

float _angnoise, _radiusnoise;
float _xnoise, _ynoise, _znoise;
float _angle = -PI/2;
float _radius;
float _StrokeCol = 50;
int _StrokeChange = -1;

int zpos = height;

void setup()
{
  size(2560, 1440, OPENGL);
  smooth();
  frameRate(30);
  background(255);
  noFill();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
  _znoise = random(10);
}

void draw()
{
  zpos += 1;
  camera(width/2, height/2, zpos, width/2, height/2, height/2, width/2, height/2, height/2);
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 550) + 1;
  
  _angnoise += 0.005;
  _angle += (noise(_angnoise) * 6) - 3;
  
  if (_angle > 360) {
    _angle -= 360;
  }
  
  if (_angle < 0)
  {
    _angle += 360;
  }
  
  _xnoise += 0.01;
  _ynoise += 0.01;
  _znoise += 0.01;
  
  float centerx = width/2 + (noise(_xnoise) * 100)-50;
  float centery = height/2 + (noise(_ynoise) * 100)-50;
  float centerz = height/2 + (noise(_znoise) * 100)-50;
  
  float rad = radians(_angle);
  float x1 = centerx + (_radius * cos(rad));
  float y1 = centery + (_radius * sin(rad));
  float z1 = centery + (_radius * sin(rad));
  
  float opprad = rad + PI;
  float x2 = centerx + (_radius * cos(opprad));
  float y2 = centery + (_radius * sin(opprad));
  float z2 = centery + (_radius * cos(opprad));
  
  _StrokeCol += _StrokeChange;
  if (_StrokeCol > 254) {
    _StrokeChange = -1;
  }
  
  if (_StrokeCol < 0)
  {
    _StrokeChange = 1;
  }
  
  stroke(_StrokeCol, 60);
  line(x1, y1, z1, x2, y2, z2);
}
