class Piece {
 //Pieces just know their number, and their size
 //An integer of the piece's value
  String value;
  float size;
  float x,y;
  
  Piece(String val, float edge, float xi, float yi) {
    value = val;
    size = edge;
    x = xi;
    y = yi;
    
  }
  
  //show function to draw a piece
  void display(int fillColor) {
    fill(fillColor);
    stroke(255);
    rect(x, y, size, size);
    textFont(f, 16);
    textAlign(CENTER,CENTER);
    fill(0);
    text(value,x,y);

  }
  
}
