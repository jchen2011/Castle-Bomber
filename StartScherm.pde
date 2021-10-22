final int PAARS = #AAAAFF;
final int GRIJS = #808080;

int[] aantalSchattenArray = {10, 15, 20, 25, 30};
int[] aantalBommendepotsArray = {3, 6, 9, 12, 15};

int indexSchatten = 2;
int indexBommendepots = 2;

int rijX = 80;
int rijY = 100;
int blokGrootte = 75;

int[] startKnop = {rijX * 4, 400, 375, blokGrootte, GRIJS};
int[] eindKnop = {325, 400, 350, blokGrootte, GRIJS};

void toonStartScherm() {
  //println("IN STARTSCHERM");
  toonTekst();
  tekenKnop(startKnop, "Start spel");
  tekenRij(aantalSchattenArray, rijY);
  tekenRij(aantalBommendepotsArray, rijY + blokGrootte * 2);
} 

void startSchermMuisKlik(int muisX, int muisY) {
  boolean startKnopGeraakt = bepaalIsBinnenKnop(startKnop, muisX, muisY);
  if (startKnopGeraakt) {
    spelBord = maakSpelBord(spelBord);
    spelToestand = SPELSCHERM;
  }
}
