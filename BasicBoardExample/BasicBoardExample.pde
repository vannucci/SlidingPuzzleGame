float x,y;
float w = 70;
BoardPiece[][] board = new BoardPiece[8][8];

//Resource
//https://www.youtube.com/watch?v=nsLTQj-l_18

void setup(){
  size(800,600);
  int fill = 0;
  x = 0;
  y = 0;
  //This is a critical piece I didn't get
  //Make sure that you're incrementing the board positions correctly
  //Remember the inner row should increment the j values
  //and when that is done looping, then you must reset and increment the y values
  //This will ensure you're drawing the squares in the right place
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
      board[i][j] = new BoardPiece(fill,x,y,w);  //<>//
      fill+=3;
      x += w;
    }
    y += w;
    x = 0;
  }
}

void draw() {  
  for(int i = 0; i < 8; i++) {
    for(int j = 0; j < 8; j++) {
        board[i][j].display();        
    }    
  }

}

void mousePressed() {
  //calculate the position of the clicks in the array
  int posx = floor(mouseX/w);
  int posy = floor(mouseY/w);
  println(posx, posy);
  board[posy][posx].changeColor();
}

class BoardPiece {
  int fillColor;
  float x,y,w;
  
  BoardPiece(int fill, float xi, float yi, float wi) {
   fillColor = fill;
   x = xi;
   y = yi;
   w = wi;
   
 }
 
 void display() {
  fill(fillColor);
  rect(x,y,w,w);
 }
 void changeColor() {
   if(fillColor + 5 > 255) {
     fillColor = 0;
   } else {
     fillColor+=5;
   }
 }
}
