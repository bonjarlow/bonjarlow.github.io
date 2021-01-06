<html>
	<head>
		<title>My Sketch</title>
    
    <!-- Load the Processing.js library -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/processing.js/1.6.0/processing.min.js"></script>
	</head>
	<body>
  
		<script type="application/processing">
    
        float pos;
    
        void setup() {
            size(500,500);
            background(255);
            pos = 250.0;
        }
        
        void draw() {
            pos += random(-10,10);
	    noFill();
            ellipse(pos,pos,pos,pos);
	    if (frameCount % 10 == 0) {
	    background(255);
	    }
        }

		</script>
		<canvas> </canvas>
	</body>
</html>

---
layout: home
---
