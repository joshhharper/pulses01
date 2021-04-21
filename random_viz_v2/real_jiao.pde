
PImage jiao_image;

void setupJiaoMountain()
{
  
  jiao_image = loadImage("jiao_nobackground.png");

  
}

void drawJiaoMountain()
{
        float funCol2 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize2 = player.mix.level() * 1000.0;
        background(80, 137, 145);
        //ellipse(width/2, height/3, funSize2/3, funSize2);
        if (player.isPlaying()) {
          imageMode(CENTER);
          image(jiao_image, 900, 900, 300, 212);
        }
        stroke(181, max(funCol2, 226), 250);
        //stroke(229, max(funCol2, 89), 52);
        strokeWeight(8);
        noFill();
        bezier(457, 900, 400, funSize2, 300, funSize2, 800, 800);
        strokeWeight(5);
        bezier(100, 400, funSize2, -funSize2, 300, funSize2, 800, 800);
        strokeWeight(9);
        bezier(246, 784, funSize2, 50, 300, funSize2, -funSize2, 800);
        strokeWeight(10);
        bezier(800, 50, 450, 50, 300, funSize2 -50, 50, 900);
        strokeWeight(10);
        bezier(840, 100, 800, 700, 900, 1000 - funSize2, 40, 940); 
        println("This is jiao");  
  
}
