String[][] board;
int length = 3;

void setup() {
  size(100,100);
  board = new String[length][length];
  for(int i = 0; i < length; i++) {
    for(int j = 0; j < length; j++) {
      if(i == 0 && j == 0) {
        board[i][j] = new String("entry i: "+i+", j: "+j)+" HERE";
      } else {
        board[i][j] = new String("entry i: "+i+", j: "+j);   
      }
    }
  }
  noLoop();
}

void draw() {
 for(int i = 0; i < length; i++) {
   printArray(board[i]);
 }
 println("==============");

}

void mouseClicked() {
 String temp = board[1][1];
 board[1][1] = board[0][0];
 board[0][0] = temp;
 redraw();
}
