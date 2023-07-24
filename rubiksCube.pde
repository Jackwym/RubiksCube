color[] COLORS = new color[] {color(255, 255, 255), color(232, 255, 117), color(255, 0, 0), color(237, 156, 5), color(0, 0, 255), color(0, 255, 0)};
Cube c;
float count = 1;
float speed = 90;

void setup() {
  size(600, 600, P3D);
  noLights();
  stroke(10);
  
  camera(240, 300, (height/2) / tan(PI/6), 0, 0, 0, 0, -1, 0);
  //camera(0, 0, (height/2) / tan(PI/6), 0, 0, 0, 0, -1, 0);
  c = new Cube(100, COLORS);
  //pressKey('u');
  //c.rotateCube(speed * direction, axis, side);
  //pressKey('r');
  //c.rotateCube(speed * direction, axis, side);
  //pressKey('r');
  //c.rotateCube(speed * direction, axis, side);
  //pressKey('r');
  //c.rotateCube(speed * direction, axis, side);
}

void draw() {
  background(0);
  
  if (rotating) {
    rotateCube();
  }
  c.show();
}

boolean rotating = false;
int direction = 0;
int axis = 0;
int side = 0;


//void pressKey(char s) {
//  switch(s) {
//    case 'l':
//      axis = 0;
//      direction = 1;
//      side = 0;
//      break;
//    case 'm':
//      axis = 0;
//      direction = 1;
//      side = 1;
//      break;
//    case 'r':
//      axis = 0;
//      direction = -1;
//      side = 2;
//      break;
//    case 'u':
//      axis = 1;
//      direction = 1;
//      side = 0;
//      break;
//    case 'e':
//      axis = 1;
//      direction = -1;
//      side = 1;
//      break;
//    case 'd':
//      axis = 1;
//      direction = -1;
//      side = 2;
//      break;
//    case 'f':
//      axis = 2;
//      direction = -1;
//      side = 0;
//      break;
//    case 's':
//      axis = 2;
//      direction = 1;
//      side = 1;
//      break;
//    case 'b':
//      axis = 2;
//      direction = 1;
//      side = 2;
//      break;
//    default:
//      return;
//  }
  
//  rotating = true;
//}
      

void keyPressed() {
  if (rotating) return;
  // if (c.isSolved()) return;
  switch(key) {
    case 'l':
      axis = 0;
      direction = 1;
      side = 0;
      break;
    case 'm':
      axis = 0;
      direction = 1;
      side = 1;
      break;
    case 'r':
      axis = 0;
      direction = -1;
      side = 2;
      break;
    case 'u':
      axis = 1;
      direction = 1;
      side = 0;
      break;
    case 'e':
      axis = 1;
      direction = -1;
      side = 1;
      break;
    case 'd':
      axis = 1;
      direction = -1;
      side = 2;
      break;
    case 'f':
      axis = 2;
      direction = -1;
      side = 0;
      break;
    case 's':
      axis = 2;
      direction = 1;
      side = 1;
      break;
    case 'b':
      axis = 2;
      direction = 1;
      side = 2;
      break;
    default:
      return;
  }
  
  rotating = true;
}

float rSpeed = 5;

void rotateCube() {
  println(rSpeed);
  c.rotateCube(rSpeed * direction, axis, side);
  if(count >= 45) {
    count = 1;
    rSpeed = 5;
    rotating = false;
  } else {
    count++;
    rSpeed *= .95;
  }
}
