//Stickクラスの宣言
class Stick{

  Vec3D loc; //location
  Vec3D oriLoc; //original location
  Vec3D vel; //velocity速さ（動く距離？）

  int generations; //世代

  String type; //string型は文字 //分岐タイプ


  //初期化用メソッド（コンストラクタ）
  Stick(Vec3D _loc, Vec3D _vel, int _generations, String _type){
    loc = _loc;
    oriLoc = _loc.copy(); //oriLocはlocのコピー
    vel = _vel;
    generations = _generations;
    type = _type;

    //stack of functions that get executed only once
    //以下のfucntionを一回のみ実行させるため、ここに記述する
    updateDir();
    updateLoc();
    spawn();
  }


  ////////// run //////////
  //the function that calls all the other functions

  void run(){
    display();
  }


  ////////// spawn //////////
  //create a new version of the same class
  //spawn＝卵

  void spawn(){

    if(generations > 0){ //int generationsが整数の時のみ

      if(type == "A"){
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel , generations-1, "A");

        allBobs.add(newBob);

        Vec3D v2 = loc.copy();
        Vec3D iniVel2 = vel.copy();
        Stick newBob2 = new Stick(v2, iniVel2 , generations-1, "B");

        allBobs.add(newBob2);
      }

      if(type == "B"){
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel , generations-1, "C");

        allBobs.add(newBob);
      }

      if(type == "C"){
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel , generations-1, "A");

        allBobs.add(newBob);
      }

    }
  }


  ////////// updateDirection //////////
  //velocity vecotr の回転角度

  void updateDir(){

    if(type == "A"){
      float angle1 = radians(0);
      float angle2 = radians(ANGLE1);
      float angle3 = radians(0);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(LENGTH);

    }

    if(type == "B"){
      float angle1 = radians(0);
      float angle2 = radians(0);
      float angle3 = radians(ANGLE2);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(LENGTH);
    }

    if(type == "C"){
      float angle1 = radians(-ANGLE3);
      float angle2 = radians(0);
      float angle3 = radians(0);

      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);

      vel.normalize();
      vel.scaleSelf(LENGTH);
    }
  }


  ////////// updateLoc //////////

  void updateLoc(){
    loc.addSelf(vel);
  }


  ////////// display //////////

  void display(){

    //locationに赤点をうつ
    //locationが動いた先
    //original locationから、locationまで線を引く

    //point
    //stroke(24, 41, 131); //blue
    //stroke(#a63e14);
    stroke(#558a86);
    strokeWeight(4);
    point(loc.x,loc.y,loc.z);

    //line
    stroke(#f1f2f0); //white
    strokeWeight(1);
    line(loc.x,loc.y,loc.z, oriLoc.x,oriLoc.y,oriLoc.z);

  }

} //class Stick の閉じかっこ
