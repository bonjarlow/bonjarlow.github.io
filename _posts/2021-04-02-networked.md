<html>
	<head>
		<title>My Sketch</title>
    
    <!-- Load the Processing.js library -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.0/processing.min.js"></script>
	</head>
	<body>
		<script type="application/processing">
		
Network web;
color cb;
color cn;
float dist;

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100);
  //cb = color(#3FB9F0); color(#B94F74); color(#B73A34); color(#1D2995);
  //cn = color(#055C83); color(#FFFEFA); color(#FFFFFF);
  cb = color(#01062E);
  cn = color(#FFFFFF);
  dist = 30;
  background(cb);
  frameRate(30);
  ellipseMode(CENTER);
  web = new Network(400, dist, 5);
}

void draw(){
  background(cb);
  web.update();
  web.connect();
  web.dscale = dist + 10*sin((frameCount%500)*TWO_PI/500);
  //saveFrame("midnight-white-highN/######.png");
}

class Node {
  
  float xpos, ypos;
  int dir;
  float size;
  float vx, vy;
  
  Node(float x, float y, float size){
    this.xpos = x;
    this.ypos = y;
    this.size = size;
    float val1 = random(-1,1);
    float val2 = random(-1,1);
    float dir1 = 1*val1/abs(val1);
    float dir2 = 1*val2/abs(val2);
    vx = random(1,2)*dir1;
    vy = random(1,2)*dir2;
    fill(cn);
    ellipse(xpos,ypos,size,size);
  }
  
  void move(){
    xpos += vx;
    ypos += vy;
    if(xpos > (width+5)){
      xpos = 0;
    }
    if(xpos < -5){
      xpos = width;
    }
    if(ypos > (height+5)){
      ypos = 0;
    }
    if(ypos < -5){
      ypos = height;
    }
    fill(cn);
    ellipse(xpos,ypos,size,size);
  }
}

class Network{
  Node[] nodelist;
  int num;
  float dscale;
  float size;
  
  Network(int num, float dscale, float size){
    this.num = num;
    this.dscale = dscale;
    this.size = size;
    nodelist = new Node[num];
    
    for(int i = 0; i < num; i++){
      nodelist[i] = new Node((int)(random(1)*width), (int)(random(1)*height), size);
    }
    
  }
  
  void update(){
    for(int i = 0; i < num; i++){
      nodelist[i].move();
    }
  }
  
  void connect(){
    for(int i = 0; i < num; i++){
      for(int j = 0; j < i; j++){
        float dx = nodelist[i].xpos - nodelist[j].xpos;
        float dy = nodelist[i].ypos - nodelist[j].ypos;
        float dist = sqrt(dx*dx + dy*dy);
        if(dist < dscale){
          stroke(cn);
          line(nodelist[i].xpos, nodelist[i].ypos, nodelist[j].xpos, nodelist[j].ypos);
        }
      }
    }
  }
  
}

void keyPressed() {
    if (keyCode == UP) {
      web.dscale += 1;
    } 
    if (keyCode == DOWN) {
      web.dscale -= 1;
    } 
}
		

		</script>
		<canvas> </canvas>
	</body>
</html>
