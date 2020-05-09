class SimplePendulum {
  Vector pivot;
  float length;
  float radius;
  float mass;
  float gravity;
  Vector pos;
  Vector vel;
  Vector acc;
  boolean click;
  
  // Constructors
  SimplePendulum(float pivotX, float pivotY, float length_, float radius_, float mass_, float gravity_) {
    pivot = new Vector(pivotX, pivotY);
    length = length_;
    radius = radius_;
    mass = mass_;
    gravity = gravity_;
    pos = new Vector(pivot.x, pivot.y + length);
    vel = new Vector();
    acc = new Vector();
    click = false;
  }
  
  // Pendulum movement due to gravity
  void fall() {
    
  }
  
  // Move pendulum on mouse click
  void drag() {
    float mouseToPivot = dist(pivot.x, pivot.y, mouseX, mouseY); // Distance from pivot to mouse
    float mouseAngle; // Angle of mouse to vertical
    
    // Calculate mouse angle
    if (mouseY > pivot.y) {
      mouseAngle = asin((mouseX - pivot.x) / mouseToPivot);
    } else {
      mouseAngle = acos((mouseY - pivot.y) / mouseToPivot);
      
      if (mouseX < pivot.x)
        mouseAngle *= -1;
    }
    
    // Update position to line up with mouse angle
    pos.x = length * sin(mouseAngle) + pivot.x;
    pos.y = length * cos(mouseAngle) + pivot.y;
  }
  
  // Display pendulum
  void displayArm() {
    float endx = pos.x - (radius * sin(getAngle()));
    float endy = pos.y - (radius * cos(getAngle()));
    
    strokeCap(ROUND);
    point(pivot.x, pivot.y);
    strokeCap(SQUARE);
    line(pivot.x, pivot.y, endx, endy);
  }
  
  void displayBody() {
    ellipseMode(RADIUS);
    ellipse(pos.x, pos.y, radius, radius);
  }
  
  // Change cursor
  void updateCursor() {
    if (dist(mouseX, mouseY, pos.x, pos.y) <= radius)
    cursor(HAND);
  else
    cursor(ARROW);
  }
  
  // Calculations
  float getAngle() {
    float angle;
    
    if (pos.y > pivot.y) {
      angle = asin((pos.x - pivot.x) / length);
    } else {
      angle = acos((pos.y - pivot.y) / length);
      
      if (pos.x < pivot.x)
        angle *= -1;
    }
    return angle;
  }
}
