SimplePendulum pendulum;

void setup() {
  size(900, 900);
  pendulum = new SimplePendulum(width/2, height/2, 300, 70, 5, 9.8);
}

void draw() {
  background(255); //<>// //<>//
  
  if (pendulum.click) {
    pendulum.drag();
  } else {
    pendulum.fall();
  }
  
  pendulum.updateCursor();
  
  strokeWeight(30);
  pendulum.displayArm();
  
  strokeWeight(4);
  fill(0, 50, 200, 100);
  pendulum.displayBody();
  // println(pendulum.pos.x + ", " + pendulum.pos.y + " | " + pendulum.getAngle() + " rad");
}

void mousePressed() {
  if (dist(mouseX, mouseY, pendulum.pos.x, pendulum.pos.y) <= pendulum.radius)
    pendulum.click = true;
}

void mouseReleased() {
  pendulum.click = false;
}
