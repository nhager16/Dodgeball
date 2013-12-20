//Nik Hager


#include <MeggyJrSimple.h>                                                                              //Required code, line 1 of 2


struct Point                                                                                          //Code for making points
{
  int x;
  int y;
};
int counter = 0;                                                                                    //Set variable for turn counter
int score = 0;                                                                                      //Set variable to keep track of score
int ballthrow = 0;                                                                                  //Set variable to check if player is throwing a ball
Point player = {1,4};                                                                             //Set player starting point
int playerhp = 3;                                                                                   //Set variable for player health
Point opponent1 = {8,4};                                                                            //Set starting point for opponent 1
int hp1 = 3;                                                                                          //Set variable for opponent 1 health
Point opponent2 = {8,3};                                                                          //Set starting point for opponent 2
int hp2 = 3;                                                                                        //Set variable for opponent 2 health
Point opponent3 = {8,5};                                                                          //Set starting point for opponent 3
int hp3 = 3;                                                                                      //Set variable for opponent 3 health
Point opponent4 = {8,2};                                                                            //Set starting point for opponent 4
int hp4 = 3;                                                                                        //Set variable for opponent 4 health
Point playerball = {1,4};                                                                         //Unused coordinates, but point is needed to keep track of the player's ball
int opponent1on = 0;                                                                              //Variable to check if opponent 1 is in the stage
int opponent2on = 0;                                                                                //Variable to check if opponent 2 is in the stage
int opponent3on = 0;                                                                                //Variable to check if opponent 3 is in the stage
int opponent4on = 0;                                                                                //Variable to check if opponent 4 is in the stage
int bosson = 0;                                                                                     //Variable to check if a boss is in the stage
int movement = 1;                                                                                 //Variable to check which direction the CPU is moving (0 = up, 1 = down, 2 = left, 3 = right)
int stage = 1;                                                                                    //Variable to check what level the player is on



void setup()                                                                                      //Setup
{
  MeggyJrSimpleSetup();                                                                           //Required code, line 2 of 2
  EditColor(DimRed, 17, 4, 2);                                                                    //Change DimRed to pink
  EditColor(Green, 0, 27, 0);                                                                       //Adjust green color
  EditColor(Blue, 4, 37, 21);                                                                   //Adjust blue color
  EditColor(White, 0, 13, 1);                                                                   //Adjust white color
  EditColor(Orange, 13, 26, 0);                                                                 //Adjust orange color
  EditColor(Red, 21, 0 , 0);                                                                    //Adjust red color
  DrawCourt();                                                                                  //Draw the court
  DisplaySlate();                                                                               //Display player starting spot and field
}






void loop()                                                                                     //Start loop
{
  
  
  if (stage == 1)                                                                               //If it's stage 1...
  {
    if (counter == 0)                                                                           //If the timer is 0
    {
      opponent1on = 1;                                                                        //there is one opponent on the stage
      hp1 = 3;                                                                                    //Set the enemy's hp to 3
      opponent1.x = 7;                                                                        //Set opponent x coord to 7
    }
  }
  
  
  if (stage == 2)                                                                                     //If it's stage 2...
  {
    if (counter == 0)                                                                         //if the timer is 0
    {
      opponent1.x = 7;                                                                          //reset opponent 1's coords
      opponent1.y = 4;
      opponent2.x = 7;                                                                          //put opponent 2 onto the screen
      opponent1on = 1;                                                                          //there are two opponents on the stage
      opponent2on = 1;                  
      DrawPx(opponent1.x,opponent1.y,Green);                                                    //Draw opponent 1
      DrawPx(opponent2.x,opponent2.y,Green);                                                      //Draw opponent 2
      DisplaySlate();                                                                            //Display the slate
      delay(2000);                                                                              //Wait a little
      hp1 = 3;                                                                                    //reset the enemies' hp
      hp2 = 3;
    }
    if (opponent1on == 0)
    {
      opponent1.x = 8;
    }
    if (opponent2on == 0)
    {
      opponent2.x = 8;
    }
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
  
  
  if (counter%7 == 0)
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
  
  if (counter%7 == 0)
  {
    if (opponent2on == 1)
    {
      if (movement == 0)
      {
        movement = random(10);
        if (opponent2.y > 5)
        {
          opponent2.y--;
        }
        if (opponent2.y < 6)
        {
          opponent2.y++;
        }
      }
      if (movement == 1)
      {
        movement = random(10);
        if (opponent2.y > 2)
        {
          opponent2.y--;
        }
        if (opponent2.y < 3)
        {
          opponent2.y++;
        }
      }
      if (movement == 2)
      {
        movement = random(10);
        opponent2.x--;
      }
      if (movement == 3)
      {
        opponent2.x++;
        movement = random(10);
      }
      if (movement > 3)
      {
        movement = random(2);
      }
      if (opponent2.x > 7)
      {
        movement = random(10);
        opponent2.x = 6;
      }
      if (opponent2.x < 4)
      {
        movement = random(10);
        opponent2.x = 5;
      }
      if (opponent2.y > 7)
      {
        movement = random(10);
        opponent2.y = 6;
      }
      if (opponent2.y < 0)
      {
        movement = random(10);
        opponent2.y = 1;
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
  
  if (opponent2.x == playerball.x)
  {
    if (opponent2.y == playerball.y)
    {
      hp2--;
      ballthrow = 0;
    }
  }
  if (hp2 == 0)
  {
    opponent2on = 0;
  }
  if (hp3 == 0)
  {
    opponent3on = 0;
  }
  if (hp4 == 0)
  {
    opponent4on = 0;
  }
  
  if (hp1 < 0)
  {
    hp1 = 0;
  }
  if (hp2 < 0)
  {
    hp2 = 0;
  }
  if (hp3 < 0)
  {
    hp3 = 0;
  }
  if (hp4 < 0)
  {
    hp4 = 0;
  }
  
  CheckButtonsDown();                                                          //Check which buttons are down
  {
    if (Button_Up)                                                               //If the up button is down...
    {
      player.y++;                                                                //Make the player move up
    }
    if (Button_Down)                                                            //If the down button is down...
    {
      player.y--;                                                                //Make the player move down
    }
    if (Button_Left)                                                              //If the left button is down...
    {
      player.x--;                                                                  //Make the player move left
    }
    if (Button_Right)                                                              //If the right button is down...
    {
      player.x++;                                                                  //Make the player move right
    }
    if (Button_A)                                                                //If the A button is down
    {
      ballthrow = 1;                                                              //Make the player throw the ball
    }
  }  
  if (ballthrow == 1)                                                            //If the ball is being thrown
  {
    DrawPlayerBall();                                                            //Draw the ball
  }
  if (player.x > 3)                                                                //Don't allow the player to go over the court dividing line
  {
    player.x = 3;
  }
  if (player.x < 0)                                                            //Don't allow the player to go off the left of the screen
  {
    player.x = 0;  
  }
  if (player.y > 7)                                                              //Don't allow the player to go off the top of the screen
  {
    player.y = 7;
  }
  if (player.y < 0)                                                              //Don't allow the player to go off the bottom of the screen
  {
    player.y = 0;
  }
  if (opponent1on == 1)                                                          //If opponent 1 is on the screen...
  {
    DrawPx(opponent1.x, opponent1.y, Green);                                      //Draw opponent 1
  }
  if (opponent2on == 1)                                                          //If opponent 2 is on the screen...
  {
    DrawPx(opponent2.x, opponent2.y, Green);                                      //Draw opponent 2
  }
  DrawPlayer();                                                                  //Draw the player
  DisplaySlate();                                                                //Display the slate
  delay(100);                                                                    //Wait a little
  ClearSlate();                                                                  //Clear the slate
  EndStage();                                                                   //Check if the stage is finished
}

void DrawPlayer()                                                              //Drawing the player
{
  DrawPx(player.x, player.y, Red);                                              //Draw the player based on new coords
}

void DrawPlayerBall()                                                          //Drawing the ball
{  
  playerball.x++;                                                              //Increase x coord by 1 (to make ball move horizontally across screen)
  DrawPx(playerball.x, playerball.y, DimRed);                                  //Draw the new spot of the ball

}

void DrawCourt()                                                                //Drawing the court
{
  for(int i = 0; i < 4; i++)                                                    //Color player side white
  {
    for(int j = 0; j < 8; j++)
    {
      DrawPx(i,j,White);
    }
  }
  for(int k = 4; k < 8; k++)                                                          //Color opponent side blue
  {
    for (int l = 0; l < 8; l++)
    {
      DrawPx(k,l,Blue);
    }
  }
}
  
void EndStage()                                                                //When a stage is completed...
{
  if (opponent1on == 0)                                                        //If all of the opponents are dead...
  {
    if (opponent2on == 0)
    {
      if (opponent3on == 0)
      {
        if (opponent4on == 0)
        {
          if (bosson == 0)
          {
            counter = 0;                                                      //Reset the counter
            stage++;                                                          //Go to the next stage
            player.x = 0;                                                     //Reset Player coords
            player.y = 4;
            DrawCourt();                                                      //Draw the Court
            DrawPx(player.x,player.y,Red);                                    //Draw the Player
            DisplaySlate();                                                    //Display the slate
            delay(2000);                                                      //Freeze screen for a bit
          }
        }
      }
    }
  }
}

void DrawBoss()                                                              //Draw the Boss
{
  DrawPx(7,4,Dark);
  DrawPx(7,3,Dark);
}
