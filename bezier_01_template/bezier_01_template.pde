PVector p0, p1, p2;

void setup(){
    size(600,600);
    background(200,200,200);
    p0 = new PVector(100,500);
    p1 = new PVector(300,100);
    p2 = new PVector(500,500);
}

void draw(){
    drawControlPolygon();
    drawBezierCurve();
}

void drawBezierCurve(){
    PVector curPnt,prevPnt;
    curPnt = new PVector(0,0);
    prevPnt = new PVector(0,0);

    for(float t=0.0; t<1.0; t+=0.05){
        curPnt.x = *********************************;
        curPnt.y = *********************************;
        
        if(t!=0.0) {        
            line(curPnt.x,curPnt.y, prevPnt.x, prevPnt.y);
        }
        prevPnt.set(curPnt);
    }
}

void drawControlPolygon(){
    line(p0.x,p0.y, p1.x,p1.y);
    line(p1.x,p1.y, p2.x,p2.y);
}



