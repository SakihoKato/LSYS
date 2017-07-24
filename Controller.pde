float ANGLE1 = 0;
float ANGLE2 = 0;
float ANGLE3 = 0;
int ITE = 0;
int LENGTH = 0;

class ControlFrame extends PApplet {

  int w, h;
  PApplet parent;
  ControlP5 cp5;

  public ControlFrame(PApplet _parent, int _w, int _h, String _name) {
    super();
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
  }

  public void settings() {
    size(w, h);
  }

  public void setup() {
    surface.setLocation(10, 10);
    cp5 = new ControlP5(this);

    //sliderの色
    cp5.setColorBackground(#f1f2f0);
    cp5.setColorForeground(#558a86);
    cp5.setColorActive(#a63e14);
    // setColorForeground
    // setColorActive
    // setColorLabel
    // setColorValue

    cp5.addSlider("ANGLE1")
       .plugTo(parent, "ANGLE1")
       .setRange(-90, 90)
       .setValue(5)
       .setPosition(100, 10)
       .setSize(200, 20);

    cp5.addSlider("ANGLE2")
      .plugTo(parent, "ANGLE2")
      .setRange(-90, 90)
      .setValue(90)
      .setPosition(100, 50)
      .setSize(200, 20);

    cp5.addSlider("ANGLE3")
      .plugTo(parent, "ANGLE3")
      .setRange(-90, 90)
      .setValue(11)
      .setPosition(100, 90)
      .setSize(200, 20);

    cp5.addSlider("ITE")
      .plugTo(parent, "ITE")
      .setRange(0, 30)
      .setValue(4)
      .setPosition(100, 130)
      .setSize(200, 20);

    cp5.addSlider("LENGTH")
      .plugTo(parent, "LENGTH")
      .setRange(0, 500)
      .setValue(50)
      .setPosition(100, 170)
      .setSize(200, 20);
  }

  void draw() {
    background(#bfbabe);
  }
}
