import org.gamecontrolplus.*;
ControlIO control;
ControlDevice device;

PVector joyR = new PVector(0, 0);
PVector joyL = new PVector(0, 0);
float R2, L2;

void setup() {
  size(640, 480);
  control = ControlIO.getInstance(this);
  println(": " + control.getDevices());
  device = control.getDevice("Wireless Controller");
  rectMode(CENTER);
  stroke(255);
}

void draw() {
  background(0);
  for (int i = 0; i < device.getNumberOfButtons(); i++) {
    ControlButton button = device.getButton(i);
    if (button.pressed())println(i);//押したボタンの数字を表示
  }
  for (int i = 0; i < device.getNumberOfSliders(); i++) {
    ControlSlider slider = device.getSlider(i);
    //println(i + ": " + slider.getValue());//-1.0 to 1.0
    //0:RY, 1:RX, 2:LY, 3:LX, 4:R2, 5:L2
    joyR.y = device.getSlider(0).getValue();
    joyR.x = device.getSlider(1).getValue();
    joyL.y = device.getSlider(2).getValue();
    joyL.x = device.getSlider(3).getValue();
    R2 = device.getSlider(4).getValue();
    L2 = device.getSlider(5).getValue();
  }
  
  //menu button
  fill(255*device.getButton(9).getValue());
  ellipse(width/2-75, height-200, 25, 25);
  fill(255*device.getButton(10).getValue());
  ellipse(width/2+75, height-200, 25, 25);
  fill(255*device.getButton(13).getValue());
  ellipse(width/2, height-130, 50, 50);
  fill(255*device.getButton(14).getValue());
  rect(width/2, height-200, 50, 25);
  
  
  //right 4 button
  fill(255*device.getButton(1).getValue());
  rect(width/2+100, height/2-50, 25, 25);
  fill(255*device.getButton(2).getValue());
  rect(width/2+125, height/2-25, 25, 25);
  fill(255*device.getButton(3).getValue());
  rect(width/2+150, height/2-50, 25, 25);
  fill(255*device.getButton(4).getValue());
  rect(width/2+125, height/2-75, 25, 25);

  //joyStick
  fill(255*device.getButton(12).getValue());
  ellipse((width/2+200)+joyR.x*50, (height/2+100)+joyR.y*50, 50, 50);
  fill(255*device.getButton(11).getValue());
  ellipse((width/2-200)+joyL.x*50, (height/2+100)+joyL.y*50, 50, 50);
  
  //L1,2 R1,2
  fill(255*device.getButton(5).getValue());
  rect(50, (height/2-150)+L2*50, 50, 50);
  fill(255*device.getButton(6).getValue());
  rect(width-50, (height/2-150)+R2*50, 50, 50);
}
