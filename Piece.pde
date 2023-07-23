class Piece {
  Quaternion rot;
  float side;

  public Piece(float an, PVector ax, float s) {
    side = s;
    rot = new Quaternion(radians(an), ax);
  }

  void rotatePiece(float angle, int axis) {
    float rad = radians(angle);
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
  
  boolean checkPiece(Piece p) {
      return p.rot.equal(rot);
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

  public Corner(float an, PVector ax, float s, color[] c) {
    super(an, ax, s);
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

  public Edge(float an, PVector ax, float s, color[] c) {
    super(an, ax, s);
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

  public Center(float an, PVector ax, float s, color c) {
    super(an, ax, s);
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
