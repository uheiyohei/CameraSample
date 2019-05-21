final float FIELD_WIDTH = 1000;
final float FIELD_HEIGHT = 1000;

float[][] circles;
Camera camera;

void setup() {
  size(600, 400);
  
  circles = new float[100][3];
  
  for(int i = 0; i < circles.length; i++) {
    float d = random(10, 30);
    float[] circleInfo = {random(0, FIELD_WIDTH), random(0, FIELD_HEIGHT), d};
    circles[i] = circleInfo;
  }
  
  camera = new Camera();
}

void draw() {
  background(0);
  
  for(int i = 0; i < circles.length; i++) {
    float[] position = getCirclePosition(circles[i][0], circles[i][1]);
    circle(position[0], position[1], circles[i][2]);
  }
}

float[] getCirclePosition(float circleX, float circleY) {
  float[] position = {circleX - camera.x + width / 2, circleY - camera.y + height / 2};
  return position;
}

void keyPressed() {
  camera.move(keyCode);
}

class Camera {
  float x;
  float y;
  float moveSpeed;
  
  Camera() {
    this.x = width / 2;
    this.y = height / 2;
    this.moveSpeed = 10;
  }
  
  void move(int direction) {
    switch(direction) {
      case RIGHT:
        if (x < FIELD_WIDTH) {
          x += moveSpeed;
        }
        break;
      case LEFT:
        if (x > 0) {
          x -= moveSpeed;
        }
        break;
      case DOWN:
        if (y < FIELD_HEIGHT) {
          y += moveSpeed;
        }
        break;
      case UP:
        if (y > 0) {
          y -= moveSpeed;
        }
        break;
      default:
        println("Illegal keyCode.");
        break;
    }
    
  }
}
