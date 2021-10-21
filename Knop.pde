final int X = 0;
final int Y = 1;
final int BREEDTE = 2;
final int HOOGTE = 3;
final int KLEUR = 4;
final int VORM = 5;

final int GROEN = #00FF00;
final int ROOD = #FF0000;

void tekenKnop(int[] data, String tekst) {
  int x = data[X];
  int y = data[Y];
  int breedte = data[BREEDTE];
  int hoogte = data[HOOGTE];
  int kleur = data[KLEUR];

  int tekstX = x + breedte / 2;
  int tekstY = y + hoogte / 2;

  // tekenen
  fill(kleur);
  rect(x, y, breedte, hoogte);

  fill(PAARS);  // TODO: tekstkleur meegeven
  textSize(25);   // TODO: tekstgrootte meegeven
  textAlign(CENTER, CENTER);
  text(tekst, tekstX, tekstY);
}

void tekenRij(int[] array, int y) {
  for (int teller = 0; teller < array.length; teller++) {
    //int balkX = (blokGrootte * teller) + (rijX * 4 - (blokGrootte * teller / 10));
    int balkX = (rijX * 4) + (blokGrootte * teller);
    fill(#FFFFFF);
    rect(balkX, y, blokGrootte, blokGrootte);

    int tekstX = balkX + (blokGrootte / 2);
    int tekstY = y + (blokGrootte / 2);

    boolean blokX = mouseX > balkX && mouseX < balkX + blokGrootte;
    boolean blokY = mouseY > y && mouseY < y + blokGrootte;

    fill(PAARS);

    if (blokX && blokY) {
      fill(GROEN);
    } 

    textSize(30);   // TODO: tekstgrootte meegeven
    textAlign(CENTER, CENTER);
    text(array[teller], tekstX, tekstY);
  }
}
