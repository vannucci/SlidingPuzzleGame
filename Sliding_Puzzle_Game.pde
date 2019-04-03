//Comment driven development
//Goal: Making a Sliding puzzle, https://en.m.wikipedia.org/wiki/Sliding_puzzle
//Parts: Larger assemblage of puzzle pieces, individual pieces
Board mainBoard;
PFont f;

void setup() {
  f = createFont("Arial",16,true);
  size(600,600);
  mainBoard = new Board();
  noLoop();
  
}

void draw() {
   mainBoard.display();
   

}

//onMousePress()
//when a mouse button is pressed on a tile,
//the board is called with the location of the click (or the tile)
//The board checks if there is a blank space near the clicked tile
//If there is, the clicked tile and the blank space switch places
//Later on, implement a sliding animation

//onKeyPress()
//a second interface option is the keyboard.
//the user clicks the number of the tile they want to move, and
//on this press, the tile attempts to slide

void keyPressed() {
   if(key >= '1' && key <= '9') {
     mainBoard.slideTile(mainBoard.findPieceByKey(key));
     redraw();
   }
}
