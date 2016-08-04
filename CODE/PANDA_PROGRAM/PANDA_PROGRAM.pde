int state;
PImage bg;

void setup() {
  size(1000, 642);
  state = 0;
  bg = loadImage("bamboo.png");
   background(bg);
}

void draw() {
   //body
   fill(0);
   noStroke();
   ellipse(250,450,280,250);
   
   //armleft
   pushMatrix();
   translate(139,395);
   fill(0);
   noStroke();
   rotate(-5.2);
   ellipse(0,0,85,160);
   popMatrix();
   
   //armright
   pushMatrix();
   translate(361,395);
   fill(0);
   noStroke();
   rotate(5.2);
   ellipse(0,0,85,160);
   popMatrix();
   
   //tummy
   fill(255);
   noStroke();
   ellipse(250,450,220,200);
   
   //footright
   fill(0);
   noStroke();
   ellipse(300,550,100,100);
 
   
   //footleft
   fill(0);
   noStroke();
   ellipse(195,550,100,100);

   
   //footpadleft
   fill(240,127,155);
   noStroke();
   ellipse(195,570,50,40);
   
   //footpadright
   fill(240,127,155);
   noStroke();
   ellipse(300,570,50,40);
      
  //left ear
   fill(0);
   stroke(2);
   ellipse(150,190,65,65);
   //right ear
   ellipse(350,190,65,65);
  
   //head
  fill(255);
  noStroke();
  ellipse(250,250,200,200);
  
    //eyewrap
   fill(0);
   ellipse(295,250,33,40);
   ellipse(205,250,33,40);
   
   //eye
   fill(255);
   ellipse(295,250,5,5);
   ellipse(205,250,5,5);
   
   //nose
   fill(240,127,155);
   triangle(232, 300, 248, 280, 264, 300);
   
   //mouth
   stroke(240,127,155);
   noFill();
   
   arc(262, 295, 30, 27, 0, PI);
   arc(230, 295, 30, 27, 0, PI);
   

  if (state == 0) {
    println("It's feeding time. Do you:");
    println("A. Grab a snack?");
    println("B. Sneak closer to the door?");
    state = 1;
  }
}

void keyPressed() {
  if (key == 'A'|| key == 'a') {
    if (state == 1 ) {
      println("Sadly, you've become distracted by bamboo.");
      state = 2;
    } else if (state == 2) {
      println("Oh no! The zoo keeper caught you!");
      state = 3;
    } else if (state == 3) {
      println("You've been caught!");
    } else if (state == 4) {
      println("Everyone sees you running. The zookeeper is going to keep a better eye on you.");
      state = 5;
    } else if (state == 5) {
      println("Turns out pandas aren't good swimmers.");
    }
  }

  if (key == 'B' || key == 'b') {
    if (state == 1) {
      println("You see that your panda friend notices your movement. Do you:");
      println("A. Tell him your plan?");
      println("B. Keep to yourself?");
      state = 2;
    } else if (state == 2) {
      println("Good job! Loose lips sink ships. The zookeeper is busy on snapchat. Do you:");
      println("A. Try to get in the story?");
      println("B. Hide inside the empty snack container?");
      state = 3;
    } else if (state == 3) {
      println("The zookeeper rools you out to the loading dock. Do you:");
      println("A. Make a run for it?");
      println("B. Wait until the zoo closes?");
      state = 4;
    } else if (state == 4) {
      println("It's finally dark! Do you:");
      println("A. Run for the river?");
      println("B. Head for the road?");
      state = 5;
    } else if (state == 5) {
      println("A car playing Desiigner appreaches and offers you a lift. Congrats! You're on your way to Atlanta.");
    }
  }
}