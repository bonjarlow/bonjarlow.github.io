<html>
	<head>
		<title>My Sketch</title>
    
    <!-- Load the Processing.js library -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.0/processing.min.js"></script>
	</head>
	<body>
		<script type="application/processing">
			Spinner a,b,c,d;

void setup() {
  
  size(500,500,P3D);
  background(#FFFFFF);
  colorMode(RGB);
  frameRate(20);
  
  color c1 = color(#FFFFFF, 3);
  color c2 = color(#FFFFFF, 10);
  color c3 = color(#FFFFFF, 15);
  color c4 = color(#FFFFFF, 255);
  
  a = new Spinner(width/4+10,height/4+10, c1);
  b = new Spinner(3*width/4-10,height/4+10, c2);
  c = new Spinner(width/4+10,3*height/4-10, c3);
  d = new Spinner(3*width/4-10,3*height/4-10, c4);
}

void draw() {
  //if (frameCount % 8 == 0) {
    //camera(-100 + frameCount, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
    //width/2.0, height/2.0, 0, 0, 1, 0);
    a.update();
    b.update();
    c.update();
    d.update();
    //saveFrame("grid/line-######.png");
  //}
}

class Spinner {
  
  int xpos, ypos;
  float wx, wy, wz;
  float theta, phi, rho;
  color c;
 
  Spinner(int xpos, int ypos, color c) {
    this.xpos = xpos;
    this.ypos = ypos;
    this.c = c;
    setSpin();
  }
  
  void setSpin() {
    theta = 0;
    phi = 0;
    rho = 0;
    wx = random(-10,10);
    wy = random(-10,10);
    wz = random(-10,10);
  }
  
  void update() {
    pushMatrix();
      translate(xpos, ypos, 0);
      rotateX(theta);
      rotateY(phi);
      rotateZ(rho);
      fill(c);
      ellipse(0,0,2*width/6, 2*height/6);
    popMatrix();
    theta += wx/100;
    phi += wy/100;
    rho += wz/100;
  }
  }
		</script>
		<canvas> </canvas>
	</body>
</html>
