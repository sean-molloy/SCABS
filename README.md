# SCABS
Switch Case for Action / Behaviour Scripting.

SCABS is a system for scripting non-player behavior in AGS inspired by the way the Sierra Creative Interpreter does this.

First, character's have a custom property (int) SCABS which is initialised as zero.

They also have a custom property (int) delayClicker also initialised at Zero.

The SCABS function is a character extender function which returns the character's SCABS value, but can also be used to increment or change this number. (Character.SCABS(1) will increment, Character(50) sets SCABS to 50, Character.SCABS() will just return the SCABS value.)

There's another (character) custom extender function which creates a delay without using a timer, using another custom property 'delayClicker' to count game cycles without having to set a timer. It returns true when it reaches the amount of seconds you call the function with.

Also there's Character.SCABwalk, which just moves the character to a destination and changes the SCAB value when they get there. Default value is 1, or increment, but can be set to change to any block in the switch case.

eg Character.delay(2.5) will return true after 2.5 seconds.

## USAGE:


In a room script make a function which will be called from room_RepExec() with a switch case like this:
```
function moveChar(Character* theChar) //can be used for multiple characters
{
  switch(theChar.SCABS())
  {
    case 0: //will initially listen to conditions in this block
      if(theChar.Room == player.Room) when the character enters this room
      {
        theChar.SCABS(1); increments SCABS value, and listens to next block
      }
    break;
    case 1:
      //this block listens for two conditions,
      //if the character hasn't reached the destination, and they're not
      //moving, give character instructions to go there.
      //if the character has reached the destination, increment SCABS
      theChar.SCABwalk(10, 10);
    break;
    case 2:
      if(theChar.delay(4.0)) //after 4 seconds, run this block
      {
        theChar.SCABS(1);
      }
    break;
    case 3:
      theChar.SCABwalk(10, 20);
    break;
    case 4:
    //this block branches to two different cases, for example
    //if you're using SCABS for a stealth puzzle, checking if the npc
    //can 'see' the player.
    //you can check basically any conditions you want in these.
      if(player.x < theChar.x)//checks if player is to the left of theChar
      {
        theChar.SCABS(20);
      } else {
        theChar.SCABS(40);
      }
    break;
  }
}

```
