class Cube {
  Piece[] pieces;
  Piece[] solvedPieces;
  
  public Cube(float u, color[] c) {
    pieces = new Piece[26];
    
    // white[0], yellow[1], red[2], orange[3], blue[4], green[5]
    
    // top side
    pieces[0] = new Edge(0, new PVector(0, 1, 0), u, new int[] {1, 0, 0}, new color[] {c[1], c[2]}); // 1, 2
    pieces[1] = new Edge(90, new PVector(0, 1, 0), u, new int[] {0, 0, 1}, new color[] {c[1], c[4]}); // 1, 4
    pieces[2] = new Edge(180, new PVector(0, 1, 0), u, new int[] {1, 0, 2}, new color[] {c[1], c[3]}); // 1, 3
    pieces[3] = new Edge(270, new PVector(0, 1, 0), u, new int[] {2, 0, 1}, new color[] {c[1], c[5]}); // 1, 5
    pieces[4] = new Corner(0, new PVector(0, 1, 0), u, new int[] {0, 0, 0}, new color[] {c[1], c[2], c[4]}); // 1, 2, 4
    pieces[5] = new Corner(90, new PVector(0, 1, 0), u, new int[] {0, 0, 2}, new color[] {c[1], c[4], c[3]}); // 1, 4, 3
    pieces[6] = new Corner(180, new PVector(0, 1, 0), u, new int[] {2, 0, 2}, new color[] {c[1], c[3], c[5]}); // 1, 3, 5
    pieces[7] = new Corner(270, new PVector(0, 1, 0), u, new int[] {2, 0, 0}, new color[] {c[1], c[5], c[2]}); // 1, 5, 2
    pieces[8] = new Center(0, new PVector(0, 1, 0), u, new int[] {1, 0, 1}, c[1]); // 1
    
    // bottom side
    pieces[9] = new Edge(180, new PVector(0, 0, 1), u, new int[] {1, 2, 0}, new color[] {c[0], c[2]}); // 0, 2
    pieces[10] = new Edge(180, new PVector(1, 0, -1), u, new int[] {2, 2, 1}, new color[] {c[0], c[5]}); // 0, 5
    pieces[11] = new Edge(180, new PVector(1, 0, 0), u, new int[] {1, 2, 2}, new color[] {c[0], c[3]}); // 0, 3
    pieces[12] = new Edge(180, new PVector(1, 0, 1), u, new int[] {0, 2, 1}, new color[] {c[0], c[4]}); // 0, 4
    pieces[13] = new Corner(90, new PVector(1, 0, 0), u, new int[] {0, 2, 0}, new color[] {c[2], c[0], c[4]}); // 2, 0, 4
    pieces[14] = new Corner(180, new PVector(1, 0, 0), u, new int[] {0, 2, 2}, new color[] {c[0], c[3], c[4]}); // 0, 3, 4
    pieces[15] = new Corner(180, new PVector(1, -1, 0), u, new int[] {2, 2, 2}, new color[] {c[5], c[3], c[0]}); // 5, 3, 0
    pieces[16] = new Corner(240, new PVector(-1, 1, -1), u, new int[] {2, 2, 0}, new color[] {c[5], c[0], c[2]}); // 5, 0, 2
    pieces[17] = new Center(180, new PVector(1, 0, 0), u, new int[] {1, 2, 1}, c[0]); // 0
    
    // belt
    pieces[18] = new Edge(90, new PVector(0, 0, 1), u, new int[] {2, 1, 0}, new color[] {c[5], c[2]}); // 5, 2
    pieces[19] = new Edge(270, new PVector(0, 0, 1), u, new int[] {0, 1, 0}, new color[] {c[4], c[2]}); // 4, 2
    pieces[20] = new Edge(180, new PVector(1, 1, 0), u, new int[] {0, 1, 2}, new color[] {c[4], c[3]}); // 4, 3
    pieces[21] = new Edge(180, new PVector(-1, 1, 0), u, new int[] {2, 1, 2}, new color[] {c[5], c[3]}); // 5, 3
    pieces[22] = new Center(90, new PVector(0, 0, 1), u, new int[] {2, 1, 1}, c[5]); // 5
    pieces[23] = new Center(90, new PVector(1, 0, 0), u, new int[] {1, 1, 0}, c[2]); // 2
    pieces[24] = new Center(270, new PVector(0, 0, 1), u, new int[] {0, 1, 1}, c[4]); // 4
    pieces[25] = new Center(270, new PVector(1, 0, 0), u, new int[] {1, 1, 2}, c[3]); // 3
    
    solvedPieces = new Piece[26];
    
    for(int i = 0; i < pieces.length; i++) {
      solvedPieces[i] = pieces[i];
    }
  }

  public void show() {
    for (Piece p : pieces) {
      p.show();
    }
  }

  public void rotateCube(float angle, int axis, int side) {
    for (Piece p : pieces) {
      if (p.getSide(axis, side)) p.rotatePiece(angle, axis);
    
    }
  }
  
  public void rotateCubePosition() {
    for (Piece p : pieces) {
      if (p.sidePos[axis] == side) {
        p.rotatePosition();
      }
    }
  }
  
  boolean isSolved() {
    for(int i = 0; i < pieces.length; i++) {
      if(!pieces[i].checkPiece(solvedPieces[i])) {
        return false;
      }
    }
    return true;
  }
  
char[] moves = {'r', 'l', 'f', 'b', 'u', 'd', 'm', 'e', 's', 
                    'R', 'L', 'F', 'B', 'U', 'D', 'M', 'E', 'S', 
                    '0', '1', '2', '3', '4', '5', '6', '7', '8'};
  public void scrambleCube() {
    if (rotating) return;
    int randIndex = (int)random(0, 27);
    botKey(moves[randIndex]);
    scramble[x] = moves[randIndex];
    scrambleLength -= 1;
    if (scrambleLength == 0) {
      scrambling = false;
      // uncomment when sides turn (.isSolved is always true)
      // scrambleLength = 20;
    }
    x += 1;
  }
  public void reverseScramble() {
    for (int i = 0; i < x; i++) {
      if (Character.isLowerCase(scramble[i])) {
        switch(scramble[i]) {
          case 'r':
            scramble[i] = 'R';
            break;
          case 'l':
            scramble[i] = 'L';
            break;
          case 'f':
            scramble[i] = 'F';
            break;
          case 'b':
            scramble[i] = 'B';
            break;
          case 'u':
            scramble[i] = 'U';
            break;
          case 'd':
            scramble[i] = 'D';
            break;
          case 'm':
            scramble[i] = 'M';
            break;
          case 'e':
            scramble[i] = 'E';
            break;
          case 's':
            scramble[i] = 'S';
            break;
          default:
            break;
        }
        continue;
      }
      if (Character.isUpperCase(scramble[i])) {
        switch(scramble[i]) {
          case 'R':
            scramble[i] = 'r';
            break;
          case 'L':
            scramble[i] = 'l';
            break;
          case 'F':
            scramble[i] = 'f';
            break;
          case 'B':
            scramble[i] = 'b';
            break;
          case 'U':
            scramble[i] = 'u';
            break;
          case 'D':
            scramble[i] = 'd';
            break;
          case 'M':
            scramble[i] = 'm';
            break;
          case 'E':
            scramble[i] = 'e';
            break;
          case 'S':
            scramble[i] = 's';
            break;
          default:
            break;
        }
      }
    }
  }
public void rotateCamera() {
    orbitRadius = 500;
    ypos = 300;
    xpos = cos(radians(camRotation))*orbitRadius;
    zpos = sin(radians(camRotation))*orbitRadius;
    
    camera(xpos, ypos, zpos, 0, 0, 0, 0, -1, 0);
    
    camRotation += .2;
    if (camRotation == 360.00357) camRotation = 0;
  }
}
