float speed;


void setup(){
  frameRate(60);
  size(500,500);
  
  speed = 0;
}

void draw(){
  background(0, 191,255);
  
  float deg = -90.0;
  float rad = radians(deg);
  
  //fishbody
  fill(255);
  noStroke();
  ellipse(300,325,200,125);
  
  //fishtail
  pushMatrix();
  translate(400,325);
  fill(255);
  noStroke();
  triangle(-15,0, 30,60, 30, -60);
  popMatrix();
  
  //fisheye
  fill(0);
  noStroke();
  ellipse(230,325,10,10);
  
 //bubblefactory
 
  if(mouseX >= 200 && mouseX <=400 && mouseY >=  262.5 && mouseY <= 387.5){
  
  fill(237,255,166);
  noStroke();
  ellipse(200,325-speed,10,10);
  
  speed+=5;
}

  if(keyPressed == true){
  fill(247,35,198);
  noStroke();
  ellipse(300,325,200,125);
  
  fill(0);
  noStroke();
  ellipse(230,325,10,10);
  
  fill(247,35,198);
  translate(400,325);
  triangle(-15,0, 30,60, 30, -60);
  
}
 
}

  