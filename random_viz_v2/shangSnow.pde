/* -- SET UP GLOBAL INTEGERS ------*/
  float diam = 18; //smallest circle diameter
  float time = millis(); //current time
  
  float smangle = radians(270); //angle starting point for small circle
  float mdangle = radians(270); //angle starting point for medium circle
  float lgangle = radians(270); //angle starting point for large circle
  float smspeed = .01; //speed for small circle is one rotation per 10 seconds
  float mdspeed = smspeed/10; //speed for medium circle is one rotation per 10 seconds
  float lgspeed = mdspeed/6; //speed for large circle is one rotation per 60 seconds
  // float offset = 320;
  float scalar = diam; //defines arc path of circle movement
  
  //DEFAULT COLORS
  float white = 255;
  float gray = 76; //about 30% black
  float currentCol;
  float destCol;
  float smdampen = 0.4;
  //Image
  PImage shangImage;

void setupShangSnow()
{
  smooth();
  noStroke();
  currentCol = gray;
  destCol = white;
  
  shangImage = loadImage("shang_nobackground.png");
}

void drawShangSnow()
{
  shangImage = loadImage("shang_nobackground.png");
  float funCol2 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
  float funSize2 = player.mix.level() * 1000.0;
  background(white); //make background white
  if (player.isPlaying()){
  imageMode(CENTER);
  image(shangImage, 800, 700, 300, 212);
  }
  stroke(100,100,100); //add stroke
  strokeWeight(1); //stroke width
  noFill(); //remove fill from circles
  translate(0,height/2);
  /* -- PATH CIRCLES ----------- */
  fill(white); //fill with white
  
  //large circle
  ellipse(396, 198, diam * 24, diam * 24); //draw biggest circle path
  ellipse(180, 198, diam * 4, diam * 4); //draw biggest circle marker
  
  //medium circle
  ellipse(396, 198, diam * 16, diam * 16); //medium circle
  ellipse(252, 198, diam * 2, diam * 2); //draw medium circle marker
  
  //small circle
  ellipse(396, 198, diam * 11, diam * 11); //small circle
  ellipse(297, 198, diam, diam); //draw smallest circle marker

  /* -- MOVING CIRCLES ---------- */
  fill(gray); //fill circles with gray
  noStroke(); //remove stroke
  
  //large circle
  float o = 396 + sin(lgangle) * (scalar * 12); //x value is changes based off of sin() and arc of circle
  float p = 198 + cos(lgangle) * (scalar * 12); //y value is changes based off of cos() and arc of circle
  ellipse(o, p, diam * 4, diam * 4); //draw largest moving circle
  lgangle += lgspeed; //lgangle = lgangle + lgspeed - moves circle to next point when drawn again
  
  //medium circle
  float m = 396 + sin(mdangle) * (scalar * 8); //x value is changes based off of sin() and arc of circle
  float n = 198 + cos(mdangle) * (scalar * 8); //y value is changes based off of cos() and arc of circle
  ellipse(m, n, diam * 2, diam * 2); //draw medium moving circle
  mdangle += mdspeed; //mdangle = mdangle + mdspeed - moves circle to next point when drawn again
  
  //smallest circle
  
  float x = 396 + sin(smangle) * (scalar * 5.5); //x value is changes based off of sin() and arc of circle
  float y = 198 + cos(smangle) * (scalar * 5.5); //y value is changes based off of cos() and arc of circle
  if ((y > 189) && (y < 207) && (x < 350)) {
  fill(200,0,100);
  ellipse(x, y, diam, diam); //draw smallest moving circle
  smangle += smspeed; //smangle = smangle + smspeed - moves circle to next point when drawn again
  } else {
  fill(235, 219, 52);
  ellipse(x, y, diam, diam); //draw smallest moving circle
  smangle += smspeed; //smangle = smangle + smspeed - moves circle to next point when drawn again
  }
  
  
  /* -- RECTANGLES --------------- */
// Upper Bars
fill(gray); //fill with dark gray
rect(0, -480, funSize2 * 9, 15); //draw uppper-left rectangle
rect(0, -440, funSize2 * 8, 15); //draw uppper-left rectangle
// Middle Bars
rect(0, -320, funSize2 * 5.5, 15); //draw uppper-left rectangle
fill(200,0,100);
rect(0, -280, funSize2 * 4.5, 15); //draw uppper-left rectangle
fill(gray); //fill with dark gray
rect(0, -240, funSize2 * 3.5, 15); //draw uppper-left rectangle
// Lower Bars
rect(0, -80, funSize2 * 1.9, 15); //draw uppper-left rectangle
rect(0, -40, funSize2 * 1.6, 15); //draw uppper-left rectangle
println(time); //print current millis() in terminal
}
