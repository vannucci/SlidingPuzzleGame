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
   int xpos, ypos;
   int boardWidth = 3;
   float padding = 5.0;
   int left;
   int right;
   int down;
   int up;
   float boardEdgeLength = pieceWidth * boardWidth;


 
   Board() {
       //For now the size of the board and number of pieces is hardcoded. Make dynamic later.
       board = new Piece[boardWidth][boardWidth];
       xpos = 0;
       ypos = 0;
       int counter = 1;
       for(int i = 0; i < boardWidth; i++) { //<>//
        for(int j = 0; j < boardWidth; j++) {
          if(counter != sq(boardWidth)) {
            board[j][i] = new Piece(
              str(counter), 
              pieceWidth,
              j,
              i,
              255
            );
          } else {
            board[j][i] = new Piece(
              "0", 
              pieceWidth,
              j,
              i,
              0
            );
          }
          counter++;
          xpos += 1;
        }
        xpos = 0;
        ypos += 1;
       }
       
   }
   
   void display() {
     for(int i = 0; i < boardWidth; i++) {
        for(int j = 0; j < boardWidth; j++) {
          board[j][i].display(); //display each of the tiles
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
  void slideTile(int x, int y) {
       int pos[][] = {{-1,0},{1,0},{0,1},{0,-1}};
       int xi, yi;
       for (int[] i: pos) {
         //test the tiles around the target tile, adding in all possible directions to the target
         xi = x + i[1];
         yi = y + i[0];
        if(inbound(xi,yi)) {          
           if(board[yi][xi].value.equals("0") && board[y][x].value != "0") {
             board[yi][xi].moveTile(x,y);
             board[y][x].moveTile(xi,yi);
           }
         }
       }
  
   }
 
 Boolean inbound(int x, int y) {
   if(x >= 0 && x < boardWidth && y >= 0 && y < boardWidth) {
     return true;
   }
   return false;
 }
 
 //The actual switching of the tiles is contained here, so as to not bloat the slide tile function
 void switchTiles(int targetx, int targety, int blankx, int blanky) {

   //println(board[targety][targetx].value);
   //println(board[blanky][blankx].value);
   //String temp = board[targety][targetx].value;
   //board[targety][targetx].setVal(board[blanky][blankx].value);
   //board[blanky][blankx].setVal(temp);

 }
   
   //Win
   //The game is over and the player has won when the tiles are
   //all in sequential order. This win condition is checked after every
   //move. It loops over the entire board one by one, using the same nested
   //loop as the constructor, and if it does not see the tiles in proper order
   //then it fails. All the win condition does is stop inputs, for now.
   
   Boolean WinTest() {
     int counter = 1;
     for(int i = 0; i < boardWidth; i++) {
        for(int j = 0; j < boardWidth; j++) {
          if (board[j][i].value != str(counter)) {
            return false;
          }
        }
      }

     return true;
   }
   
}
