// Kleuren
final int PAARS = #AAAAFF;
final int GRIJS = #808080;
final int GROEN = #00FF00;
final int ROOD = #FF0000;

// Constante waarde voor schermen
final int STARTSCHERM = 1;
final int SPELSCHERM = 2;
final int EINDSCHERM = 3;

// Gegevens voor scherm
int schermBreedte = 1000;
int schermHoogte = 500;

// Toestand van scherm
int spelToestand = STARTSCHERM;

boolean opnieuwTekenen = true;

void settings() {
  size(schermBreedte, schermHoogte);
}

void setup() {
  background(0);
  bommenDepots = loadImage("bommenDepots.png");
  koning = loadImage("koning.jpg");
  schat = loadImage("schat.png");
  leeg = loadImage("leeg.jpg");
}

void draw() {
  if (opnieuwTekenen) {
    background(0);

    switch (spelToestand) {
    case STARTSCHERM:
      toonStartScherm();
      break;
    case SPELSCHERM:
      toonSpelScherm();
      break;
    case EINDSCHERM:
      toonEindScherm();
      break;
    default:
      break;
    }
    opnieuwTekenen = false;
  }
}

void mousePressed() {
  int muisX = mouseX;
  int muisY = mouseY;
  
  switch (spelToestand) {
    case STARTSCHERM:
      startSchermMuisKlik(muisX, muisY);
      opnieuwTekenen = true;
      break;
    case SPELSCHERM:
      spelSchermMuisKlik(muisX, muisY);
      break;
    case EINDSCHERM:
      eindSchermMuisKlik(muisX, muisY);
      break;
    default:
      break;
    }
}
