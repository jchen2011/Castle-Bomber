final int STARTSCHERM = 1;
final int SPELSCHERM = 2;
final int EINDSCHERM = 3;

int schermBreedte = 1000;
int schermHoogte = 500;

int spelToestand = STARTSCHERM;

boolean opnieuwTekenen = true;

void settings() {
  size(schermBreedte, schermHoogte);
}

void setup() {
  background(0);
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

void mouseClicked() {
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
