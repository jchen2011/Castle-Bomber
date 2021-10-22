// Kleuren
final int PAARS = #AAAAFF;
final int GRIJS = #808080;
final int GROEN = #00FF00;
final int ROOD = #FF0000;
final int ZWART = #000000;
final int WIT = #FFFFFF;

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
  background(ZWART);
  bommenDepots = loadImage("bommenDepots.png");
  koning = loadImage("koning.jpg");
  schat = loadImage("schat.png");
  leeg = loadImage("leeg.jpg");
  kasteel = loadImage("kasteel.jpg");
}

void draw() {
  if (opnieuwTekenen) {
    background(ZWART);

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
