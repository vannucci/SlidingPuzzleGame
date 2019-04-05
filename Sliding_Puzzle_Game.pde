//Comment driven development
//Goal: Making a Sliding puzzle, https://en.m.wikipedia.org/wiki/Sliding_puzzle
Board mainBoard;
PFont f;
Boolean gameon;

void setup() {
  f = createFont("Arial",16,true);
  size(400,400);
  mainBoard = new Board();
  mainBoard.scramble();
  gameon = true;
}


void draw() {
   background(0);
   mainBoard.display();
   frameRate(10);
   if(mainBoard.WinTest()) {
    gameon = false;
    background(255);
    textFont(f, 16);
    textAlign(CENTER,CENTER);
    fill(0);
    text("Game Over" , 200,200);

    noLoop();
   }
   
}

void mousePressed() {
  if(gameon) {
    int mouseXPos = floor(mouseX/mainBoard.pieceWidth);
    int mouseYPos = floor(mouseY/mainBoard.pieceWidth);
    mainBoard.slideTile(mouseXPos, mouseYPos);
  }


}
