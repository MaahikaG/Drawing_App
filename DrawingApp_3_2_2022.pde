//Maahika Gupta
//Drawing App Project
//2-4
//March 3, 2022

//Pallette 

//background colors
color darkblue = #22223B;
color purpleblue = #4A4E69;
color lavender = #9A8C98;
color mutepink = #C9ADA7;
color lightpink = #F2E9E4;

//drawing colors
color paint1 = #000000;
color paint2 = #FFFFFF;
color paint3 = #cb997e;
color paint4 = #ddbea9;
color paint5 = #ffe8d6;
color paint6 = #b7b7a4;
color paint7 = #a5a58d;
color paint8 = #6b705c;
color chosencolor;

//other variables 
float sliderX;
float penSize;
boolean puppyOn;
boolean goatOn;
boolean unicornOn;

//Images
PImage puppy;
PImage goat;
PImage unicorn;

void setup () {
  size (800, 600);
  background (lightpink);
  
  //initialize chosen color
  chosencolor = paint1;
  
  //initialize slider
  sliderX = 425;
  
  //initialize pen size
  penSize = 10;
  
  //initialize images
  puppy = loadImage ("puppy.png");
  goat = loadImage ("goat.png");
  unicorn = loadImage ("unicorn.png");
  puppyOn = false;
  goatOn = false;
  unicornOn = false;
  
}

void draw () {
  //two bars
  strokeWeight (3);
  stroke (lavender);
  fill (lavender);
  rect(720, 0, 80, 600);
  stroke (darkblue);
  fill (darkblue);
  rect (0, 0, 800, 50);
  
  //colored circles
  tactile (25, 25, 20, paint1);
  fill (paint1);
  ellipse (25, 25, 40, 40);
  
  tactile (75, 25, 20, paint2);
  fill (paint2);
  ellipse (75, 25, 40, 40);
  
  tactile (125, 25, 20, paint3);
  fill (paint3);
  ellipse (125, 25, 40, 40);
  
  tactile (175, 25, 20, paint4);
  fill (paint4);
  ellipse (175, 25, 40, 40);
  
  tactile (225, 25, 20, paint5);
  fill (paint5);
  ellipse (225, 25, 40, 40);
  
  tactile (275, 25, 20, paint6);
  fill (paint6);
  ellipse (275, 25, 40, 40);
  
  tactile (325, 25, 20, paint7);
  fill (paint7);
  ellipse (325, 25, 40, 40);
  
  tactile (375, 25, 20, paint8);
  fill (paint8);
  ellipse (375, 25, 40, 40);
  
  //slider
  strokeWeight (3);
  stroke (255);
  line (425, 25, 600, 25);
  fill (darkblue);
  circle (sliderX, 25, 10);
  
  //clear, load, save buttons
  fill (mutepink);
  tactileRect (730, 60, 60, 30);
  rect (730, 60, 60, 30);
  tactileRect (730, 100, 60, 30);
  rect (730, 100, 60, 30);
  tactileRect (730, 140, 60, 30);
  rect (730, 140, 60, 30);
  textSize (15);
  textAlign (CENTER, CENTER);
  fill (paint2);
  text ("CLEAR", 760, 75);
  text ("LOAD", 760, 115);
  text ("SAVE", 760, 155);

  //color selector
  fill (purpleblue);
  stroke (purpleblue);
  circle (650, 25, 40);
  fill (chosencolor);
  stroke (chosencolor);
  circle (650, 25, penSize);
  
  //animal pictures
  tactileButton (720, 200, 80, 80, puppyOn);
  rect (720, 200, 80, 80);
  image (puppy, 730, 200, 60, 80);
  tactileButton (720, 300, 80, 80, goatOn);
  rect (720, 300, 80, 80);
  image (goat, 720, 300, 80, 80);
  tactileButton (720, 400, 80, 80, unicornOn);
  rect (720, 400, 90, 80);
  image (unicorn, 720, 400, 90, 80);
}

void mouseReleased() {
  //changing chosen color
  if (dist (25, 25, mouseX, mouseY) < 20) {
    chosencolor = paint1;
  }
  if (dist (75, 25, mouseX, mouseY) < 20) {
    chosencolor = paint2;
  }
  if (dist (125, 25, mouseX, mouseY) < 20) {
    chosencolor = paint3;
  }
  if (dist (175, 25, mouseX, mouseY) < 20) {
    chosencolor = paint4;
  }
  if (dist (225, 25, mouseX, mouseY) < 20) {
    chosencolor = paint5;
  }
  if (dist (275, 25, mouseX, mouseY) < 20) {
    chosencolor = paint6;
  }
  if (dist (325, 25, mouseX, mouseY) < 20) {
    chosencolor = paint7;
  }
  if (dist (375, 25, mouseX, mouseY) < 20) {
    chosencolor = paint8;
  }
  
  //moving slider through clicking
  controlSlider ();
  
  //puppy button
  if (mouseX >= 720 && mouseX <= 800 && mouseY >= 200 && mouseY <= 280) {
   puppyOn = !puppyOn;
  }
  
  //goat button 
  if (mouseX >= 720 && mouseX <= 800 && mouseY >= 300 && mouseY <= 380) {
   goatOn = !goatOn;
  }
  
  //unicorn button
  if (mouseX >= 720 && mouseX <= 800 && mouseY >= 400 && mouseY <= 480) {
   unicornOn = !unicornOn;
  }
  
  //clear button
  if (mouseX >= 730 && mouseX <= 790 && mouseY >= 60 && mouseY <= 90) {
    background (lightpink);
  }
  
  //load button
  if (mouseX >= 730 && mouseX <= 790 && mouseY >= 100 && mouseY <= 130) {
    selectOutput ("Pick an image to load", "openImage");
  }
  
  //save button 
  if (mouseX >= 730 && mouseX <= 790 && mouseY >= 140 && mouseY <= 170) {
    selectOutput ("Choose a name for your new image file", "saveImage");
  }
}

void mouseDragged () {
  //moving slider through dragging
  controlSlider ();
  
  //squiggly lines
  if (puppyOn == false && goatOn == false && unicornOn == false) {
    stroke (chosencolor);
    strokeWeight (penSize);
    if (mouseX < 720 && mouseY > 50) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
  } else {
    if (mouseX < 720 && mouseY > 90) {
      if (puppyOn == true) {
      image (puppy, mouseX - 50, mouseY - 50, penSize * 3, penSize * 3 + 20);
    } else {
      if (goatOn == true) {
        image (goat, mouseX - 50, mouseY - 50, penSize * 3, penSize * 3);
    } else {
      image (unicorn, mouseX - 50, mouseY - 50, penSize * 3 + 10, penSize * 3);
    }
    }
    }
  }
}

void tactile (int x, int y, int r, color choice) {
  strokeWeight (3);
  if (dist (x, y, mouseX, mouseY) < r) {
    stroke (paint2);
  } else {
    stroke (choice);
  }
  if (choice == chosencolor) {
    stroke (paint2);
  }
}

void tactileRect (int x, int y, int w, int l) {
  strokeWeight (3);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    stroke (paint2);
  } else {
    stroke (purpleblue);
  }
}

void tactileButton (int x, int y, int w, int l, boolean i) {
  stroke (0);
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+l) {
    fill (mutepink);
  } else {
    if (i == true) {
      fill (mutepink);
    } else {
      fill (purpleblue);
    }
  }
}

void controlSlider () {
  if (mouseX > 425 && mouseX < 600 && mouseY > 10 && mouseY < 40) {
    sliderX = mouseX;
    penSize = penSize + (sliderX - pmouseX)/10 ; 
  }
}

void saveImage (File f) {
  if (f != null) {
    PImage canvas = get (71, 1, width - 71, height - 1);
    canvas.save (f.getAbsolutePath());
  }
}

void openImage (File f) {
  if (f != null) {
    int n = 0;
    while (n > 10) {
      PImage pic = loadImage (f.getPath());
      image (pic, 0, 0);
      n = n + 1;
    }
  }
}
