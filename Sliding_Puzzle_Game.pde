//Comment driven development
//Goal: Making a Sliding puzzle, https://en.m.wikipedia.org/wiki/Sliding_puzzle
//Parts: Larger assemblage of puzzle pieces, individual pieces
Board mainBoard;
PFont f;

void setup() {
  f = createFont("Arial",16,true);
  size(400,400);
  mainBoard = new Board();
  
}

void draw() {
   background(0);
   mainBoard.display();
   
}

void mousePressed() {
  int mouseXPos = floor(mouseX/mainBoard.pieceWidth);
  int mouseYPos = floor(mouseY/mainBoard.pieceWidth);
  mainBoard.slideTile(mouseXPos, mouseYPos);
  println(mouseXPos,mouseYPos);
  //mainBoard.board[mouseYPos][mouseXPos].moveTile(0,0);
}
