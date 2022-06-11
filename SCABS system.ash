// SCABS system by Sean Molloy

//access the SCABS value in characters.
import function SCABS(this Character*, int num = -1);

//will return true after some amount of seconds
import bool delay(this Character*, float seconds);

//is a character at these coordinates specifically?
import bool isAt(this Character*, int x, int y);

//find a character in a rectangle
import bool InRect(this Character*, int nwX, int nwY, int seX, int seY);

//character walk to and changeSCAB value
import function SCABSwalk(this Character* int x, int y, int scabVal)

