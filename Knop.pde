final int X = 0;
final int Y = 1;
final int BREEDTE = 2;
final int HOOGTE = 3;
final int KLEUR = 4;
final int VORM = 5;

int tekstGrootte = 25;
// Deze methode ontvangt een 1D array en een string als parameter en tekent vervolgens een knop
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

  fill(PAARS);
  textSize(tekstGrootte);
  textAlign(CENTER, CENTER);
  text(tekst, tekstX, tekstY);
}

// Deze methode ontvangt een array en een int en tekent vervolgens een rij van knoppen
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
    } 

    textSize(tekstGrootte); 
    textAlign(CENTER, CENTER);
    text(array[teller], tekstX, tekstY);
  }
}

// Bij deze methode krijg je een return van true of false als de x en y coordinaten binnen een bepaalde knop zitten.
boolean bepaalIsBinnenKnop(int [] knop, int muisX, int muisY) {
  int knopX = knop[X];
  int knopY = knop[Y];
  int knopBreedte = knop[BREEDTE];
  int knopHoogte = knop[HOOGTE];
  
  boolean kloptX = (muisX >= knopX && muisX <= knopX + knopBreedte);
  boolean kloptY = (muisY >= knopY && muisY <= knopY + knopHoogte);
  boolean knopGeraakt = kloptX && kloptY;

  return knopGeraakt;
}
