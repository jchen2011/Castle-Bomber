final int PAARS = #AAAAFF;
final int GRIJS = #808080;

int[] aantalSchattenArray = {10, 15, 20, 25, 30};
int[] aantalBommendepotsArray = {3, 6, 9, 12, 15};

int indexSchatten = 2;
int indexBommendepots = 2;

int rijX = 80;
int rijY = 100;
int blokGrootte = 75;

int[] startKnop = {rijX * 4, 400, 350, blokGrootte, GRIJS};


void toonStartScherm() {
  println("IN STARTSCHERM");
  toonTekst();
  tekenKnop(startKnop, "Start spel");
  tekenRij(aantalSchattenArray, rijY);
  tekenRij(aantalBommendepotsArray, rijY + blokGrootte * 2);
} 

void startSchermMuisKlik(int muisX, int muisY) {
  boolean startKnopX = muisX >= rijX * 4 && muisX <= (rijX * 4) + 350;
  boolean startKnopY = muisY >= 400 && muisY <= 400 + blokGrootte;
  boolean startKnop = startKnopX && startKnopY;
  if (startKnop) {
    spelBord = maakSpelBord(spelBord);
    spelToestand = SPELSCHERM;
    
  }
}
