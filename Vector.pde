class Vector {
  float x = 0;
  float y = 0;
  
  // Constructors
  Vector() {}
  Vector(float x_, float y_) {x = x_; y = y_;}
  Vector(Vector obj) {x = obj.x; y = obj.y;}
  
  // Functions
  float getMagnitude() {return mag(x, y);}
  // float getAngle()
}
