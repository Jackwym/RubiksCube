color[] COLORS = new color[] {color(255, 255, 255), color(232, 255, 117), color(255, 0, 0), color(237, 156, 5), color(0, 0, 255), color(0, 255, 0)};
Cube c;

// scramble stuff
boolean scrambling;
int scrambleLength = 20;
char[] scramble = new char[20];
int x = 0;

// camera rotation stuff
float camRotation;
float orbitRadius;
float ypos;
float xpos;
float zpos;

// rotation floats
float count = 1;
float speed = 5;
float definiteSpeed = 5;
boolean botating;

// setup globals
boolean rotating = false;
int direction = 0;
int axis = 0;
int side = 0;

void setup() {
  size(600, 600, P3D);
  noLights();
  stroke(10);
  frameRate(120);
  
  camera(240, 300, (height/2) / tan(PI/6), 0, 0, 0, 0, -1, 0);
  //camera(0, 0, (height/2) / tan(PI/6), 0, 0, 0, 0, -1, 0);
  c = new Cube(100, COLORS);
}

void draw() {
  background(0);
  c.rotateCamera();
  if (rotating) {
    rotateCube();
  }
  if (c.isSolved() && scrambleLength > 0) {
    scrambling = true;
    c.scrambleCube();
  }
  if (x == 20) {
    c.reverseScramble();  
    x -= 1;
  }

  if (x >= 0 && !rotating && !scrambling) {
    botKey(scramble[x]);
    x -= 1;
  }
  c.show();
}

void botKey(char s) {
  if (rotating) return;
  botating = true;
  key = s;
  keyPressed();
  
  switch(s) {
    // double turns bot only
    case '0': // l2
      axis = 0;
      direction = 2;
      side = 0;
      break;
    case '1': // m2
      axis = 0;
      direction = 2;
      side = 1;
      break;
    case '2': // r2
      axis = 0;
      direction = -2;
      side = 2;
      break;
    case '3': // u2
      axis = 1;
      direction = 2;
      side = 0;
      break;
    case '4': // e2
      axis = 1;
      direction = -2;
      side = 1;
      break;
    case '5': // d2
      axis = 1;
      direction = -2;
      side = 2;
      break;
    case '6': // f2
      axis = 2;
      direction = -2;
      side = 0;
      break;
    case '7': // s2
      axis = 2;
      direction = 2;
      side = 1;
      break;
    case '8': // b2
      axis = 2;
      direction = 2;
      side = 2;
      break;
    default:
      return;
  }
  rotating = true;
  botating = false;
}

void keyPressed() {
  if (rotating) return;
  // if (c.isSolved()) return;
  speed = 5;
  definiteSpeed = 5;
  if (botating) {
    speed = 10;
    definiteSpeed = 10;
  }
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
  botating = false;
}

void rotateCube() {
  c.rotateCube(speed * direction, axis, side);
  if(count >= 70 - 5 * definiteSpeed) {
    count = 1;
    rotating = false;
  } 
  else if (count == 69 - 5 * definiteSpeed) {
    speed *= 0.9965 - (0.0465 * (definiteSpeed / 5));
    speed -= 0.1006221 - (0.0446221 * (definiteSpeed / 5));
    count++;
    c.rotateCubePosition();
  }
  else {
     speed *= 0.9965 - (0.0465 * (definiteSpeed / 5));
     count++;
   }
}
