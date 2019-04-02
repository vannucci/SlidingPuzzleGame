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
   float pieceEdge = 100.0;
   int numberOfPieces = 11;
   int boardWidth = 3;
   int boardHeight = 4;

 
   Board() { //<>//
       //For now the size of the board and number of pieces is hardcoded. Make dynamic later.
       board = new Piece[boardWidth][boardHeight];
       
       int counter = 1;
       for(int i = 0; i < boardWidth; i++) {
        for(int j = 0; j < boardHeight; j++) {
          if(counter != numberOfPieces) {
            board[i][j] = new Piece( str(counter), pieceEdge, (float) pieceEdge * i, (float) pieceEdge * j);
          } else {
            board[i][j] = new Piece( " ", pieceEdge, (float) pieceEdge * i, (float) pieceEdge * j);
          }
          counter++;
        }
       }
       
   }
   
   void display() {
     fill(0);
     stroke(255);
     rect(0,0,(float) pieceEdge*boardWidth + 5,(float) pieceEdge*boardHeight + 5); //<>//
     println(pieceEdge*boardWidth + " " + pieceEdge*boardHeight);
     for(int i = 0; i < boardWidth; i++) {
        for(int j = 0; j < boardHeight; j++) {
          board[i][j].display(255);
        }
      }

   }
   
}
