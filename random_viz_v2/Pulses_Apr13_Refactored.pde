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

Song & Background Selection
String[] sound_files = {
  "shangSnow.mp3",
  "yuAncient.mp3","zhiPipa.mp3", "melodyYuYao.mp3","lanHuaHua.mp3", "real_jiao.mp3", "shangSnow.mp3", "gong.mp3"
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
  
  switch (song_name) {
      case "zhiPipa.mp3":
         setupZhiPipa();
         break;
         
      case "real_jiao.mp3":
        setupJiaoMountain();
        break;
        
      case "melodyYuYao.mp3":
        setupMelodyYuYao();
        break;
        
      case "lanHuaHua.mp3":
         setupLanHuaHua();
         break;
         
      case "yuAncient.mp3":
        setupYuAncient();
        break;
        
     case "shangSnow.mp3":
        setupShangSnow();
        break;
        
     case "gong.mp3":
        setupGong();
        break;
   } 
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
         drawZhiPipa();
         break;
         
      case "real_jiao.mp3":
        drawJiaoMountain();
        break;
        
      case "melodyYuYao.mp3":
        drawMelodyYuYao();
        break;
        
      case "lanHuaHua.mp3":
         drawLanHuaHua();
         break;
         
      case "yuAncient.mp3":
        drawYuAncient();
        break;
        
     case "shangSnow.mp3":
        drawShangSnow();
        break;
        
     case "gong.mp3":
        drawGong();
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
