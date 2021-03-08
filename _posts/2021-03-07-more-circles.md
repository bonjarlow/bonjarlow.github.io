<html>
	<head>
		<title>My Sketch</title>
		
		Momentarily Broken?!
    
    <!-- Load the Processing.js library -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.0/processing.min.js"></script>
	</head>
	<body>
		<script type="application/processing">
		
int rows = 20;
int cols = 20;
float scale;
float z = 0;

void setup() {
  size(500,500);
  background(0);
  scale = width/rows;
  //colorMode(HSB);
  //frameRate(5);
}

void draw() {
  background(0);
  ellipseMode(CORNER);
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float size = 60*noise(i*scale*0.01, j*scale*0.01, z) + 5;
      float h = map(size,0,90,-75,75);
      fill(h,175,175);
      ellipse(i*scale, j*scale, size, size);
    }
  }
  z += 0.03;
}
		</script>
		<canvas> </canvas>
	</body>
</html>
