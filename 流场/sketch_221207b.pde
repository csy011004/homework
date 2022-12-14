//粒子数
int num = 20000;
//存放粒子的数组
Particle[] particles = new Particle[num];
PImage img ;


void setup() {
  size(1000, 1000,P3D);//or(800,800)
  noStroke();
  img = loadImage("girl.png");//or "man.png"
  
  //迭代生成所有粒子
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height));
    float rad = random(TWO_PI);
    PVector speed = new PVector(0, 0);
    PVector acc = new PVector(cos(rad), sin(rad));
    particles[i]= new Particle(loc, speed, acc);
  }
}

void draw() {
  //半透明背景
  fill(255, 10);
  noStroke();
  rect(0, 0, width, height);
  fill(0, 155);  
  
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
}

//粒子数据类型
class Particle {
  //属性
  PVector loc, speed, acc;
  color col;
  color c;
  float rad;
  float maxVel = 1.0;
  float w = 500.0;
  float h = 500.0;
  float f = 1000.0;
  //构造函数
  Particle(PVector _loc, PVector _speed, PVector _acc) {
    loc   = _loc;
    speed = _speed;
    acc   = _acc;
  }

  Particle() {
    loc = new PVector(random(width*1.2), random(height));
    rad = random(TWO_PI);
    speed = new PVector(0, 0);
    acc = new PVector(cos(rad), sin(rad));
  }

  //运动，渲染，越界函数打包在一个函数里
  void run() {
    move();
    checkEdges();
    render();
  }
  //运动函数
  void move() {
    float deg = 360.0*noise(
      loc.x/w, 
      loc.y/h, 
      millis()/10000.0);

    rad=radians(deg);

    acc.set(cos(rad), sin(rad));

    speed.add(acc);
    if (speed.magSq()>maxVel) {
      speed.normalize();
      speed.mult(maxVel);
    }
    loc.add(speed);
  }
  //超出窗口就随机一个窗口内位置
  void checkEdges() {
    if (loc.x<0 || loc.x>width || loc.y<0 || loc.y>height) {    
      loc.x = random(width*1.2);
      loc.y = random(height);
    }
  }
  //渲染
  void render() {
    c = img.get(int(loc.x),int(loc.y));
    if(brightness(c) < 152){
      fill(0);
      ellipse(loc.x, loc.y, 2, 2);
    }
    else{
      noFill();
      noStroke();
      ellipse(loc.x, loc.y, 2, 2);
    }
  }
}
