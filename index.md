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
            size(500,500);
            background(255);
            pos = 0.0;
        }
        
        void draw() {
            pos += random(-1,1);
            line(0,pos,0,pos)
        }

		</script>
		<canvas> </canvas>
	</body>
</html>
