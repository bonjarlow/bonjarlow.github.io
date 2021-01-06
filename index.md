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
    
        int dx = 0;
	Spiral a;
	Spiral b;

	void setup() {
	  size(400,400);
	  background(0);
	  setSpirals();
	}

	void draw() {
	  frameRate(40);
	  background(0);
	  noFill();
	  stroke(255);
	  strokeWeight(1);

	  a.render();
	  b.render();
	  a.update();
	  b.update();
	}

	void setSpirals() {
	  a = new Spiral(6*width/10, height/2, 1);
	  b = new Spiral(4*width/10, height/2, -1);
	}

	class Spiral {
	  int xpos, ypos, dir;

	  Spiral(int _xpos, int _ypos, int _dir) {
	    xpos = _xpos;
	    ypos = _ypos;
	    dir = _dir;
	  }

	  void update() {

	    if (dir == 1) {
	      xpos += 1;
	    }
	    if (dir == -1) {
	      xpos -= 1;
	    }
	    if (xpos > 6*width/10) {
	      dir = -1;
	    }
	    if (xpos < 4*width/10) {
	      dir = 1;
	    }
	  }

	  void render() {
	    for (int i = 0; i < 25; i++) {
	      ellipse(xpos, ypos, i+30*i, i+30*i);
	    }
	  }
	}
	</script>
	<canvas> </canvas>
	</body>
</html>
