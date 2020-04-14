float _angnoise, _radiusnoise;
float _xnoise, _ynoise;
float _angle = -PI/2;
float _radius;
float _rStrokeCol = 50;
float _gStrokeCol = 100;
float _bStrokeCol = 150;

int _rStrokeChange = -1;
int _gStrokeChange = -1;
int _bStrokeChange = -1;

void setup()
{
  size(2160, 1215);
  smooth();
  frameRate(30);
  background(255);
  noFill();
  
  _angnoise = random(10);
  _radiusnoise = random(10);
  _xnoise = random(10);
  _ynoise = random(10);
}

void draw()
{
  _radiusnoise += 0.005;
  _radius = (noise(_radiusnoise) * 1024) + 1;
  
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
  
  float centerx = width/2 + (noise(_xnoise) * 200);
  float centery = height/2 + (noise(_ynoise) * 200);
  
  float rad = radians(_angle);
  float x1 = centerx + (_radius * cos(rad)*10);
  float y1 = centery + (_radius * sin(rad)*10);
  
  float opprad = rad + PI;
  float x2 = centerx + (_radius * cos(opprad)*10);
  float y2 = centery + (_radius * sin(opprad)*10);
  
  _rStrokeCol += _rStrokeChange;
  if (_rStrokeCol > 254) {
    _rStrokeChange = -1;
  }
  
  if (_rStrokeCol < 0)
  {
    _rStrokeChange = 1;
  }
  
  _gStrokeCol += _gStrokeChange;
  if (_gStrokeCol > 254) {
    _gStrokeChange = -1;
  }
  
  if (_gStrokeCol < 0)
  {
    _gStrokeChange = 1;
  }
  
  _bStrokeCol += _bStrokeChange;
  if (_bStrokeCol > 254) {
    _bStrokeChange = -1;
  }
  
  if (_bStrokeCol < 0)
  {
    _bStrokeChange = 1;
  }
  
  stroke(_rStrokeCol, _gStrokeCol, _bStrokeCol, 60);
  line(x1, y1, x2, y2);
}
