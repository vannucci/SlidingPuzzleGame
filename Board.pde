//The larger assemblage contains all the pieces, can move them one at a time by clicking, and can mix them up

class Board {
 //2D array called grid of n x n size
 //Initialize nxn-1 pieces in the grid
 //Accept a size value for width and height of board (later)
 //Accept a value of the number of pieces in the board (later)
 //A function to move a single piece to the only available spot
 //A function to shuffle the pieces
 //A success function when all the pieces are in the proper order
 
 //Base size of pieces off of the total size of the board
   Piece[][] board;
   float pieceWidth = 100.0;
   int numberOfPieces = 9;
   int boardWidth = 3;
   float padding = 5.0;
   int left;
   int right;
   int down;
   int up;


 
   Board() { //<>//
       //For now the size of the board and number of pieces is hardcoded. Make dynamic later.
       board = new Piece[boardWidth][boardWidth];
       
       int counter = 1;
       for(int j = 0; j < boardWidth; j++) {
        for(int i = 0; i < boardWidth; i++) {
          if(counter != numberOfPieces) {
            board[i][j] = new Piece(
              counter, 
              (float) pieceWidth - padding, //width and height of each piece
              (float) pieceWidth * i + (pieceWidth/2.0), //x location, start from zero, go i times width over, then add in half width to center
              (float) pieceWidth * j + (pieceWidth/2.0), ////y location, start from zero, go i times width down, then add in half width to center
              i,
              j
            );
          } else {
            board[i][j] = new Piece(
              0, //blank space to represent empty spot
              (float) pieceWidth - padding, //width and height of each piece
              (float) pieceWidth * i + (pieceWidth/2.0), //x location, start from zero, go i times width over, then add in half width to center
              (float) pieceWidth * j + (pieceWidth/2.0), ////y location, start from zero, go i times width down, then add in half width to center
              i,
              j
            );
          }
          counter++;
        }
       }
       
   }
   
   Piece findPieceByKey(char code) {
    for(int j = 0; j < boardWidth; j++) {
      for(int i = 0; i < boardWidth; i++) {
          if(board[i][j].value == code) {
           return board[i][j]; 
          }
      }
    }
    
    return null; //this could cause me some problems, just watch #foreshadowing
  
   }
   
   void display() {
     background(255);
     fill(0); //black background with white tiles
     rect(0,0,(float) pieceWidth * boardWidth,(float) pieceWidth * boardWidth); //top left corner is at 0,0, then bottom right is at tile edge length times tiles
     for(int j = 0; j < boardWidth; j++) {
        for(int i = 0; i < boardWidth; i++) {
          board[i][j].display(255); //display each of the tiles
        }
      }

   }
   
   //Scramble
   //When the game is started, the board is scrambled
   //This involves picking a random tile and calling 'slide'
   //if it fails, then the failure is ignored and another is called
   //This is repeated a set number of times
   //Is there a better way to scramble the board?
   
   //MousePickTile
   //This function handles the input from the user and passes to slide tile
   //the tile the user wants to slide. It either interprets the mouse position
   //as a tile, or it casts and passes the user's keyboard input to Slide Tile
   
   
   //SlideTile
   //This function will be passed a (location? tile?), and will check
   //if one of the adjacent tiles is empty
   //if one is, then the target tile and the empty tile switch places
   //with an animation
   //if not, do nothing
   //Notes: I don't like the way this thing looks, as of right now, this should be a first target for refactor
   void slideTile(Piece target) {
     Piece temp;
     println(target.i);
     println(target.j);
     if(target.i - 1 < 0)            { left = target.i; } else { left = target.i - 1; }
     if(target.i + 1 >= boardWidth)   { right = target.i; } else { right = target.i + 1; }
     if(target.j - 1 < 0)            { down = target.j; } else { down = target.j - 1; }
     if(target.j + 1 >= boardWidth)   { up = target.j; } else { up = target.j + 1; }
     if(board[left][target.j].value == '0') {
      switchTiles("left") 
     } else if(board[target.i][down].value == '0') {
      switchTiles("down");
     } else if(board[right][target.j].value == '0') {
       switchTiles("right");
     } else if(board[target.i][up].value == '0') {
       switchTiles("up");
     }
     //if( 
     //    board[left][target.j].value == '0' || //look left
     //    board[target.i][down].value == '0' || //look down
     //    board[right][target.j].value == '0' || //look right
     //    board[target.i][up].value == '0'    //look up
     //    ) {
     //      //switch the two pieces
     //   temp = board[target.i-1][target.j];
     //   board[target.i-1][target.j] = board[target.i][target.j];
     //   board[target.i][target.j] = temp;
     // }

 }
 
 void switchTiles(String direction) {
  switch(direction) {
    case "up":
    
      break;
    case "down":
    
      break;
    case "right":
    
      break;
    case "left":
    
      break;
    default:
      //Do nothing
      break;
 }
   
   //Win
   //The game is over and the player has won when the tiles are
   //all in sequential order. This win condition is checked after every
   //move. It loops over the entire board one by one, using the same nested
   //loop as the constructor, and if it does not see the tiles in proper order
   //then it fails. All the win condition does is stop inputs, for now.
   
   Boolean WinTest() {
     int counter = 1;
     for(int j = 0; j < boardWidth; j++) {
        for(int i = 0; i < boardWidth; i++) {
          if (board[i][j].value != (char) counter) {
            return false;
          }
        }
      }

     return true;
   }
   
}
