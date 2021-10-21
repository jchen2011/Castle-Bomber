void toonTekst() {
  int tekstX = schermBreedte / 2;
  int tekstY = 50;
  
  fill(#AAAAFF);  // TODO: tekstkleur meegeven
  textSize(30);   // TODO: tekstgrootte meegeven
  textAlign(CENTER, CENTER);
  text("Aantal schatten", tekstX, tekstY);
  text("Aantal bommendepots", tekstX, tekstY + 165);
}
