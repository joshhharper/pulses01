
PImage yu_image3;

void setupLanHuaHua()
{
  yu_image3 = loadImage("yu_nobackground.png");
   // put setup code here 
}

void drawLanHuaHua()
{
         yu_image3 = loadImage("yu_nobackground.png");
         background (100,100,100);
         if (player.isPlaying()){
           imageMode(CENTER);
           tint(255, 150);
           image(yu_image3, 500, 700, 300, 212);
         }
         float funCol4 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
         float funSize4 = player.mix.level() * 1000.0;
         float x = 0; 
         float h = 100;
         int w = 10; // WIDTH ALWAYS 10
         float y = random(75,funSize4+75); // HEIGHT RANDOMIZED
         for( float i = x; i <= width; i = i + w * 2 ) {
            noStroke();    //takes away stroke
            if((mousePressed == true) && (funSize4 <= 45)) {
            h = random(50,800); // Y START RANDOMIZES
            fill(random(funCol4,255), random(50,150), random(150,255));
            } else if ((mousePressed == true) && (funSize4 > 45)) {
            x = random(150, 600);
            } else {
              h = 100; //when the mouse isn't clicked the y position will be 200
            }
         rect( i, y, w, h );//draws rect  
         }
         println("THis is zhipipa"); 
}
