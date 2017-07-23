int numBatch = 50; //how many images do you want in a batch?
int counter = 0; //starts the counter at 0, counts up every time an image is generated, and is used in draw() to force exit
float seed = random(0,1000000); //this starts the seed for the perlin noise at a random point

void setup() {
  size(637,825,P2D); //set up a canvas size. this is an 8.5x11" piece of paper divided into 16 sections 
}
 
void draw() {
  counter ++; //increment the counter every time an image is generated
  background(255); //draw a white background
  Wiggler[] inkblots; //start an array of Wigglers (each wiggler is an individual inkblot)
  int numBlots = int(random(40,50)); //for each image, generate somewhere between 40 and 50 inkblots
  inkblots = new Wiggler[numBlots]; //create the array and populate it with all the inkblots
  int numDistortions = int(random(10,11)); //for each image, allow a max number of distortions to the inkblot shape. Raising this value will lead to some really weird spiky shapes and could cause inkblots to distort off the screen and clip.
  int ellipseMax = int(random(40,55)); //for each image, set a max value for the width of the starting shape
  
  for (int i = 0; i < inkblots.length; i++) { //for each item in the array:
      seed += 10;
      inkblots[i] = new Wiggler(random((2*ellipseMax),width/2),random(ellipseMax*2,height-(2*ellipseMax)),random(7,ellipseMax),0,ellipseMax, seed); //make an inkblot and its mirror. place it well within boundaries of screen, give it a random starting width, and make it black 
      inkblots[i].setup(); //creates the PShapes that are the inkblots
      for (int j = 0; j < numDistortions; j++) { //distort the inkblot a few times
        //inkblots[i].distort();
      }
  }  
  for (int i = 0; i < inkblots.length; i++) { //for each item in the array:
      inkblots[i].draw(); //draw the inkblots on the screen
    }
  saveFrame("GeneratedInkblots/" + "Inkblots-###.png"); //save each image
  if (counter == numBatch) { //once the batch # of images has been generated and saved
    exit(); //force exit out of draw(), otherwise draw() will always remain true and will keep looping
  }
}



  
 