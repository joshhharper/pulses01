
PImage yu_image2;

void setupMelodyYuYao()
{
   yu_image2 = loadImage("yu_nobackground.png");
}

void drawMelodyYuYao()
{
 //float funCol3 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize3 = player.mix.level() * 800.0;
        float funWeight = player.mix.level() * 50;
        
        background(174, 184, 254);
        if (player.isPlaying()) {
                imageMode(CENTER);
                image(yu_image2, 500, 500, 300, 212);
              }
        strokeWeight(min(40, funWeight));
        stroke(39, 24, 126);
        translate(30, funSize3);
        point(400, 619);
        point(500, 513);
        point(200, 100);
        point(453, 742);
        point(10, 220);
        point(300, 300);
        point(680, 329);
        point(783, 40);
        point(273, 600);
        point(800, 450);
        
        pushMatrix();
        translate(funSize3, 50);
        strokeWeight(max(15, funWeight));
        point(10, 10);
        point(220, 100);
        point(84, 739);
        point(593, 695);
        point(200, 100);
        point(453, 742);
        point(10, 220);
        point(186, 599);
        point(273, 600);
        popMatrix();
        ////
        pushMatrix();
        translate(0,funSize3);
        strokeWeight(max(25, funSize3));
        point(300, 300);
        point(680, 329);
        point(783, 40);
        point(84, 739);
        point(593, 695);
        point(200, 100);
        point(453, 742);
        popMatrix();
        println("This is melodyyuyao"); 
}
