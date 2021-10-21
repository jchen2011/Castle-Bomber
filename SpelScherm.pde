final int ONGELDIG = -1;

void toonSpelScherm() {
  background(255);
  println("IN SPELSCHERM");
  maakSpelBord(spelBord);
  toonSpelbord(spelBord);
  for (int i = 0; i < spelBord.length; i++) {
    for (int j = 0; j < spelBord[i].length; j++) {
      printArray(spelBord[i][j]);
    }
  }
}

void spelSchermMuisKlik(int muisX, int muisY) {
  int kolomNr = bepaalKolomNummer(muisX);
  int rijNr = bepaalRijNummer(muisY);
  spelBord = gooiBom(spelBord, kolomNr, rijNr);
  toonSpelbord(spelBord);
}

void toonKlikResultaat(int kolomNr, int rijNr) {
  boolean ongeldig = (kolomNr == ONGELDIG) || (rijNr == ONGELDIG);

  if (ongeldig) {
    println("Ongeldige rij of kolom!");
  } else {
    println("Rij: " + rijNr + "   Kolom: " + kolomNr);
  }
}

int bepaalKolomNummer(int muisX) {
  int kolomNr = ONGELDIG;

  int gridX = muisX - margeLinks;
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

int bepaalRijNummer(int muisY) {
  int rijNr = ONGELDIG;

  int gridY = muisY - margeBoven;
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
