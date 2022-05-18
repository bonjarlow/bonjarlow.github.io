---
layout: post
---

<html>
	<head>
		<title>My Sketch</title>
    
    <!-- Load the Processing.js library -->
		<script type="text/javascript" src="processing.js"></script>
	</head>
	<body>
		<canvas data-processing-sources="poisson_sampling.pde"></canvas>

		
int r = 4;
int k = 30;
ArrayList<PVector> grid = new ArrayList<PVector>();
float w = r / sqrt(2);
ArrayList<PVector> active = new ArrayList<PVector>();
IntList colors = new IntList();
IntList ordered = new IntList();
int cols, rows;
PImage photo;
float angle = 0;
float accel = 0.2;
float spb = 10;

//TODO: smoother sun ray changes

void setup() {
  size(750, 750, P3D);
  background(0);
  //strokeWeight(4);
  colorMode(HSB, 360, 100, 100);
  
  //photo = loadImage("sun-6.png");
  photo = loadImage("sun-5.png");
  photo.loadPixels();

  // STEP 0
  cols = floor(width / w);
  rows = floor(height / w);
  for (int i = 0; i < cols * rows; i++) {
    grid.add(i, null);
    colors.append(color(0,0,0));
  }

  // STEP 1
  int x = width / 2;
  int y = height / 2;
  int i = floor(x / w);
  int j = floor(y / w);
  PVector pos = new PVector(x, y);
  grid.set(i + j * cols, pos);
  ordered.append(i + j*cols);
  colors.set(i + j* cols, getColor(x, y));
  active.add(pos);
  //frameRate(1);
  rectMode(CENTER);
}

void draw() {
  //saveFrame("sun-zoetrope2/#####.jpg");
  background(0);
  //noLoop();
  //console.log(frameCount)
  println(frameCount);

  for (int total = 0; total < spb; total++) {
    
    if (active.size() > 0) {
      
      int randIndex = floor(random(active.size()));
      PVector pos = active.get(randIndex);
      boolean found = false;
      
      for (int n = 0; n < k; n++) {
        
        PVector sample = PVector.random2D();
        //var m = random(r, 2 * r);
        float m = (sqrt(random(1,4)))*r;
        sample.setMag(m);
        sample.add(pos);

        int col = floor(sample.x / w);
        int row = floor(sample.y / w);

        if (
          col > -1 && row > -1 &&
          col < cols && row < rows &&
          (grid.get(col + row * cols) == null)
        ) {
          boolean ok = true;
          for (int i = -2; i <= 2; i++) {
            for (int j = -2; j <= 2; j++) {
              
              int index = col + i + (row + j) * cols;
              PVector neighbor = grid.get(index);
              
              if (neighbor != null) {
                float d = PVector.dist(sample, neighbor);
                if (d < r) {
                  ok = false;
                }
              }
            }
          }
          
          float boundary = sqrt(sq(sample.x - width/2) + sq(sample.y - height/2));
          //boundary < 360 for 750x750
          
          if (ok && boundary < 360) {
            found = true;
            grid.set(col + row * cols, sample);
            colors.set(col + row*cols, getColor(int(sample.x), int(sample.y)));
            ordered.append(col + row*cols);
            active.add(sample);
            // Should we break?
            break;
          }
        }
      }

      if (!found) {
        active.remove(randIndex);
      }
    }
  }
  
  pushMatrix();
  translate(width/2, height/2);
  if(active.size() == 0){
    rotateZ(angle);
    angle += PI/4-0.01;
  }
  
  /*if(frameCount > 500){
    int batch = 100;
    if(ordered.size() < 100){
      batch = 10;
    }
    for(int i = batch; i > 0; i--){
      if(ordered.size() > 0){
        int lastindex = ordered.pop();
        colors.set(lastindex, color(0,0,0));
      }
    }
  }*/
  
  for (int i = 0; i < grid.size(); i++) {
    if (grid.get(i) != null) {
      color c = colors.get(i);
      fill(c);
      //stroke(hue(c), saturation(c), 80);
      strokeWeight(0.3);
      circle(grid.get(i).x - width/2, grid.get(i).y - height/2, 7);
    }
  }
  
  popMatrix();
  if(spb < 100){
    spb += 1;
  }
}

color getColor(int x, int y){
  color c;
  int d = int(sqrt(sq(x - width/2) + sq(y - height/2)));
  if(photo.pixels[x + y*width] == color(0,0,0)){
    //color a = color(#DBC556);
    //color b = color(#DB7356);
    color a = color(#D6B42D);
    color b = color(#D86042);
    c = lerpColor(a, b, abs(sin(d/20 + 0.8*randomGaussian())*cos(d/20)));
  }
  else{
    color a = color(#414CBC);
    //color b = color(#0F1448);
    color b = color(#10111A);
    c = lerpColor(a, b, abs(sin(d/62 + 0.2*randomGaussian())));
  }
  return c;
}
		</script>
		<canvas> </canvas>
	</body>
</html>
