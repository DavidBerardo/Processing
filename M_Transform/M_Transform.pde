ArrayList<float[]> pts = new ArrayList<float[]>();

void setup(){
 size(800,600); 
 colorMode(HSB);
 
 pts.add(new float[]{0.1*width,0.1*height});

 
 //for(int i =0; i<300; i++){
 //pts.add(new float[]{random(width),random(height)});
 //}
 //background(0);
}

boolean change = false;
float c = 200;
void draw(){
  if(!change){background(0);}
  
  draw_pts(c);
  
  if(change){
    transform();
  }
}

void draw_pts(float c){
  stroke(c,255,255);
  
  for(int i = 0; i<pts.size()-1;i++){
    line(pts.get(i)[0],pts.get(i)[1],pts.get(i+1)[0],pts.get(i+1)[1]);
  }
  
}

void transform(){
 ArrayList<float[]> new_pts = new ArrayList<float[]>();
 
 new_pts.add(pts.get(0));
 
 for(int i = 0; i<pts.size()-1;i++){
   float new_x = (pts.get(i)[0]+pts.get(i+1)[0])/2.0;
   float new_y = (pts.get(i)[1]+pts.get(i+1)[1])/2.0;
 
   new_pts.add(new float[]{new_x,new_y});
  }
  
  new_pts.add(pts.get(pts.size()-1));
  pts = new_pts;
  c *=0.99;
}

void mousePressed(){
 pts.add(new float[]{mouseX,mouseY}); 
}

void keyPressed(){
 change = true; 
}