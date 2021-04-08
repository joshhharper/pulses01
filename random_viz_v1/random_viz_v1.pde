import processing.serial.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//////////// HEARTBEAT IMPORT //////////////////////////
import processing.serial.*;  // serial library lets us talk to Arduino
Serial myPort;
Serial port;
int Sensor;      // HOLDS PULSE SENSOR DATA FROM ARDUINO
int IBI;         // HOLDS TIME BETWEN HEARTBEATS FROM ARDUINO
int BPM = 0;         // HOLDS HEART RATE VALUE FROM ARDUINO
String inData = "";

PFont font;
PFont portsFont;

int dataSerialInt;
int heart = 0;   // This variable times the heart image 'pulse' on screen
boolean beat = false;    // set when a heart beat is detected, then cleared when the BPM graph is advanced

/////////// AUDIO INPUT ///////////////////////////////////////////////
AudioPlayer player; //Initialize audio player
Minim minim; //Initialize minim

//Song & Background Selection
String[] sound_files = {
  "yuMountain.mp3", "zhiPipa.mp3", "melodyYuYao.mp3","lanHuaHua.mp3", "yuAncient.mp3", "shangSnow.mp3", "gong.mp3"
};
int[] song_backgrounds = {
  200, 50, 170, 25, 150, 80, 200
};

int random_value = floor(random(sound_files.length));
String song_name = sound_files[random_value];
int song_background = song_backgrounds[random_value];

/////////////////////////////////////////////////////////////////////////////////////// 
void setup() {
  size(1000, 1000);
  // Serial // (Changed these lines so we can just change the Array index to change ports as we have different systems)
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  myPort.buffer(4);
  // Audio
  minim = new Minim(this);
  player = minim.loadFile(song_name);
  //frameRate(15);
}
void draw() {
   dataSerialInt = int(inData);
   dataSerialInt = min(dataSerialInt, 800);
   println("serial data " + dataSerialInt);
   boolean isPulse = 40 < dataSerialInt;
   //////////// PICK SONG //////////////////////
   if (!player.isPlaying() && isPulse) {
      int random_value = int(random(sound_files.length));
      song_name = sound_files[random_value];
      player = minim.loadFile(song_name);
      player.play();
      //println(song_name);
    }
    /////////// SONG NAME (LATER THIS CAN PULL METADATA AND BE DISPLAYED) ///////////////////////
    switch (song_name) {
      case "zhiPipa.mp3":
         float funCol1 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
         float funSize1 = min(player.mix.level() * 6.283 * 9, 6.283);
         background(50, 50, 50);
         fill(max(funCol1, 50), max(funCol1, 50), max(funCol1 - 176, 33));
         arc(width/2, height/4, width/2, height/2, 0, funSize1);
         fill(max(funCol1, 50), max(funCol1, 50), max(funCol1 - 176, 78));
         arc(width/2, height * .75, width/3, height/3, 3.14, funSize1);
         println("This is zhipipa");
         break;
      case "yuMountain.mp3":
        float funCol2 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize2 = player.mix.level() * 1000.0;
        background(34,75,222);
        //ellipse(width/2, height/3, funSize2/3, funSize2);
        stroke(229, max(funCol2, 89), 52);
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
        println("This is yumountain");
        break;
      case "melodyYuYao.mp3":
        //float funCol3 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize3 = player.mix.level() * 800.0;
        float funWeight = player.mix.level() * 50;
        
        background(174, 184, 254);
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
        break;
        
      case "lanHuaHua.mp3":
        float funCol4 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize4 = player.mix.level() * 1000.0;
        background(150,88,funCol4);
        quad(width/3, height/2, funSize4, funSize4/2, funSize4/3,funSize4/5,funSize4/8,funSize4);
        println("This is lanhuahua");
        break;
      case "yuAncient.mp3":
        float funCol5 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize5 = player.mix.level() * 1000.0;
        background(200,funCol5,200);
        circle(width/funSize5, height/funSize5, funSize5);
        println("This is yuancient");
        break;
     case "shangSnow.mp3":
        float funCol6 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize6 = player.mix.level() * 1000.0;
        background(225,funCol6,75);
        rect(width/funSize6, height/funSize6, funSize6, funSize6/2);
        println("This is shangsnow");
        break;
     case "gong.mp3":
        float funCol7 = player.mix.level() *255.0 *10; //level is value bw 0-1 so multiply by 255
        float funSize7 = player.mix.level() * 1000.0;
        background(0,funCol7,220);
         circle(width/funSize7, height/funSize7, funSize7);
        println("This is gong");
        break;
   } 
}

void serialEvent (Serial myPort) {
  if (myPort.available() > 0){
    inData = myPort.readString();
    inData = trim(inData);
  } else {
      inData = "";
    }
}
  
void stop() {
 
  player.close();//kill player
  minim.stop();//kill minim
  super.stop();//kill superClass audio Minim
}
