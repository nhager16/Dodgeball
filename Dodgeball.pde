//Nik Hager


#include <MeggyJrSimple.h>            //Required code, line 1 of 2

void setup()                          //Setup
{
  MeggyJrSimpleSetup();               //Required code, line 2 of 2
  EditColor(DimRed, 17, 4, 2);        //Change DimRed to pink
  EditColor(Green, 0, 27, 0);         //Adjust green color
  EditColor(Blue, 4, 37, 21);         //Adjust blue color
  EditColor(White, 0, 13, 1);         //Adjust white color
  EditColor(Orange, 13, 26, 0);       //Adjust orange color
  EditColor(Red, 21, 0 , 0);          //Adjust red color
  for(int i = 0; i < 4; i++)          //Color player side white
  {
    for(int j = 0; j < 8; j++)
    {
      DrawPx(i,j,White);
    }
  }
  for(int k = 4; k < 8; k++)          //Color opponent side blue
  {
    for (int l = 0; l < 8; l++)
    {
      DrawPx(k,l,Blue);
    }
  }
  int x = 0;                          //Set x coordinate for starting point of player
  int y = 4;                          //Set y coordinate for starting point of player
  int g = 7;                          //Set x coordinate for starting poing of CPU
  int h = 0;                          //Set y coordinate for starting poing of CPU
  DrawPx(x,y,Red);                    //Draw a red dot on starting point
  DrawPx(g,h,Green);                  //Draw CPU starting point
  DisplaySlate();                     //Display player starting spot and field
}

int x = 0;                            //Set variable for x coordinate of player
int y = 4;                            //Set variable for y coordinate of player
int g = 7;                            //Set variable for x coordinate of CPU
int h = 0;                            //Set variable for y coordinate of CPU








void loop()                           //Start loop
{
  DrawPx(g, h, Green);
  CheckButtonsDown();                //Check which buttons are down
  {
    if (Button_Up)                    //If the up button is pressed...
    {
      y++;                            //Move player dot up 1
      for(int i = 0; i < 4; i++)      //Color player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
    }
    if (Button_Down)                  //If the down button is pressed...
    {
      y--;                            //Move player dot down 1
      for(int i = 0; i < 4; i++)      //Color player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
    }
    if (Button_Right)                 //If the right button is pressed...
    {
      x++;                            //Move player dot right 1
      for(int i = 0; i < 4; i++)      //Color player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
    }
    if (Button_Left)                  //If the left button is pressed...
    {
      x--;                            //Move player dot left 1
      for(int i = 0; i < 4; i++)      //Color player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
    }
    if (x > 3)                        //If the player tries to go over the line...
      x = 3;                          //Stop movement
    if (x < 0)                        //If the player tries to go out of bounds to the left...
      x = 0;                          //Stop movement
    if (y > 7)                        //If the player tries to go out of bounds to the top...
      y = 7;                          //Stop movement
    if (y < 0)                        //If the player tries to go out of bounds to the bottom...
      y = 0;                          //Stop movement
    DrawPx(x,y,Red);                  //Drawing new player dot based on the x and y coordinates
    DisplaySlate();                   //Display the new screen
    
    
    
    
    
    
    
    
    
    
    
    
    if (Button_A)                     //If the A button is pressed...
    {
      
      
    }
    if (Button_B)                     //If the B button is pressed...
    {
      int a = x;                      //Set variable for ball x coordinate when throwing
      int b = y;                      //Set variable for ball y coordinate when throwing
      DrawPx(a+1,b,8);              //Draw the ball moving
      DisplaySlate();               //Display current spot of the ball
      delay(80);                    //Wait a little before moving the ball again
      for(int i = 0; i < 4; i++)    //Recolor player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)    //Recolor opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+2,b,8);              //Draw new spot of the ball
      DrawPx(x,y,Red);              //Redraw player
      DrawPx(g,h,Green);            //Redraw CPU
      DisplaySlate();               //Display new ball spot
      delay(80);                    //Wait a little before moving the ball again
      for(int i = 0; i < 4; i++)    //Recolor player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)     //Recolor opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+3,b,8);               //Draw new spot of the ball
      DrawPx(x,y,Red);               //Redraw player
      DrawPx(g,h,Green);            //Redraw CPU
      DisplaySlate();                //Display new ball spot
      delay(80);                     //Wait a little before moving the ball again
      for(int i = 0; i < 4; i++)     //Recolor player side white
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Recolor opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+4,b,8);                //Draw new spot of the ball
      DrawPx(x,y,Red);                //Redraw player
      DrawPx(g,h,Green);            //Redraw CPU
      DisplaySlate();                 //Display new ball spot
      delay(80);                      //Wait a little before moving the ball again
      for(int i = 0; i < 4; i++)      //Color player side white again
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue again
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+5,b,8);                //Draw new spot of ball
      DrawPx(x,y,Red);                //Draw player again
      DrawPx(g,h,Green);            //Redraw CPU
      DisplaySlate();                 //Show new ball spot
      delay(80);                      //Wait a little before moving the ball again
      for(int i = 0; i < 4; i++)      //Color player side white again
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue again
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+6,b,8);                //Draw new spot of ball
      DrawPx(x,y,Red);                //Redraw player dot
      DrawPx(g,h,Green);            //Redraw CPU
      DisplaySlate();                 //Show the new ball spot
      delay(80);                      //Wait a little before drawing ball again
      for(int i = 0; i < 4; i++)      //Color player side white again
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue again
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+7,b,8);                //Draw new ball spot
      DrawPx(x,y,Red);                //Draw player again
      DrawPx(g,h,Green);            //Redraw CPU
      DisplaySlate();                 //Show new ball spot
      delay(80);                      //Wait a little before moving ball again
      for(int i = 0; i < 4; i++)      //Color player side white again
      {
        for(int j = 0; j < 8; j++)
        {
          DrawPx(i,j,White);
        }
      }
      for(int k = 4; k < 8; k++)      //Color opponent side blue
      {
        for (int l = 0; l < 8; l++)
        {
          DrawPx(k,l,Blue);
        }
      }
      DrawPx(a+8,b,8);                //Move ball off of screen
      DrawPx(x,y,Red);                //Redraw player dot
      DrawPx(g,h,Green);              //Redraw CPU
      DisplaySlate();                 //Display screen
    }
  }
  for(int g = 0; g < 8; g++)          //Move opponent up and down
  {
    for(int h = 0; h < 8; h++)
    {
      if(ReadPx(g,h)==Green)
      {
        DrawPx(g, h, Blue);
        DrawPx(g, h+1, Green);
        DisplaySlate();
      }
    }
  }
  delay(100);
}
