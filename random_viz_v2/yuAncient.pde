float theta;
PImage yu_image;
void setupYuAncient()
{
  yu_image = loadImage("yu_nobackground.png");
  
}


void drawYuAncient()
{
  
  float funCol2 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
  float funSize2 = player.mix.level() * 1000.0;
  background(10,50,funCol2/2,.5);
  if (player.isPlaying()) {
          imageMode(CENTER);
          image(yu_image, 500, 170, 300, 212);
        }
  frameRate(30);
  stroke(255);
  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (3 * funSize2 / ((float) width)) * 90f;
  // Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,height/4);
  // Draw a line 120 pixels
  line(0,0,0,120);
  // Move to the end of that line
  translate(0,120);
  // Start the recursive branching!
  branch(320);
}

void branch(float h) {

  h *= 0.66;
  if (h > 2) {
    pushMatrix();    
    rotate(3*theta);   
    line(0, 0, 0, h);  
    translate(0, h); 
    branch(h);       
    popMatrix();
    
    float funCol2 = player.mix.level() *255.0 *10; 
    stroke(funCol2,75,33);
    pushMatrix();
    rotate(3*-theta);
    line(0, 0, 0, h);
    translate(0, h);
    branch(h);
    popMatrix();
  }
}
