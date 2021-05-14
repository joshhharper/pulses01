PImage zhi_image;

void setupZhiPipa()
{
  zhi_image = loadImage("zhi_nobackground.png");
}

void drawZhiPipa()
{
         zhi_image = loadImage("zhi_nobackground.png");
         float funCol1 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
         float funSize1 = min(player.mix.level() * 6.283 * 9, 6.283);
         background(193);
         if (player.isPlaying()){
           image(zhi_image, 700, 750, 300, 212);
         }
         fill(max(193 - funCol1, 187), max(193 - funCol1, 68), max(193 - funCol1, 48));
         arc(width/2, height/4, width/2, height/2, 0, funSize1);
         fill(max(193 - funCol1, 187), max(193 - funCol1, 68), max(193 - funCol1, 48));
         arc(width/2, height * .75, width/3, height/3, 3.14, funSize1);
         println("This is zhipipa");
}
