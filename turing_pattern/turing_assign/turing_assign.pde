int n = 200;
int m = 2;

float[][] u = new float[n+2][n+2];
float[][] v = new float[n+2][n+2];

float[][] u1 = new float[n+2][n+2];
float[][] v1 = new float[n+2][n+2];

float dt = 1.2;
float h = 0.1; // 0.1
float h2 = h*h;
float a = 0.024;
float b = 0.078;
float Cu = 0.002;
float Cv = 0.001;

void setup(){
    //サイズはm*nにすること
    size(400, 400);
    noStroke();
    clear();
}

void draw(){
    display(); //描画処理
    boundary(); // 境界条件の処理
    update(); // 描画に関わらない処理
}

void display(){
    for(int i=1; i<=n; i++){
        for(int j=1; j<=n; j++){
        //ここを変更して色を変えてみよう
        // fill(u[i][j]*255, 100, v[i][j]*255);
        fill(255 - (v[i][j] - u[i][j] / 2 + 0.5) * 100, 255, 255);
        rect( (i-1)*m, (j-1)*m, m, m);
        }
    }
}

void update(){
    for(int i=1; i<=n; i++){
        for(int j=1; j<=n; j++){
            float cU = u[i][j];
            float cV = v[i][j];
            
            float Du = (u[i+1][j] + u[i-1][j] + u[i][j-1] + u[i][j+1] - 4 * cU) / h2;
            float Dv = (v[i+1][j] + v[i-1][j] + v[i][j-1] + v[i][j+1] - 4 * cV) / h2;

            float f = -cU*cV*cV + a*(1-cU);
            float g = cU*cV*cV - b*cV;
            
            u1[i][j] = cU + (Cu*Du + f) * dt;
            v1[i][j] = cV + (Cv*Dv + g) * dt;
        }
    }
    
    for(int i=1; i<=n; i++){
        for(int j=1; j<=n; j++){
            u[i][j] = u1[i][j];
            v[i][j] = v1[i][j];
        }
    }
}

//境界条件の処理（上下と左右をつなげる）
void boundary(){
    for(int i=1; i<=n; i++){
        u[i][0] = u[i][n];
        u[i][n+1] = u[i][1];
        u[0][i] = u[n][i];
        u[n+1][i] = u[1][i];
        
        v[i][0] = v[i][n];
        v[i][n+1] = v[i][1];
        v[0][i] = v[n][i];
        v[n+1][i] = v[1][i];
    }
}

//初期化（cキーでコール)
void clear(){
    for(int i=1; i<=n; i++){
        for(int j=1; j<=n; j++){
            u[i][j] = 1;
            v[i][j] = 0;
        }
    }
    redraw();
}

void mousePressed(){
    int x, y;
    x = mouseX / m + 1;
    y = mouseY / m + 1;
    for(int i=1; i<=n; i++){
        for(int j=1; j<=n; j++){
            float r = sqrt( (x-i)*(x-i) + (y-j)*(y-j) );
            if(r < 8){
                u[i][j] = 0.6 + random(-0.06, 0.06);
                v[i][j] = 0.2 + random(-0.02, 0.02);
            }
        }
    }
    redraw();
}

void keyPressed(){
    if (key == 'c'){
        clear();
    }else if(key == 'y'){
        loop();
    }else if(key == 'n'){
        noLoop();
    }
}
