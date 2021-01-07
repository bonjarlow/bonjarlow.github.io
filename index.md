---
layout: home
---

<html>
	<head>
	<title>My Sketch</title>
    
    <!-- Load the Processing.js library -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.0/processing.min.js"></script>
	</head>
	
	<body>
	<script type="application/processing">
    
        float x,y,z;
	float rx, ry, rz;

	void setup() {

	  size(500,500,P3D);
	  background(255);
	  colorMode(HSB);

	  rx = random(30,120);
	  ry = random(30,120);
	  rz = random(30,120);

	  x = width/2;
	  y = height/2;
	  z = 0;
	}

	void draw() {
	  translate(x,y,z);
	  rotateZ(frameCount*PI/rz % TWO_PI);
	  rotateY(frameCount*PI/ry % TWO_PI);
	  rotateX(frameCount*PI/rx % TWO_PI);
	  rectMode(CENTER);
	  rect(0,-50,200,200);
	  if (frameCount % 100 == 0) {
	    background(255);
	    fill(random(0,255),random(0,255),200,random(0,100));
	  }
	}
	</script>
	<canvas> </canvas>
	</body>
</html>
