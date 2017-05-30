int h = int(random(360));
int q =  int(random(1, 4));
float r = random(200, 300);
float in1 = random(50, 300);
float in2 = random(50, 300);
vela v1;
velinha v2;
mastro m1;
mastro m2;
bandeirinha[] b1;
bandeirinha[] b2;
bandeirinha b3;
bandeirinha b4;
int s= 35;
int b= 80;
void setup() {
  frameRate(1);
  noStroke();
  size(1000, 500);
  colorMode(HSB, 360, 100, 100);
}

void draw() {
  //variaveis "globais"
  int h = int(random(360));
  int q =  int(random(1, 4));
  float r = random(200, 300);
  float in1 = random(50, 300);
  float in2 = random(50, 300);
  //construtores e afins
  m1 = new mastro(random(100, 200));
  m2 = new mastro(random(800, 980));
  b1 = new bandeirinha[q];
  b2 = new bandeirinha[q];
  b3= new bandeirinha(m1.vh-random(100, 120), random(0, 250));
  b4= new bandeirinha(m2.vh-random(140, 156), random(0, 250));
  v1 = new vela(r);
  v2 = new velinha(r+300);
  v2.h = 500-r/8;
  for (int i = 0; i<q; i++ ) {
    b1[i] = new bandeirinha(m1.vh+random(8, 17)*i, in1+random(40, 50)*i);
  }
  for (int i = 0; i<q; i++ ) {
    b2[i] = new bandeirinha(v1.x+200+random(8, 20)*i, in2+random(40, 50)*i);
  }
  //conteudo do draw
  background(h, s, b);
  beginShape();
  fill(h, s-20, b+10);
  vertex(1000, 0);
  bezierVertex(1081, 1609, 883, 505, v1.x, 500);
  bezierVertex(409, 492, 919, 514, 1000, -13);
  endShape();
  fill(h+120, s+20, b-30);
  m1.show();
  m2.show();
  fill(h-random(55,75), s+30, b-20);
  v1.show();
  fill(h-random(100,165), s+30, b-10);
  v2.show();
  for (int i = 0; i<q; i++ ) {
    if (i%2==0) {
      fill(h+90, s-20, b+20);
    } else {
      fill(h+30, s, b-10);
    }
    b1[i].show();
  }
  for (int i = 0; i<q; i++ ) {
    if (i%2==0) {
      fill(h+90, s-20, b+20);
    } else {
      fill(h+30, s, b-10);
    }
    b2[i].show();
  }
  fill(h+30, s, b-10);
  b3.show();
  b4.show();
}

class bandeirinha {
  float x;
  float y;
  bandeirinha(float a, float b) {
    x = a;
    y = b;
  }
  void show() {
    beginShape();
    vertex(x, y);
    vertex(x+40, y-15);
    vertex(x+20, y+5);
    vertex(x+45, y+10);
    vertex(x+5, y+25);
    endShape();
  }
}

class mastro {
  float vh;
  float vd;
  float wh;
  float wd;
  mastro(float h) {
    vh = h;
    vd = vh - random(15, 25);
    wh = vd - random(0, 100);
    wd = wh - (vh - vd);
  }
  void show() {
    quad(vd, 0, vh, 0, wh, 500, wd, 500);
  }
}

class vela {
  float x;
  float x2;
  float c1;
  float c2;
  float c3;
  float c4 = int(random(0, height/10));
  float c5 = int(random(0, height/2));
  float c6;
  float c;
  float h = 500;
  vela(float a) {
    x = a;
    x2 = x +random(20);
    c1 = int (random(x+70, x+90));
    c2 = int (random(x+200, x+260));
    c3 = int (random(x+120, x+220));
    c6 = int (random(x+200, x+270));
  }
  void show() { 
    beginShape();
    vertex(x2, 0);
    bezierVertex(c6, c4, c3, c2, x, h);
    bezierVertex(x+10, c6, c1, c1, x, 0);
    endShape();
  }
}
class velinha {
  float x;
  float x2;
  float c1;
  float c2;
  float c3;
  float c4 = int(random(0, height/10));
  float c5 = int(random(0, height/2));
  float c6;
  float c;
  float h = 470;
  velinha(float a) {
    x = a;
    x2 = x +random(20);
    c1 = 771;
    c2 = x+30;
    c3 = x+200;
    c6 = x-300;
  }
  void show() { 
    beginShape();
    vertex(x2, 0);
    bezierVertex(771, 90, 672, 368, x, h);
    bezierVertex(x-10, 500, 613, 231, x, 0);
    endShape();
  }
}