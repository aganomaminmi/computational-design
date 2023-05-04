PVector curPnt = new PVector (0, 0);
PVector prevPnt = new PVector (0, 0);

PVector p0 = new PVector(50, 50);
PVector p1 = new PVector(100, 300);
PVector p2 = new PVector(300, 300);
PVector p3 = new PVector(350, 50);

void setup(){
  size(400, 400);

}

void drawPolygon(){
  line(p0.x, p0.y, p1.x, p1.y);
  line(p1.x, p1.y, p2.x, p2.y);
  line(p2.x, p2.y, p3.x, p3.y);
}

void drawCubicBezier(){
  float w0, w1, w2, w3;
  
  for(float t = 0.0; t < 1.05; t += 0.05){
    w0 = (1-t)*(1-t)*(1-t);
    w1 = 3*(1-t)*(1-t)*t;
    w2 = 3*(1-t)*t*t;
    w3 = t*t*t;
    
    curPnt.x = p0.x*w0 + p1.x*w1 + p2.x*w2 + p3.x*w3;
    curPnt.y = p0.y*w0 + p1.y*w1 + p2.y*w2 + p3.y*w3;
    
    if(t != 0.0){
      line (curPnt.x, curPnt.y, prevPnt.x, prevPnt.y);
    }
    
    prevPnt.set(curPnt);
  }
}


void draw(){
  background(255);
    
  if(keyPressed){
    if(key == '1'){
      p0.x = mouseX; p0.y = mouseY;
    }
    if(key == '2'){
      p1.x = mouseX; p1.y = mouseY;
    }
    if(key == '3'){
      p2.x = mouseX; p2.y = mouseY;
    }
    if(key == '4'){
      p3.x = mouseX; p3.y = mouseY;
    }
  }  
  
  stroke(150);
  drawPolygon();  
  stroke(0, 128, 255);
  drawCubicBezier();
}
