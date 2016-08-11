PImage img;

int i = 0;

import ddf.minim.*; 

Minim minim; 

AudioPlayer[] songs; 
boolean stop = false;
boolean playTheFirstOne = true;

void setup() { 
  size(1024, 800); 
  minim = new Minim(this); 

  songs = new AudioPlayer[8]; 

  songs[0] = minim.loadFile("clarity.mp3", 1024); 
  songs[1] = minim.loadFile("blunt.mp3", 1024); 
  songs[2] = minim.loadFile("ipanema.mp3", 1024); 
  songs[3] = minim.loadFile("dontstop.mp3",1024); 
  songs[4] = minim.loadFile("closer.mp3",1024); 
  songs[5] = minim.loadFile("jamie.mp3",1024);
  songs[6] = minim.loadFile("chainsmokers.mp3",1024);
  songs[7] = minim.loadFile("fire.mp3",1024);

  img = loadImage("heart.png");
  imageMode(CENTER);
} 

void draw() {
  background(0);
  stroke( 255 );

  if (!stop) {
    songs[i].play();
  }
 

  image(img, width/2, height/2, songs[i].left.level()*(width*3), songs[i].right.level()*(width*3));  
}


void keyPressed() {

  if (key == 'n' || key == 'N') {
    stop = false;
    songs[i].close();
    if (i<7) {
      songs[i + 1].play();
      i++ ;
    }
    
  } else if (key == ' ') {
    if (songs[i].isPlaying()) {
      songs[i].pause();
      stop= true;
    }
  } else if (key == 'P' || key =='p') {
    stop = false;
    songs[i].play();
  }
}