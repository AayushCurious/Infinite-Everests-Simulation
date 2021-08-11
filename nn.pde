int cs,re;
int mat=20;
int w=2000;
int h=1600;

float kl=0;
float[][] everest;

void setup(){
  size(600,600,P3D);
  cs=w/mat;
  re=h/mat;
  everest=new float[cs][re];
}

void draw(){
  kl-=0.1;
  float yoff=kl;
  for(int y=0;y<re;y++){
    float xoff=0;
    for(int x=0;x<cs;x++){
      everest[x][y]=map(noise(xoff,yoff),0,1,884.8086,0);
      xoff+=0.2;
    }  
    yoff+=0.2;
  }
  background(0);
  stroke(255);
  noFill();
  translate(width/2,height/2+50);
  rotateX(PI/3);
  translate(-w/2,-h/2);
  for(int y=0;y<re-1;y++){
    beginShape(TRIANGLE_STRIP);
    for(int x=0;x<cs;x++){
      vertex(x*mat,y*mat,everest[x][y]); 
      vertex(x*mat,(y+1)*mat,everest[x][y+1]);
    }
  
  }
}
