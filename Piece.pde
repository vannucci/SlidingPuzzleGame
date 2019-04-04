class Piece {
 //Pieces just know their number, and their size
 //An integer of the piece's value
  String value;
  float size;
  float padding = 5.0;
  float x,y;
  int i,j;
  int REDIX=10;
  int strokeColor = 255;
  int fillColor;
  float pieceWidth;
  
  Piece(String val, float pW, int jpos, int ipos, int filCol) {
    value = val;
    pieceWidth = pW;
    size = pW - padding;
    i = ipos;
    j = jpos;
    fillColor = filCol;
    x = i * pieceWidth + (pieceWidth / 2.0);
    y = j * pieceWidth + (pieceWidth / 2.0);

  }
  
  //Moving tiles is still a problem; I don't understand why they kee getting set to zero...
  void moveTile(int newI,int newJ) {
    i = newI;
    j = newJ;
    x = newI * pieceWidth + (pieceWidth / 2.0);
    y = newJ * pieceWidth + (pieceWidth / 2.0);
    println(newI,newJ,value);
  }
  
  //show function to draw a piece
  void display() {
    fill(fillColor); //<>//
    stroke(strokeColor);
    rectMode(CENTER);
    rect(x, y, size, size);
    textFont(f, 16);
    textAlign(CENTER,CENTER);
    fill(0);
    text(value ,x,y);

  }
  
}
