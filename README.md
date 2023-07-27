list of issues / goals:

1) cube degrades over time due to floating point rounding (rotations rotate the cube slightly more than they should)

   a) Attempted to solve by rounding each quaternion value to its nearest "standard" value after each turn like so:
   ``` Java
   // class Piece
   void correctPiece() {
    float[] values = rot.get();

    for(int i = 0; i < values.length; i++) {
      if(values[i] <= -0.9) {
        values[i] = -1;
      } else if(values[i] > -0.75 && values[i] <= -0.65) {
        values[i] = -0.70710677;
      } else if(values[i] > -0.55 && values[i] <= -0.45) {
        values[i] = -0.5;  
      } else if(values[i] > -0.01 && values[i] < 0.01) {
        values[i] = 0;
      } else if (values[i] > 0.45 && values[i] <= 0.55) {
        values[i] = 0.5;
      } else if(values[i] > 0.65 && values[i] <= 0.75) {
       values[i] = 0.70710677;
      } else if(values[i] > 0.9) {
        values[i] = 1;
      }
    }

    rot.set(values);
   }
   ```
   But is causing issues with displaying pieces, I'm assuming based on the getAngles function in the Quaternion class.

   b) kinda cheap but, we could subtract a small amount from the last rotation to make it turn slightly less, like so:
``` Java
   int direction = 4000;
// further down

   void rotateCube() {
     c.rotateCube(rSpeed * direction, axis, side);
     if(count >= 45) {
       count = 1;
       rSpeed = 5;
       rotating = false;
     } else if(count == 44) {
       count++;
       rSpeed *= .95;
       rSpeed -= .056;
     } else {
       count++;
       rSpeed *= .95;
     }
```

However, the degredation was a blessing in disguise, as it got us out or gimbal lock(?) by being slightly off of the axes overlapping. changing the .056 to .03 is the best in-between solution i could find. 
   
3) any rotations done at the beginning can be undone to show issues (first rotation of 360 degrees can be reversed with four 'r' inputs to show problems)
   note: (6) could solve this problem <-- being looked into

5) impliment movement of sides only <-- this one's all you Justin

6) add 'x' and 'y' moves

DONE 6) impliment and execute a generated scramble

DONE 7) add prime moves

DONE 8) (maybe) add 2 moves (e.g. R2) that can only be performed by the program, not the user (to scramble and (9)solve)

DONE 9) (maybe) create a bot to undo the scramble

DONE 11) (maybe) spin camera around the cube while it is being scrambled / solved by the bot

12) (maybe) loop (8) to create a cool background for my computer :D
