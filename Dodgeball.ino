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
Point player = {0,4};                                                                             //Set player starting point
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
int movement1 = 1;                                                                                 //Variable to check which direction CPU 1 is moving (0 = up, 1 = down, 2 = left, 3 = right)
int movement2 = 1;                                                                                 //Variable to check which direction CPU 2 is moving (0 = up, 1 = down, 2 = left, 3 = right)
int movement3 = 1;                                                                                 //Variable to check which direction CPU 3 is moving (0 = up, 1 = down, 2 = left, 3 = right)
int movement4 = 1;                                                                                 //Variable to check which direction CPU 4 is moving (0 = up, 1 = down, 2 = left, 3 = right)
int stage = 1;                                                                                    //Variable to check what level the player is on
int ball1on = 0;                                                                                  //Variable to check if opponent 1's ball is being thrown
Point ball1 = {9,4};
int ball2on = 0;                                                                                  //Variable to check if opponent 2's ball is being thrown
Point ball2 = {9,3};
int ball3on = 0;                                                                                  //Variable to check if opponent 3's ball is being thrown
Point ball3 = {9,5};
int ball4on = 0;                                                                                  //Variable to check if opponent 4's ball is being thrown
Point ball4 = {9,2};



void setup()                                                                                      //Setup
{
  MeggyJrSimpleSetup();                                                                           //Required code, line 2 of 2
  EditColor(DimRed, 17, 4, 2);                                                                    //Change DimRed to pink
  EditColor(Green, 0, 27, 0);                                                                     //Adjust green color
  EditColor(Blue, 4, 37, 21);                                                                     //Adjust blue color
  EditColor(White, 0, 13, 1);                                                                     //Adjust white color
  EditColor(Orange, 13, 26, 0);                                                                   //Adjust orange color
  EditColor(Red, 21, 0 , 0);                                                                      //Adjust red color
  DrawCourt();                                                                                    //Draw the court
  DisplaySlate();                                                                                 //Display player starting spot and field
}



void loop()                                                                                     //Start loop
{
  
  
  if (stage == 1)                                                                               //If it's stage 1...       (one CPU, slow movement, no balls, low HP)
  {
    SetAuxLEDs(1);                                                                              //Turn on 1 LED light
    if (counter == 0)                                                                           //If the timer is 0
    {
      opponent1on = 1;                                                                        //there is one opponent on the stage
      hp1 = 2;                                                                                    //Set opponent 1's hp to 2
      opponent1.x = 7;                                                                        //Set opponent x coord to 7
      DrawPlayer();                                                                          //Draw Player
      DrawPx(opponent1.x,opponent1.y,Green);                                                  //Draw opponent 1
      Draw1();                                                                                //Draw a 1 in the center of the screen to show it's stage 1
      DisplaySlate();                                                                         //Display the screen
      delay(2000);
    }
    if (counter%13 == 0)
    {
      CheckOpponentsOn();
    }
  }
  
  
  if (stage == 2)                                                                               //If it's stage 2...       (one CPU, fast movement, balls, low HP)
  {
    SetAuxLEDs(3);                                                                             //Turn on 2 LED lights
    if (counter == 0)                                                                           //If the timer is 0
    {
      opponent1.x = 7;                                                                          //reset opponent 1's coords
      opponent1.y = 4;
      opponent1on = 1;                                                                        //there is one opponent on the stage
      hp1 = 2;                                                                                 //Set opponent 1's hp to 3
      DrawPlayer();                                                                            //Draw Player
      DrawPx(opponent1.x,opponent1.y,Green);                                                  //Draw opponent 1
      Draw2();                                                                                //Draw a 2 in the center of the screen to show it's stage 2
      DisplaySlate();
      delay(2000);
    }
    if (counter%8 == 0)
    {
      CheckOpponentsOn();
    }
  }
  
  
  if (stage == 3)                                                                               //If it's stage 3...       (one CPU, fast movement, balls, medium HP)
  {
    SetAuxLEDs(7);                                                                              //Turn on 3 LED lights
    if (counter == 0)                                                                           //If the timer is 0
    {
      opponent1.x = 7;                                                                          //reset opponent 1's coords
      opponent1.y = 4;
      opponent1on = 1;                                                                        //there is one opponent on the stage
      hp1 = 3;                                                                                 //Set opponent 1's hp to 3
      DrawPlayer();                                                                            //Draw Player
      DrawPx(opponent1.x,opponent1.y,Green);                                                  //Draw opponent 1
      Draw3();                                                                                //Draw a 3 in the center of the screen to show it's stage 3
      DisplaySlate();
      delay(2000);
    }
    if (counter%8 == 0)
    {
      CheckOpponentsOn();
    }
  }
  
  
  if (stage == 4)                                                                            //If it's stage 4...            (two CPUs, fast movement, balls, medium HP)
  {
    SetAuxLEDs(15);                                                                              //Turn on 4 LED lights
    if (counter == 0)                                                                         //if the timer is 0
    {
      opponent1.x = 7;                                                                          //reset opponent 1's coords
      opponent1.y = 4;
      opponent2.x = 7;                                                                          //put opponent 2 onto the screen
      opponent1on = 1;                                                                          //there are two opponents on the stage
      opponent2on = 1;                  
      hp1 = 3;                                                                                    //reset the enemies' hp to 3
      hp2 = 3;
      DrawPlayer();                                                                              //Draw Player
      DrawPx(opponent1.x,opponent1.y,Green);                                                    //Draw opponent 1
      DrawPx(opponent2.x,opponent2.y,Green);                                                      //Draw opponent 2
      ///Draw4();                                                                                //Draw a 4 in the center of the screen to show it's stage 3
      DisplaySlate();                                                                            //Display the slate
      delay(2000);                                                                              //Wait a little
    }
    if (counter%8 == 0)
    {
      CheckOpponentsOn();
    }
  }
  
  
  if (stage == 5)                                                                              //If it's stage 5...          (three CPUs, fast movement, balls, medium HP)
  {
    SetAuxLEDs(31);                                                                            //Turn on 5 LED lights
    if (counter == 0)                                                                         //if the timer is 0
    {
      opponent1.x = 7;                                                                          //reset opponent 1's coords
      opponent1.y = 4;
      opponent2.x = 7;                                                                          //reset opponent 2's coords
      opponent2.y = 3;
      opponent1on = 1;                                                                          //there are two opponents on the stage
      opponent2on = 1;                  
      DrawPx(opponent1.x,opponent1.y,Green);                                                    //Draw opponent 1
      DrawPx(opponent2.x,opponent2.y,Green);                                                      //Draw opponent 2
      DisplaySlate();                                                                            //Display the slate
      delay(1500);                                                                              //Wait a little
      hp1 = 3;                                                                                    //reset the enemies' hp
      hp2 = 3;
    }
    if (counter%8 == 0)
    {
      CheckOpponentsOn();
    }
  }
  
  
                              //stage 6 (four CPUs, fast movement, balls, medium HP)
                              
                              
                              //stage 7 (four CPUs, fast movement, balls, high HP)
                              
                              
                              //stage 8 (boss)
  
  
  counter++;                                                                                   //add 1 to the counter
  
  if (playerball.x > 7)                                                                        //when the player's ball is off the screen, the ball is no longer moving
  {
    ballthrow = 0;
  }
  if (ballthrow == 0)                                                                          //if the ball isn't moving, reset its coordinates to the player's
  {
    playerball.x = player.x;
    playerball.y = player.y;
  }
  
  
  if (opponent1on == 0)                                                                      //if opponent 1 is not on, take him off the screen
  {
    opponent1.x = 8;
  }
  if (opponent2on == 0)                                                                      //if opponent 2 is not on, take him off the screen
  {
    opponent2.x = 8;
  }
  if (opponent3on == 0)                                                                      //if opponent 3 is not on, take him off the screen
  {
    opponent3.x = 8;
  }
  if (opponent4on == 0)                                                                      //if opponent 4 is not on, take him off the screen
  {
    opponent4.x = 8;
  }
  
  DrawCourt();
  
  
  ///CheckOpponentsOn();
  
   
  
  if (opponent1.x == opponent2.x)                                                            //if two opponents are standing in the same spot change their coords
  {
    if (opponent1.y == opponent2.y)
    {
      opponent1.x--;
      opponent1.y--;
    }
  }
  
  if (opponent1.x == playerball.x)                                                          //if opponent 1 is hit by the ball, decrease its hp by 1 and take the ball off the screen
  {
    if (opponent1.y == playerball.y)
    {
      hp1--;
      ballthrow = 0;
    }
  }
  if (hp1 == 0)                                                                            //if opponent 1's hp is 0, take him out of the game
  {
    opponent1on = 0;
  }
  
  if (opponent2.x == playerball.x)                                                        //if opponent 2 is hit by the ball, decrease its hp by 1 and take the ball off the screen
  {
    if (opponent2.y == playerball.y)
    {
      hp2--;
      ballthrow = 0;
    }
  }
  if (hp2 == 0)                                                                             //if opponent 2's hp is 0, take him out of the game
  {
    opponent2on = 0;
  }
  
                                        //code for opponent 3 collision with ball
  
  if (hp3 == 0)                                                                             //if opponent 3's hp is 0, take him out of the game
  {
    opponent3on = 0;
  }
  
                                        //code for opponent 4 collision with ball
  
  if (hp4 == 0)                                                                             //if opponent 4's hp is 0, take him out of the game
  {
    opponent4on = 0;
  }
  
  if (hp1 < 0)                                                                            //don't let the hps go below 0 so they dont come back on unexpectedly or become invincible
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
    if (Button_A)                                                                //If the A button is pressed
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

void ball1throw()                                                                  //Drawing ball 1
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
            delay(500);
            DrawCourt();                                                      //Draw the Court
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

void CheckOpponentsOn()
{
  if (counter%1 == 0)                                                      //used to be 7, but i changed to make game flow better and to allow speed alterations
  {
    if (opponent1on == 1)                                                  //if opponent 1 is on..
    {
      if (movement1 == 0)                                                   //if he's moving up...
      {
        movement1 = random(10);                                              //move in a random direction
        if (opponent1.y > 5)                                              //if opponent 1's y coord is above 5...
        {
          opponent1.y--;                                                  //decrease y coord by 1
        }
        if (opponent1.y < 6)                                              //if y coord is below 6...
        {
          opponent1.y++;                                                  //increase y coord by 1
        }
      }
      if (movement1 == 1)                                                    //if he's moving down...
      {
        movement1 = random(10);                                              //move in a random direction
        if (opponent1.y > 2)                                              //if its y coord is above 2...
        {
          opponent1.y--;                                                   //move down 1
        }
        if (opponent1.y < 3)                                              //if its y coord is below 3...
        {
          opponent1.y++;                                                  //increase y coord by 1
        }
      }
      if (movement1 == 2)                                                 //if its moving left...
      {
        movement1 = random(10);                                          //move in a random direction
        opponent1.x--;                                                    //decrease x coord by 1
      }
      if (movement1 == 3)                                                  //if its moving right...
      {
        movement1 = random(10);                                            //move in a random direction
        opponent1.x++;                                                    //increase x coord by 1
      }
      if (movement1 > 3)                                                   //if movement1 variable > 3...  (since i say random 10 and there are only 4 direction choices)
      {
        movement1 = random(2);          //set the movement1 to either up or down   (this way there is a higher chance for the cpu to move up or down since there are more spaces vertically than horizontally)
      }
      
      
      if (opponent1.x > 7)                                                //if opponent 1 goes off the right of the screen...
      {
        movement1 = random(10);                                            //move him in a random direction
        opponent1.x = 6;                                                  //put him back on the screen
      }
      if (opponent1.x < 4)                                                //if opponent 1 goes over the central dividing line...
      {
        movement1 = random(10);                                            //move him in a random direction
        opponent1.x = 5;                                                  //put him back on his side
      }
      if (opponent1.y > 7)                                                //if opponent 1 goes off the top of the screen...
      {
        movement1 = random(10);                                            //move him in a random direction
        opponent1.y = 6;                                                  //put him back on the screen
      }
      if (opponent1.y < 0)                                                //if opponent 1 goes off the bottom of the screen...
      {
        movement1 = random(10);                                            //move him in a random direction
        opponent1.y = 1;                                                  //put him back on the screen
      }
    }
  }
  
  
  
  
  if (counter%1 == 0)                                                    //Same as above, but for opponent 2
  {
    if (opponent2on == 1)                                                
    {
      if (movement2 == 0)
      {
        movement2 = random(10);
        if (opponent2.y > 5)
        {
          opponent2.y--;
        }
        if (opponent2.y < 6)
        {
          opponent2.y++;
        }
      }
      if (movement2 == 1)
      {
        movement2 = random(10);
        if (opponent2.y > 2)
        {
          opponent2.y--;
        }
        if (opponent2.y < 3)
        {
          opponent2.y++;
        }
      }
      if (movement2 == 2)
      {
        movement2 = random(10);
        opponent2.x--;
      }
      if (movement2 == 3)
      {
        opponent2.x++;
        movement2 = random(10);
      }
      if (movement2 > 3)
      {
        movement2 = random(2);
      }
      if (opponent2.x > 7)
      {
        movement2 = random(10);
        opponent2.x = 6;
      }
      if (opponent2.x < 4)
      {
        movement2 = random(10);
        opponent2.x = 5;
      }
      if (opponent2.y > 7)
      {
        movement2 = random(10);
        opponent2.y = 6;
      }
      if (opponent2.y < 0)
      {
        movement2 = random(10);
        opponent2.y = 1;
      }
    }
  }
  
  
  if (counter%1 == 0)                                                    //Same as above, but for opponent 3
  {
    if (opponent3on == 1)                                                
    {
      if (movement3 == 0)
      {
        movement3 = random(10);
        if (opponent3.y > 5)
        {
          opponent3.y--;
        }
        if (opponent3.y < 6)
        {
          opponent3.y++;
        }
      }
      if (movement3 == 1)
      {
        movement3 = random(10);
        if (opponent3.y > 2)
        {
          opponent3.y--;
        }
        if (opponent3.y < 3)
        {
          opponent3.y++;
        }
      }
      if (movement3 == 2)
      {
        movement3 = random(10);
        opponent3.x--;
      }
      if (movement3 == 3)
      {
        opponent3.x++;
        movement3 = random(10);
      }
      if (movement3 > 3)
      {
        movement3 = random(2);
      }
      if (opponent3.x > 7)
      {
        movement3 = random(10);
        opponent3.x = 6;
      }
      if (opponent3.x < 4)
      {
        movement3 = random(10);
        opponent3.x = 5;
      }
      if (opponent3.y > 7)
      {
        movement3 = random(10);
        opponent3.y = 6;
      }
      if (opponent3.y < 0)
      {
        movement3 = random(10);
        opponent3.y = 1;
      }
    }
  }
  
  
  if (counter%1 == 0)                                                    //Same as above, but for opponent 4
  {
    if (opponent4on == 1)                                                
    {
      if (movement4 == 0)
      {
        movement4 = random(10);
        if (opponent4.y > 5)
        {
          opponent4.y--;
        }
        if (opponent4.y < 6)
        {
          opponent4.y++;
        }
      }
      if (movement4 == 1)
      {
        movement4 = random(10);
        if (opponent4.y > 2)
        {
          opponent4.y--;
        }
        if (opponent4.y < 3)
        {
          opponent4.y++;
        }
      }
      if (movement4 == 2)
      {
        movement4 = random(10);
        opponent4.x--;
      }
      if (movement4 == 3)
      {
        opponent4.x++;
        movement4 = random(10);
      }
      if (movement4 > 3)
      {
        movement4 = random(2);
      }
      if (opponent4.x > 7)
      {
        movement4 = random(10);
        opponent4.x = 6;
      }
      if (opponent4.x < 4)
      {
        movement4 = random(10);
        opponent4.x = 5;
      }
      if (opponent4.y > 7)
      {
        movement4 = random(10);
        opponent4.y = 6;
      }
      if (opponent4.y < 0)
      {
        movement4 = random(10);
        opponent4.y = 1;
      }
    }
  }
}


void Draw1()
{
  DrawPx(2,1,Dark);
  DrawPx(3,1,Dark);
  DrawPx(4,1,Dark);
  DrawPx(5,1,Dark);
  DrawPx(6,1,Dark);
  DrawPx(4,2,Dark);
  DrawPx(4,3,Dark);
  DrawPx(4,4,Dark);
  DrawPx(4,5,Dark);
  DrawPx(4,6,Dark);
  DrawPx(3,5,Dark);
  DrawPx(2,4,Dark);
}
  
void Draw2()
{
  DrawPx(1,1,Dark);
  DrawPx(2,1,Dark);
  DrawPx(3,1,Dark);
  DrawPx(4,1,Dark);
  DrawPx(5,1,Dark);
  DrawPx(6,1,Dark);
  DrawPx(1,2,Dark);
  DrawPx(1,3,Dark);
  DrawPx(1,4,Dark);
  DrawPx(2,4,Dark);
  DrawPx(3,4,Dark);
  DrawPx(4,4,Dark);
  DrawPx(5,4,Dark);
  DrawPx(6,4,Dark);
  DrawPx(6,5,Dark);
  DrawPx(6,6,Dark);
  DrawPx(5,6,Dark);
  DrawPx(4,6,Dark);
  DrawPx(3,6,Dark);
  DrawPx(2,6,Dark);
  DrawPx(1,6,Dark);
}

void Draw3()
{
  DrawPx(1,1,Dark);
  DrawPx(2,1,Dark);
  DrawPx(3,1,Dark);
  DrawPx(4,1,Dark);
  DrawPx(5,1,Dark);
  DrawPx(6,1,Dark);
  DrawPx(6,2,Dark);
  DrawPx(6,3,Dark);
  DrawPx(6,4,Dark);
  DrawPx(5,4,Dark);
  DrawPx(4,4,Dark);
  DrawPx(3,4,Dark);
  DrawPx(6,5,Dark);
  DrawPx(6,6,Dark);
  DrawPx(5,6,Dark);
  DrawPx(4,6,Dark);
  DrawPx(3,6,Dark);
  DrawPx(2,6,Dark);
  DrawPx(1,6,Dark);
}

////void Draw4()

////void Draw5()

////void Draw6()

////void Draw7()

////void Draw8()
