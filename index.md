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
    
        float pos;
    
        void setup() {
            size(1800,500);
            background(255);
            pos = 900.0;
        }
        
        void draw() {
            pos += random(-10,10);
	    noFill();
            ellipse(pos,250,pos+11,pos+11);
	    if (frameCount % 10 == 0) {
	    background(255);
	    }
        }

	</script>
	<canvas> </canvas>
	</body>
</html>
