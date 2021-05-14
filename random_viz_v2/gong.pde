
PImage gong_img;
void setupGong()
{
   // put setup code here 
   background(240, 200, 8);
   gong_img = loadImage("gong_nobackground.png");

}

void drawGong()
{
          gong_img = loadImage("gong_nobackground.png");
          if (player.isPlaying()){
          imageMode(CENTER);
          image(gong_img, 700, 700);
          }

          float funCol7 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
          float funSize7 = player.mix.level() * 1000.0;
          
          circle(width/funSize7, height/funSize7, funSize7);
          println("This is gong");
}
