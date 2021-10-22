void toonEindScherm() {
  println("IN EINDSCHERM");
  resultaatSpelBord(gewonnenKoning);
  tekenKnop(eindKnop, "Opnieuw");
}

// Verwerkt een muisklik en bepaalt vervolgens of het de eindknop heeft geraakt.
void eindSchermMuisKlik(int muisX, int muisY) {
  boolean eindKnopGeraakt = bepaalIsBinnenKnop(eindKnop, muisX, muisY);
  if (eindKnopGeraakt) {
    resetWaarde();
    spelToestand = STARTSCHERM;
    opnieuwTekenen = true;
  }
}
