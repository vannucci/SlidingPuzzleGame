//Comment driven development
//Goal: Making a Sliding puzzle, https://en.m.wikipedia.org/wiki/Sliding_puzzle
//Parts: Larger assemblage of puzzle pieces, individual pieces
Board mainBoard;
PFont f;
Boolean gameon;

void setup() {
  f = createFont("Arial",16,true);
  size(400,400);
  mainBoard = new Board();
  //mainBoard.scramble();
  gameon = true;
}


void draw() {
   background(0);
   mainBoard.display();
   frameRate(10);
   mainBoard.WinTest();
   //if(mainBoard.WinTest()) {
   // gameon = false;
   // fill(255);
   // rect(0,100,400,300);
   // textFont(f, 16);
   // textAlign(CENTER,CENTER);
   // fill(0);
   // text("Game Over" , 200,200);

   // noLoop();
   //}
   
}

void mousePressed() {
  if(gameon) {
    int mouseXPos = floor(mouseX/mainBoard.pieceWidth);
    int mouseYPos = floor(mouseY/mainBoard.pieceWidth);
    mainBoard.slideTile(mouseXPos, mouseYPos);
  }

}
