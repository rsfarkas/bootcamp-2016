// CODE MIDTERM
// Rotoscoping
//
// This sketch loads the assigned frames and plays them back
// Add your own draw code
// Then it saves out the rendered frames
//
// DON'T FORGET TO CHANGE THE VALUE OF THE STUDENTNAME VARIABLE TO YOUR NAME!!

import java.io.File;

File[] tempfiles;
ArrayList<File> files;
PImage image;
String currentFilename;

// EDIT THIS LINE WITH YOUR NAME!
String studentName = "Roxy Farkas";

int getRandomColor(){
  return color(random(120,255),random(255), random(255));
}

void drawFlower(float x, float y, float flowerSize){
  strokeWeight(flowerSize);
  stroke(getRandomColor());

  translate(x,y);
  for (int i = 0; i<10; i++){
    rotate(TWO_PI/10);
    line(0,0,3 * flowerSize,0);
  }

  strokeWeight(0);
  fill(getRandomColor());
  ellipse(0,0,1.5 * flowerSize,1.5 * flowerSize);
}
void setup() {
  files = new ArrayList<File>();

  // get list of files from directory
  File dir = new File(sketchPath() + "/rawFrames");
  tempfiles = dir.listFiles();

  // filter out files that don't end in .png
  for (int i = 0; i < tempfiles.length; i++) {
    String path = tempfiles[i].getAbsolutePath();
    if (path.toLowerCase().endsWith(".png")) {
      files.add(tempfiles[i]);
    }
  }

  // Resize the canvas to full-HD 1080p glory
  size(960, 540);
  pixelDensity(2);
  
  // if that doesn't work, comment it out and uncomment this instead:
  //size(1920, 1080);
  //pixelDensity(1);
}

void draw() {
  // DO NOT ALTER THE LINE BELOW
  prepare();

  // BEGIN ADDING YOUR CODE HERE -----
if(frameCount <= files.size()){
    drawFlower(random(100), random(height/2),random(5,25));
    drawFlower(random(900), random(height/2),random(5,25));
    drawFlower(random(600), random(height/2),random(5,25));
    drawFlower(random(200), random(height/2),random(5,25));
    drawFlower(random(300), random(height/2),random(5,25));
    drawFlower(random(400), random(height/2),random(5,25));
    drawFlower(random(700), random(height/2),random(5,25));
    drawFlower(random(width-25), random(height/2),random(5,25));
  }
 
  // STOP ADDING YOUR CODE HERE -----

  // DO NOT ALTER THE LINES BELOW
  if (frameCount < files.size()) { 
    export();
  } else {
    exit();
  }
}

// DO NOT ALTER THIS FUNCTION!!
void prepare() {
  String path = files.get(frameCount-1).getAbsolutePath();
  currentFilename = files.get(frameCount-1).getName();

  // Load current file into our PImage variable
  tint(255, 255);
  image = loadImage(path);
  image(image, 0, 0, width, height);
}

// DO NOT ALTER THIS FUNCTION!!
void export() {
  // saves frame without watermark
  saveFrame(sketchPath() + "/outFrames/edited_" + currentFilename);

  int sidePadding = 125;
  int bottomPadding = 50;
  
  textAlign(LEFT);
  textSize(32);
  fill(255);
  text(studentName, sidePadding + 1, height - bottomPadding + 1);
  fill(0);
  text(studentName, sidePadding, height - bottomPadding);

  // saves frame with watermark
  saveFrame(sketchPath() + "/outFrames/watermarked_" + currentFilename);
}