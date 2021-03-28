import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//////////// FROM HEARTBEAT CODE //////////////////////////
import processing.serial.*;  // serial library lets us talk to Arduino
Serial myPort;
PFont font;
PFont portsFont;
Serial port;
int Sensor;      // HOLDS PULSE SENSOR DATA FROM ARDUINO
int IBI;         // HOLDS TIME BETWEN HEARTBEATS FROM ARDUINO
int BPM = 0;         // HOLDS HEART RATE VALUE FROM ARDUINO
String inData = "";

int dataSerialInt;

int heart = 0;   // This variable times the heart image 'pulse' on screen
//  THESE VARIABLES DETERMINE THE SIZE OF THE DATA WINDOWS
boolean beat = false;    // set when a heart beat is detected, then cleared when the BPM graph is advanced
/////////////////////////////////////////////////////////////////////////////////




AudioPlayer player; //Initialize audio plaeyr
Minim minim; //Initialize minim


//store names of mp3 files here
String[] sound_files = {
  "Zhi - The Song of Pipa.mp3", "Yu-The Mountain.mp3", "melodyyuyao.mp3", "lanhuahua.mp3", "Yu-The Ancient Tune.mp3",
  "Shang-Snow on River.mp3", "Gong - Flowing Water.mp3"
};
 
void setup() {
  myPort = new Serial(this, "COM3", 9600);
  myPort.buffer(4);
  size(100, 100);
  minim = new Minim(this);
  int random_value = int(random(sound_files.length));
  String song_name = sound_files[random_value];
  player = minim.loadFile(song_name);
  background(0);
  player.pause();
}
 
void serialEvent (Serial myPort) {
  // get the byte:
  //int inByte = myPort.read();
  // print it:
  //println(inByte);
  if (myPort.available() > 0){
    inData = myPort.readString();
    inData = trim(inData);
  }else {
      inData = "";
    }
}
  

void draw() {
   dataSerialInt = int(inData);
   dataSerialInt = min(dataSerialInt, 200);
   println("serial data " + dataSerialInt);
   boolean isPulse = 50 < dataSerialInt;
 
    if (!player.isPlaying() && isPulse) {
      int random_value = int(random(sound_files.length));
      //math.floor ? math.round, math.ceiling
      String song_name = sound_files[random_value];
      player = minim.loadFile(song_name);
      player.play();
    }
}

 
  void stop(){
 
    player.close();//kill player
    minim.stop();//kill minim
    super.stop();//kill superClass audio Minim
  }
