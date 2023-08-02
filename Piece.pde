class Piece {
  Quaternion rot;
  float side;
  int[] sidePos;
  
  public Piece(float angle, PVector axis, float len, int[] s) {
    sidePos = s;
    side = len;
    rot = new Quaternion(radians(angle), axis);
  }

boolean canGoRight;
boolean canGoLeft;
float rad;

  void rotatePiece(float angle, int axis) {
    rad = radians(angle);
    Quaternion q = new Quaternion();

    switch(axis) {
      case 0:
        q = new Quaternion(rad, new PVector(1, 0, 0));
        break;
      case 1:
        q = new Quaternion(rad, new PVector(0, 1, 0));
        break;
      case 2:
        q = new Quaternion(rad, new PVector(0, 0, 1));
        break;
    }
    
    rot = rot.mult(q);
  }
  
int x = 1;  
  
  public void rotatePosition() {
    if (direction == 2 || direction == -2) {
      direction /= 2;
      x++;
    }
    for (int i = 0; i < x; i++) {
      if (axis == 0) {
        if (sidePos[1] == 0) { // top
          if (sidePos[2] == 1) {
            sidePos[1] += 1;
            sidePos[2] -= direction;
          } else if (sidePos[2] == 0) {
            if (direction == 1) sidePos[1] += 2;
            else sidePos[2] += 2;
          } else if (sidePos[2] == 2) {
            if (direction == 1) sidePos[2] -= 2;
            else sidePos[1] += 2;
          }
          
        } else if (sidePos[1] == 2) { // bottom
          if (sidePos[2] == 1) {
            sidePos[1] -= 1;
            sidePos[2] += direction;
          } else if (sidePos[2] == 0) {
            if (direction == 1) sidePos[2] += 2;
            else sidePos[1] -= 2;
          } else if (sidePos[2] == 2) {
            if (direction == 1) sidePos[1] -= 2;
            else sidePos[2] -= 2;
          }
          
        }
          else if (sidePos[2] == 0) { // middle
            sidePos[2] += 1;
            sidePos[1] += direction;
          }
          else if (sidePos[2] == 2) { // middle
            sidePos[2] -= 1;
            sidePos[1] -= direction;
          }
      
      
      
      
      } else if (axis == 1) {
        direction *= -1;
        if (sidePos[0] == 0) { // top
          if (sidePos[2] == 1) {
            sidePos[0] += 1;
            sidePos[2] -= direction;
          } else if (sidePos[2] == 0) {
            if (direction == 1) sidePos[0] += 2;
            else sidePos[2] += 2;
          } else if (sidePos[2] == 2) {
            if (direction == 1) sidePos[2] -= 2;
            else sidePos[0] += 2;
          }
          
        } else if (sidePos[0] == 2) { // bottom
          if (sidePos[2] == 1) {
            sidePos[0] -= 1;
            sidePos[2] += direction;
          } else if (sidePos[2] == 0) {
            if (direction == 1) sidePos[2] += 2;
            else sidePos[0] -= 2;
          } else if (sidePos[2] == 2) {
            if (direction == 1) sidePos[0] -= 2;
            else sidePos[2] -= 2;
          }
          
        }
          else if (sidePos[2] == 0) { // middle
            sidePos[2] += 1;
            sidePos[0] += direction;
          }
          else if (sidePos[2] == 2) { // middle
            sidePos[2] -= 1;
            sidePos[0] -= direction;
          }
        direction *= -1;
        
        
      } else if (axis == 2) {
        if (sidePos[0] == 0) { // top
          if (sidePos[1] == 1) {
            sidePos[0] += 1;
            sidePos[1] -= direction;
          } else if (sidePos[1] == 0) {
            if (direction == 1) sidePos[0] += 2;
            else sidePos[1] += 2;
          } else if (sidePos[1] == 2) {
            if (direction == 1) sidePos[1] -= 2;
            else sidePos[0] += 2;
          }
          
        } else if (sidePos[0] == 2) { // bottom
          if (sidePos[1] == 1) {
            sidePos[0] -= 1;
            sidePos[1] += direction;
          } else if (sidePos[1] == 0) {
            if (direction == 1) sidePos[1] += 2;
            else sidePos[0] -= 2;
          } else if (sidePos[1] == 2) {
            if (direction == 1) sidePos[0] -= 2;
            else sidePos[1] -= 2;
          }
          
        }
          else if (sidePos[1] == 0) { // middle
            sidePos[1] += 1;
            sidePos[0] += direction;
          }
          else if (sidePos[1] == 2) { // middle
            sidePos[1] -= 1;
            sidePos[0] -= direction;
          }
      }
    }
    if (x == 2) direction *= 2;
    x = 1;
  }

  boolean checkPiece(Piece p) {
      return p.rot.equal(rot);
  }
  
  boolean getSide(int axis, int side) {
    return sidePos[axis] == side;
  }

  void show() {
    PVector rotation = rot.getAngles();

    pushMatrix();
    rotateZ(rotation.z);
    rotateY(rotation.y);
    rotateX(rotation.x);
  }
}

class Corner extends Piece {
  color[] colors;

  public Corner(float an, PVector ax, float l, int[] s, color[] c) {
    super(an, ax, l, s);
    colors = c;
  }

  void show() {
    super.show();

    translate(side, side, side);

    beginShape(QUADS);
      fill(colors[0]);
      vertex(-(side / 2), side / 2, side / 2);
      vertex(side / 2, side / 2, side / 2);
      vertex(side / 2, side / 2, -(side / 2));
      vertex(-(side / 2), side / 2, -(side / 2));
    
      fill(colors[1]);
      vertex(-(side / 2), side / 2, side / 2);
      vertex(side / 2, side / 2, side / 2);
      vertex(side / 2, -(side / 2), side / 2);
      vertex(-(side / 2), -(side / 2), side / 2);

      fill(colors[2]);
      vertex(side / 2, side / 2, -(side / 2));
      vertex(side / 2, side / 2, side / 2);
      vertex(side / 2, -(side / 2), side / 2);
      vertex(side / 2, -(side / 2), -(side / 2));
    endShape();

    fill(50);
    box(side - .1);

    popMatrix();
  }
}

class Edge extends Piece {
  color[] colors;

  public Edge(float an, PVector ax, float l, int[] s, color[] c) {
    super(an, ax, l, s);
    colors = c;
  }

  void show() {
    super.show();
    
    translate(0, side, side);

    beginShape(QUADS);
      fill(colors[0]);
      vertex(-(side / 2), side / 2, side / 2);
      vertex(side / 2, side / 2, side / 2);
      vertex(side / 2, side / 2, -(side / 2));
      vertex(-(side / 2), side / 2, -(side / 2));
      
      fill(colors[1]);
      vertex(-(side / 2), side / 2, side / 2);
      vertex(side / 2, side / 2, side / 2);
      vertex(side / 2, -(side / 2), side / 2);
      vertex(-(side / 2), -(side / 2), side / 2);
     endShape();

    fill(50);
    box(side - .1);

    popMatrix();
  }
}

class Center extends Piece {
  color c;

  public Center(float an, PVector ax, float l, int[] s, color c) {
    super(an, ax, l, s);
    this.c = c;
  }

  void show() {
    super.show();

    translate(0, side, 0);

    beginShape(QUADS);
       fill(c);
      vertex(-(side / 2), side / 2, side / 2);
      vertex(side / 2, side / 2, side / 2);
      vertex(side / 2, side / 2, -(side / 2));
      vertex(-(side / 2), side / 2, -(side / 2));
    endShape();

    fill(50);
    box(side - .1);

    popMatrix();
  }
}
