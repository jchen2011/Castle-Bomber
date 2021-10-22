// knop gegevens
int[] aantalSchattenArray = {10, 15, 20, 25, 30};
int[] aantalBommendepotsArray = {3, 6, 9, 12, 15};

// Gegevens voor startknop en eindknop
int rijX = 80;
int rijY = 100;
int blokGrootte = 75;

// array met gegevens zoals coordinaten en kleur
int[] startKnop = {rijX * 4, 400, 375, blokGrootte, GRIJS};
int[] eindKnop = {325, 400, 350, blokGrootte, GRIJS};

void toonStartScherm() {
  //println("IN STARTSCHERM");
  toonTekstStart(aantalSchatten, aantalBommendepots);
  tekenKnop(startKnop, "Start spel");
  tekenRij(aantalSchattenArray, rijY);
  tekenRij(aantalBommendepotsArray, rijY + blokGrootte * 2);
} 

// Verwerkt een muisklik in de startscherm en kijkt vervolgens of je hebt geklikt op de startknop
void startSchermMuisKlik(int muisX, int muisY) {
  boolean startKnopGeraakt = bepaalIsBinnenKnop(startKnop, muisX, muisY);
  if (startKnopGeraakt) {
    spelBord = maakSpelBord(spelBord);
    spelToestand = SPELSCHERM;
  }
}
