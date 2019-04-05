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
   int boardWidth = 3;
   float padding = 5.0;
   int left;
   int right;
   int down;
   int up;
   float boardEdgeLength = pieceWidth * boardWidth;
   int[] properOrder;


 
   Board() {
       //For now the size of the board and number of pieces is hardcoded. Make dynamic later.
       board = new Piece[boardWidth][boardWidth];
       properOrder = new int[(int) sq(boardWidth) - 1];
       int counter = 1;
       for(int i = 0; i < boardWidth; i++) {
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
        }
       }
       
   }
   
   void display() {
     for(int i = 0; i < boardWidth; i++) {
        for(int j = 0; j < boardWidth; j++) {
          board[j][i].display(); //display each of the tiles
        }
      }

   }
   
  void scramble() {
    for(int s = 0; s < 2; s++) {
      int xi, yi;
      int[][]  pos= {{-1,0},{1,0},{0,1},{0,-1}};

      int[] choice = pos[int(random(4))];


      for(int i = 0; i < boardWidth; i++) {
        for(int j = 0; j < boardWidth; j++) {
          if(board[j][i].value.equals("0")) {
              xi = i + choice[1];
              yi = j + choice[0];
              if(inbound(xi,yi)) {
                 board[yi][xi].moveTile(i,j);
                 board[j][i].moveTile(xi,yi);
                 switchTiles(i,j,xi,yi);
              }

          }
          board[j][i].display(); //display each of the tiles
        }
      }
    }

  }
      
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
             switchTiles(x,y,xi,yi);

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
   Piece temp = board[targety][targetx];
   board[targety][targetx] = board[blanky][blankx];
   board[blanky][blankx] = temp;

 }
   
   //Win
   //The game is over and the player has won when the tiles are
   //all in sequential order. This win condition is checked after every
   //move. It loops over the entire board one by one, using the same nested
   //loop as the constructor, and if it does not see the tiles in proper order
   //then it fails. All the win condition does is stop inputs, for now.
   
   Boolean WinTest() {
     int counter = 1;
     for(int i = 0; i < boardWidth; i++) { //<>//
        for(int j = 0; j < boardWidth; j++) {
          println(board[j][i].value);
          //if (board[i][j].value != str(counter)) {
          //  return false;
          //}
        }
      }

     return true;
   }
   
}
