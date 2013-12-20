//Nik Hager


#include <MeggyJrSimple.h>            //Required code, line 1 of 2


struct Point                          //Code for making points
{
  int x;
  int y;
};
int counter = 0;                      //Set variable for turn counter
int score = 0;                        //Set variable to keep track of score
int ballthrow = 0;                    //Set variable to check if player is throwing a ball
Point player = {1,4};                 //Set player starting point
int playerhp = 3;                     //Set variable for player health
Point opponent1 = {6,4};              //Set starting point for opponent 1
int hp1 = 3;                          //Set variable for opponent 1 health
Point opponent2 = {6,3};              //Set starting point for opponent 2
int hp2 = 3;                          //Set variable for opponent 2 health
Point opponent3 = {6,5};              //Set starting point for opponent 3
int hp3 = 3;                          //Set variable for opponent 3 health
Point opponent4 = {6,2};              //Set starting point for opponent 4
int hp4 = 3;                          //Set variable for opponent 4 health
Point playerball = {1,4};             //Unused coordinates, but point is needed to keep track of the player's ball
int opponent1on = 0;                  //Variable to check if opponent 1 is in the stage
int opponent2on = 0;                  //Variable to check if opponent 2 is in the stage
int opponent3on = 0;                  //Variable to check if opponent 3 is in the stage
int opponent4on = 0;                  //Variable to check if opponent 4 is in the stage
int bosson = 0;                       //Variable to check if a boss is in the stage
int movement = 1;                     //Variable to check which direction the CPU is moving (0 = up, 1 = down, 2 = left, 3 = right)
int stage = 1;                        //Variable to check what level the player is on



void setup()                          //Setup
{
  MeggyJrSimpleSetup();               //Required code, line 2 of 2
  EditColor(DimRed, 17, 4, 2);        //Change DimRed to pink
  EditColor(Green, 0, 27, 0);         //Adjust green color
  EditColor(Blue, 4, 37, 21);         //Adjust blue color
  EditColor(White, 0, 13, 1);         //Adjust white color
  EditColor(Orange, 13, 26, 0);       //Adjust orange color
  EditColor(Red, 21, 0 , 0);          //Adjust red color
  DrawCourt();                        //Draw the court
  DisplaySlate();                     //Display player starting spot and field
}






void loop()                           //Start loop
{
  if (counter == 0)
  {
    delay(300);
  }
  if (stage == 1)  
  {
    opponent1on = 1;
  }
  counter++;
  if (playerball.x > 7)
  {
    ballthrow = 0;
  }
  if (ballthrow == 0)                
  {
    playerball.x = player.x;
    playerball.y = player.y;
  }
  DrawCourt();
  if (counter%5 == 0)
  {
    if (opponent1on == 1)
    {
      if (movement == 0)
      {
        movement = random(10);
        if (opponent1.y > 5)
        {
          opponent1.y--;
        }
        if (opponent1.y < 6)
        {
          opponent1.y++;
        }
      }
      if (movement == 1)
      {
        movement = random(10);
        if (opponent1.y > 2)
        {
          opponent1.y--;
        }
        if (opponent1.y < 3)
        {
          opponent1.y++;
        }
      }
      if (movement == 2)
      {
        movement = random(10);
        opponent1.x--;
      }
      if (movement == 3)
      {
        opponent1.x++;
        movement = random(10);
      }
      if (movement > 3)
      {
        movement = random(2);
      }
      if (opponent1.x > 7)
      {
        movement = random(10);
        opponent1.x = 6;
      }
      if (opponent1.x < 4)
      {
        movement = random(10);
        opponent1.x = 5;
      }
      if (opponent1.y > 7)
      {
        movement = random(10);
        opponent1.y = 6;
      }
      if (opponent1.y < 0)
      {
        movement = random(10);
        opponent1.y = 1;
      }
    }
  }
  if (opponent1.x == playerball.x)
  {
    if (opponent1.y == playerball.y)
    {
      hp1--;
      ballthrow = 0;
    }
  }
  if (hp1 == 0)
  {
    opponent1on = 0;
  }
  CheckButtonsDown();
  {
    if (Button_Up)
    {
      player.y++;
    }
    if (Button_Down)
    {
      player.y--;
    }
    if (Button_Left)
    {
      player.x--;
    }
    if (Button_Right)
    {
      player.x++;
    }
    if (Button_A)
    {
      ballthrow = 1;
    }
  }
  if (ballthrow == 1)
  {
    DrawPlayerBall();
  }
  if (player.x > 3)
  {
    player.x = 3;
  }
  if (player.x < 0)
  {
    player.x = 0;
  }
  if (player.y > 7)
  {
    player.y = 7;
  }
  if (player.y < 0)
  {
    player.y = 0;
  }
  if (opponent1on == 1)
  {
    DrawPx(opponent1.x, opponent1.y, Green);
  }
  DrawPlayer();
  DisplaySlate();
  delay(100);
  ClearSlate();
  EndStage();
}

void DrawPlayer()
{
  DrawPx(player.x, player.y, Red);
}

void DrawPlayerBall()
{
  playerball.x++;
  DrawPx(playerball.x, playerball.y, DimRed);

}

void DrawCourt()
{
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
}

void EndStage()
{
  if (opponent1on == 0)
  {
    if (opponent2on == 0)
    {
      if (opponent3on == 0)
      {
        if (opponent4on == 0)
        {
          if (bosson == 0)
          {
            counter = 0;
            stage++;
          }
        }
      }
    }
  }
}

void DrawBoss()
{
  DrawPx(7,4,Dark);
  DrawPx(7,3,Dark);
}
