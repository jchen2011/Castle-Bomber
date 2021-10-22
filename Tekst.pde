int tekstGrootteStart = 30;
// Vertoont de tekst die nodig is in het startscherm
void toonTekstStart(int aantalSchatten, int aantalBommendepots) {
  int tekstX = schermBreedte / 2;
  int tekstY = 50;
  
  String schatten = "Aantal schatten: " + aantalSchatten;
  String bomdepots = "Aantal bommendepots: " + aantalBommendepots;
  
  fill(PAARS);
  textSize(tekstGrootteStart); 
  textAlign(CENTER, CENTER);
  text(schatten, tekstX, tekstY);
  text(bomdepots, tekstX, tekstY + 165);
}
