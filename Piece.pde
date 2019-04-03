class Piece {
 //Pieces just know their number, and their size
 //An integer of the piece's value
  char value;
  float size;
  float x,y;
  int i,j;
  int REDIX=10;
  int strokeColor = 255;
  
  Piece(int val, float edge, float xi, float yi, int ipos, int jpos) {
    value = Character.forDigit(val,REDIX);
    size = edge;
    x = xi;
    y = yi;
    i = ipos;
    j = jpos;

  }
  
  //show function to draw a piece
  void display(int fillColor) {
    if(value == '0') {
     fillColor = 0;
     strokeColor = 0;
    }
    fill(fillColor);
    stroke(strokeColor);
    rectMode(CENTER);
    rect(x, y, size, size);
    textFont(f, 16);
    textAlign(CENTER,CENTER);
    fill(0);
    text(value ,x,y);

  }
  
}
