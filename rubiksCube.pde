color[] COLORS = new color[] {color(255, 255, 255), color(232, 255, 117), color(255, 0, 0), color(237, 156, 5), color(0, 0, 255), color(0, 255, 0)};
Cube c;

void setup() {
  size(600, 600, P3D);
  noLights();
  stroke(10);
  frameRate(Float.MAX_VALUE);
  
  camera(240, 300, (height/2) / tan(PI/6), 0, 0, 0, 0, -1, 0);
  //camera(0, 0, (height/2) / tan(PI/6), 0, 0, 0, 0, -1, 0);
  c = new Cube(100, COLORS);
}

void draw() {
  background(0);
  
  if (rotating) {
    rotateCube();
  }
  c.show();
}

boolean rotating = true;
int direction = 4;
int axis = 0;
int side = 0;


//void botKey(char s) {
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
      direction = 1;
      side = 0;
      break;
    case 's':
      axis = 2;
      direction = 1;
      side = 1;
      break;
    case 'b':
      axis = 2;
      direction = -1;
      side = 2;
      break;
      
    // primes denoted by capital letters
    case 'L':
      axis = 0;
      direction = -1;
      side = 0;
      break;
    case 'M':
      axis = 0;
      direction = -1;
      side = 1;
      break;
    case 'R':
      axis = 0;
      direction = 1;
      side = 2;
      break;
    case 'U':
      axis = 1;
      direction = -1;
      side = 0;
      break;
    case 'E':
      axis = 1;
      direction = 1;
      side = 1;
      break;
    case 'D':
      axis = 1;
      direction = 1;
      side = 2;
      break;
    case 'F':
      axis = 2;
      direction = -1;
      side = 0;
      break;
    case 'S':
      axis = 2;
      direction = -1;
      side = 1;
      break;
    case 'B':
      axis = 2;
      direction = 1;
      side = 2;
      break;
    default:
      return;
  }
  
  rotating = true;
}

float count = 1;
float rSpeed = 5;

void rotateCube() {
  println(rSpeed);
  c.rotateCube(rSpeed * direction, axis, side);

  if(count >= 45) {
    c.correctCube(); // comment or uncomment here to enable and disable rotation correction

    count = 1;
    rSpeed = 5;
    rotating = false;
  } else {
    count++;
    rSpeed *= .95;
  }
}
