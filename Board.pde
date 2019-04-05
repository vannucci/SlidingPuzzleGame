//The larger assemblage contains all the pieces, can move them one at a time by clicking, and can mix them up

class Board { 
   Piece[][] board;
   float pieceWidth = 100.0;
   int boardWidth = 3;
   float padding = 5.0;
   int left;
   int right;
   int down;
   int up;
   float boardEdgeLength = pieceWidth * boardWidth;
   int[] properOrder = {1,2,3,4,5,6,7,8,0};



 
   Board() {
       board = new Piece[boardWidth][boardWidth];
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
          board[j][i].display(); 
        }
      }

   }
   
  void scramble() {
    for(int s = 0; s < 100; s++) {
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
          board[j][i].display(); 
        }
      }
    }

  }
      
  void slideTile(int x, int y) {
       int pos[][] = {{-1,0},{1,0},{0,1},{0,-1}};
       int xi, yi;
       for (int[] i: pos) {
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
 
 void switchTiles(int targetx, int targety, int blankx, int blanky) {
   Piece temp = board[targety][targetx];
   board[targety][targetx] = board[blanky][blankx];
   board[blanky][blankx] = temp;

 }
   
   //Win   
   Boolean WinTest() {
    int counter = 0;
    for(int i = 0; i < boardWidth; i++) {
      for(int j = 0; j < boardWidth; j++) {
        if(!board[j][i].value.equals(str(properOrder[counter]))) {
          return false;
        }
        counter++;
      }
    } //<>//
    return true;
   }
   
}
