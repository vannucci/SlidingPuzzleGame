//Comment driven development
//Goal: Making a Sliding puzzle, https://en.m.wikipedia.org/wiki/Sliding_puzzle
//Parts: Larger assemblage of puzzle pieces, individual pieces
Board mainBoard;
PFont f;

void setup() {
  f = createFont("Arial",16,true);
  size(600,600);
  mainBoard = new Board();
  mainBoard.display();
  
}

void draw() {
 
}
