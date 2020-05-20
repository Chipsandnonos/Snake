class apple
{
  int x = width/2;
  int y = width/2 ;
  
  void rand()
  {
    x = int(random(18))*50;
    y = int(random(18))*50;
    
     for (int i = 0; i <length; i++)
     {
       if(body.get(i).xPos == x && body.get(i).yPos == y)
       {
         rand(); //<>//
       }
     }
     
  }
}
