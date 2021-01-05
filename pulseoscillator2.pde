float omega;
float couple;
float[][] phases;
float[][] angv;
float dt;
int den;
int xlen;
int ylen;

//phase change of each oscillator given by:
//delta_theta = (omega + sum_n^m{theta_m - theta_n}) * delta_t
//where theta_m are the 8 nearest neighbors of theta_n

void setup() {
  
  size(800, 600);
  background(0);
  colorMode(HSB);

  omega = 5;
  couple = 1.0;
  dt = 0.01;
  den = 5;
  
  xlen = width/den;
  ylen = height/den;

  phases = new float[xlen][ylen];
  angv = new float[xlen][ylen];

  for (int i = 0; i < xlen; i++) {
    for (int j = 0; j < ylen; j++) {
      phases[i][j] = random(0, TWO_PI);
      angv[i][j] = randomGaussian() + 1;
    }
  }
}

void draw() {
  //frameRate(60);
  noStroke();
  background(0);
  calcphase();
  render();
  //saveFrame("line-######.jpg");
}

void calcphase() {
  
  float[][] temp = new float[xlen][ylen];
  float[] nbrlist;
  
  for (int i = 0; i < xlen; i++) {
    for (int j = 0; j < ylen; j++) {
      
      float delta = 0;
      float myphase = phases[i][j];
      nbrlist = getnbrs(i,j);
      
      for (float k : nbrlist) {
        delta += sin(k - myphase);
      }
      
      delta *= couple;
      //delta += angv[i][j];
      delta += omega;
      delta *= dt;
      
      if (delta < 0) {
        delta = abs(delta) % TWO_PI;
        delta = TWO_PI - delta;
      }
      if (delta > TWO_PI) {
        delta = delta % TWO_PI;
      }
      
      temp[i][j] = delta;
      
    }
  }
  
  for (int i = 0; i < xlen; i++) {
    for (int j = 0; j < ylen; j++) {
      phases[i][j] += temp[i][j];
    }
  }
}

void render() {
  rectMode(CENTER);
  for (int i = 10; i < xlen - 10; i += 2) {
    for (int j = 10; j < ylen - 10; j += 2) {
      float phase = phases[i][j] % TWO_PI;
      int c = round(255*(phase/TWO_PI));
      fill(c, 200, 200);
      if (j*den > 3*height/8 && j*den < 5*height/8 && i*den > 3*width/8 && i*den < 5*width/8) {
        rect(i*den, j*den, 2*den, 2*den);
      }
      else ellipse(i*den, j*den, 1.2*den, 1.2*den);
      //rect(i*den, j*den, den, den);
    }
  }
}

float[] getnbrs(int i, int j) {
  
  float[] nbrphases = new float[8];
  
  int a = (i-1);
  int b = (i+1);
  int c = (j-1);
  int d = (j+1);
  
  if (a < 0) {
    a = xlen - 1;
  }
  if (b > (xlen-1)) {
    b = 0;
  }
  if (c < 0) {
    c = ylen - 1;
  }
  if (d > (ylen-1)) {
    d = 0;
  }
  
  nbrphases[0] = phases[a][j];
  nbrphases[1] = phases[b][j];
  nbrphases[2] = phases[i][c];
  nbrphases[3] = phases[i][d];
  nbrphases[4] = phases[a][c];
  nbrphases[5] = phases[a][d];
  nbrphases[6] = phases[b][c];
  nbrphases[7] = phases[b][d];
  
  return nbrphases;
  
}

void keyReleased() {
  float dk = 0.1;
  float dw = 0.1;
  
  if (keyCode == UP) {
    couple += dk;
  }
  if (keyCode == DOWN) {
    couple -= dk;
  }
  if (keyCode == LEFT) {
    omega -= dw;
  }
  if (keyCode == RIGHT) {
    omega += dw;
  }
  
  println("omega: " + omega, "k: " + couple);
}
