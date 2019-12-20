Particle[] xd;
void setup()
{
  size(600,600);
  xd = new Particle[3000];
  for(int i = 0; i < xd.length; i++)
  {
    xd[i] = new NormalParticle();
  }
  xd[0] = new OddballParticle();
  xd[1] = new JumboParticle();
}
void draw()
{
  background(255);
  for(int i =0 ; i < xd.length; i++)
  {
    xd[i].show();
    xd[i].move();
  }
}
class NormalParticle implements Particle
{
  double myX,myY,mySpeed,myAngle;
  NormalParticle()
  {
    myX = 300;
    myY = 300;
    mySpeed = (Math.random()*10)+5;
    myAngle = Math.PI*2*Math.random();
  }
  void show()
  {
    fill(0);
    rect((float)myX,(float)myY,5,5);
  }
  void move()
  {
    myX = myX + Math.cos(myAngle) * mySpeed;
    myY = myY + Math.sin(myAngle) * mySpeed;
    if(myX >= 600 || myX <= 0 || myY >= 600 || myY <= 0) {
      myY = 300;
      myX = 300;
      mySpeed = (Math.random()*10)+5;
    }
  }

}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  int myX, myY;
  void show()
  {
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    rect(myX,myY,50,50);
  }
  void move()
  {
    myX = 100;
    myY = 100;
    myX = myX + (int)(Math.random()*5);
    myY = myY + (int)(Math.random()*5);
  
  }
}
class JumboParticle extends NormalParticle
{
  void show()
  {
    fill(0);
    ellipse((float)myX,(float)myY,100,100);
  }
}