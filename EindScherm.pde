void toonEindScherm() {
  println("IN EINDSCHERM");
  if(gewonnenKoning) {
    text("Je hebt gewonnen, je hebt de koning gevonden", schermBreedte / 2, schermHoogte / 2);
    gewonnenKoning = false;
  } else {
    text("Je hebt verloren", schermBreedte / 2, schermHoogte / 2);
  }
  tekenKnop(eindKnop, "Opnieuw");
}

void eindSchermMuisKlik(int muisX, int muisY) {
  boolean eindKnopGeraakt = bepaalIsBinnenKnop(eindKnop, muisX, muisY);
  if (eindKnopGeraakt) {
    resetWaarde();
    spelToestand = STARTSCHERM;
    opnieuwTekenen = true;
  }
}
