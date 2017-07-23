class Wiggler { //Class Name. Wigglers are the inkblots

  //data
  PShape wiggler; //each wiggler is made from a Pshape
  PShape wiggler2; //and has an identical but mirrored counterpart
  float xpos;
  float ypos;
  float ellipseWidth;
  float ellipseColor;
  float maxEllipse;
  float t = 0; //used for noise function in distort()
  float nVal; //used for noise function in distort()
  float resolution = 75; //how many points in circle


  //constructor
  Wiggler(float tempXpos, float tempYpos, float tempEllipseWidth, float tempEllipseColor, float tempMaxEllipse, float seed) {
    xpos = tempXpos;
    ypos = tempYpos;
    ellipseWidth = tempEllipseWidth;
    ellipseColor = tempEllipseColor;
    maxEllipse = tempMaxEllipse;
    t = seed;
  }

  //functionality
  void setup() {
    wiggler = createShape(); //define a new shape
    wiggler.beginShape(); //start the custom shape
    
    wiggler2 = createShape(); //define a new shape (the mirror)
    wiggler2.beginShape(); //start the custom shape (the miror)
    
    
    
    for (float a = 0; a < TWO_PI; a += TWO_PI/resolution) { 
      float n = noise(t);
      float multiplier = map(n,0,1,.5,1.5);
      wiggler.vertex(xpos+cos(a)*ellipseWidth*multiplier, ypos+sin(a)*ellipseWidth*multiplier); //go from 0 to TWO_PI in increments of a and draw a circle
      wiggler2.vertex(width-(xpos+cos(a)*ellipseWidth*multiplier), ypos+sin(a)*ellipseWidth*multiplier); //go from 0 to TWO_PI in increments of a and draw a circle
    
    t += .1;
    }
    
    
    wiggler.endShape(CLOSE); //end the custom shape
    wiggler2.endShape(CLOSE); //end the custom shape (the mirror)


    wiggler.setFill(color(ellipseColor)); //fill the shape with the ellipseColor (black)
    wiggler.setStroke(false); //no stroke
    wiggler2.setFill(color(ellipseColor)); //fill the mirror shape with the ellipseColor (black)
    wiggler2.setStroke(false); //no stroke
    

  }

  void draw() { //draw the shape and its mirror
    shape(wiggler);
    shape(wiggler2);
  }

  //void distort() { //this function distorts the shapes from circles to something more irregular. this whole section can probably be done better.
  //  for (int i = 0; i < wiggler.getVertexCount(); i++) { //for each vertex in the shape:
  //    PVector v = wiggler.getVertex(i); //get the vertex as a vector
  //    PVector v2 = wiggler2.getVertex(i); //get the mirror vertex as a vector
  //    nVal = noise(t); //create a noise value based on t (arbitrary counter for passing time and changing value)
  //    for (float a = 0; a < TWO_PI; a += TWO_PI/resolution) { //for each vertex
  //      float x = map(nVal, 0, 1, -sin(a)*ellipseWidth, sin(a)*ellipseWidth); //map x noise to new min and max values
  //      float y = map(nVal, 0, 1, -cos(a)*ellipseWidth, cos(a)*ellipseWidth); //map y noise to new min and max values
  //      //float x = cos(a)*rad*nVal;
  //      //float y = sin(a)*rad*nVal;
  //      v.x += x; //increment the vertex x position 
  //      v.y += y; //increment the vertex y position
  //      v2.x += x; //increment the mirror vertex x position 
  //      v2.y += y; //increment the mirror vertex y position
  //      wiggler.setVertex(i, v); //set the new vertex for inkblot
  //      wiggler2.setVertex(i, v2); //set the new vertex for mirror inkblot
  //    }
  //    t += .1; //changing this will change how "spiky" the shapes get as it will affect the noise
  //  }
  //}
}