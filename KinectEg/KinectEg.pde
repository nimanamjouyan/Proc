import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;

Kinect kinect;
ArrayList <SkeletonData> bodies;
SkeletonData _myS;
Ball ball;
Ball ball2;
Ball ball3;
Ball ball4;
//PVector location;  // Location of shape
//PVector velocity;  // Velocity of shape
//PVector gravity;   // Gravity acts at the shape's acceleration


void setup()
{
  size(640, 480);
  kinect = new Kinect(this);
  //smooth(8);
  bodies = new ArrayList<SkeletonData>();
  imageMode(CENTER);
  ball = new Ball();
  ball2 = new Ball();
  ball3 = new Ball();
  ball4 = new Ball();
  //rectMode(CENTER);
  
  //location = new PVector(100,100);
  //velocity = new PVector(1.5,2.1);
  //gravity = new PVector(0,0.2);
}

void draw()
{
  background(255);
  ball.run();
  ball2.run();
  ball3.run();
  ball4.run();
  //image(kinect.GetImage(),width/2, height/2);
  //image(kinect.GetDepth(), width/2, height/2);
  image(kinect.GetMask(), width/2, height/2);
  tint(100);
  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(bodies.get(i));
    drawPosition(bodies.get(i));
    
  //     if ((abs(location.x - bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width) <= 24) && (abs(location.y - bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height) <= 24)) {
  //  velocity.x = -velocity.x;
  //  velocity.y = 0.95*velocity.y;
  //}
  
  // if ((abs(location.x - bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].x*width) <= 24) && (abs(location.y - bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_LEFT].y*height) <= 24)) {
  //  velocity.x = -velocity.x;
  //  velocity.y = 0.95*velocity.y;
  //}
  }
}


//void BBall() {
  
//  // Add velocity to the location.
//  location.add(velocity);
//  // Add gravity to velocity
//  //velocity.add(gravity);
//  //for (int i=0; i<bodies.size (); i++){ 
//  // Bounce off edges
 
//  if ((location.x > width) || (location.x < 0)) {
//    velocity.x = -velocity.x;
//  }

//  if ((location.y > height) || (location.y < 0)) {
//    // We're reducing velocity ever so slightly 
//    // when it hits the bottom of the window
//    velocity.y = -0.95*velocity.y; 
//    //location.y = height;
//  }
  
//  // if ((abs(location.x - bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width) <= 24) && (abs(location.y - bodies.get(i).skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height) <= 24)) {
//  //  velocity.x = -velocity.x;
//  //  velocity.y = -velocity.y;
//  //}
//   //Display circle at location vector
//  stroke(255);
//  strokeWeight(2);
//  fill(127);
//  ellipse(location.x,location.y,48,48);
//  //}
  
//}



void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width, _s.position.y*height);
  //println(_s.position.x*width/2);
  //rect(_s.position.x*width/2, _s.position.y*height/2, 20, 20);
  //rect(_s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].x*width, _s.skeletonPositions[Kinect.NUI_SKELETON_POSITION_HAND_RIGHT].y*height, 20, 20);
  
}

void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);

  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);

  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);

  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);

  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}

void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    line(_s.skeletonPositions[_j1].x*width, 
    _s.skeletonPositions[_j1].y*height, 
    _s.skeletonPositions[_j2].x*width, 
    _s.skeletonPositions[_j2].y*height);
  }
}

void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    bodies.add(_s);
  }
}

void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}

void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}

class Ball {
  
  private PVector pos;
  private PVector vel;
  private PVector accl;
  
  private float expiration;
  private float rad;
  
   Ball(){
    rad = 8;
    accl = new PVector(0, 0.05);
    vel = new PVector(random(-1, 1), random(-2, 0));
    pos = new PVector(random(0, width), rad + 5);
    expiration = 500;
    
  }
    void run() {
    update();
    display();
    hit();
  }

  // Method to update position
  void update() {
    vel.add(accl);
    pos.add(vel);
    expiration -= 1.0;
  }

  // Method to display
  void display() {
    stroke(0, expiration);
    fill(0, expiration);
    ellipse(pos.x, pos.y, rad, rad);
  }
  
  //Hit detection method
  void hit(){
  if (pos.x > width-rad || pos.x < rad) {
      vel.x *= -0.8;
    }
  if (pos.y > height-rad || pos.y < rad) {
    vel.y *= -0.8;
  }    
  }
}
