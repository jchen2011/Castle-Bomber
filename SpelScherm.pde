// Constante voor een ongeldige waarde
final int ONGELDIG = -1;

// marge voor de grid
int margeGridLinks = 200;
int margeGridBoven = 100;

// Het spelscherm tonen door de switch case
void toonSpelScherm() {
  background(WIT);
  println("IN SPELSCHERM");
  maakSpelBord(spelBord);
  toonSpelbord(spelBord);
  for (int rijTeller = 0; rijTeller < spelBord.length; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < spelBord[rijTeller].length; kolomTeller++) {
      printArray(spelBord[rijTeller][kolomTeller]);
    }
  }
}

// Verwerkt de muisklik in het spelscherm
void spelSchermMuisKlik(int muisX, int muisY) {
  int kolomNr = bepaalKolomNummer(muisX);
  int rijNr = bepaalRijNummer(muisY);
  spelBord = gooiBom(spelBord, kolomNr, rijNr);
  toonSpelbord(spelBord);
}

// Deze methode laat zien welke rijnummer en kolomnummer het zijn. Bij ongeldige klik, komt er een ongeldige rij of kolom tevoorschijn
void toonKlikResultaat(int kolomNr, int rijNr) {
  boolean ongeldig = (kolomNr == ONGELDIG) || (rijNr == ONGELDIG);

  if (ongeldig) {
    println("Ongeldige rij of kolom!");
  } else {
    println("Rij: " + rijNr + "   Kolom: " + kolomNr);
  }
}
// Deze methode return een kolomnummer
int bepaalKolomNummer(int muisX) {
  int kolomNr = ONGELDIG;

  int gridX = muisX - margeGridLinks;
  int gridIndexNr = gridX / (breedte);

  boolean geldig = (gridIndexNr >= 0 && gridIndexNr < 10);

  if (geldig) {
    int gridCelX = gridX - (gridIndexNr * (breedte));

    geldig = (gridCelX >= 0) && (gridCelX <= breedte);

    if (geldig) {
      kolomNr = gridIndexNr + 1;
    }
  }

  return kolomNr;
}

// Deze methode return een rijnummer
int bepaalRijNummer(int muisY) {
  int rijNr = ONGELDIG;

  int gridY = muisY - margeGridBoven;
  int gridIndexNr = gridY / (hoogte);

  boolean geldig = (gridIndexNr >= 0 && gridIndexNr < 10);

  if (geldig) {
    int gridCelY = gridY - (gridIndexNr * (hoogte));

    geldig = (gridCelY >= 0) && (gridCelY <= hoogte);

    if (geldig) {
      rijNr = gridIndexNr + 1;
    }
  }

  return rijNr;
}
