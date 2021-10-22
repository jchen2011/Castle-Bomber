// Afbeeldingen
PImage bommenDepots;
PImage koning;
PImage schat;
PImage leeg;
PImage kasteel;

// Instellingen voor schatten en bommendepots
int aantalSchatten = 15; // 15 default
int aantalBommendepots = 6; // 6 default

// Score voor spelscherm en eindscherm
int aantalScore = 0;
int aantalBommen = 10;

// Marge voor de grid
int margeLinks = 200;
int margeBoven = 100;

// Grootte van bord die belangrijk is voor het aanmaken van 2D array spelbord
int bordGrootte = 10;

// Breedte en hoogte van het spelbord
int breedte = schermBreedte / (bordGrootte * 2);
int hoogte = (schermHoogte - margeBoven) / (bordGrootte);

// Boolean om te weten of je de koning hebt gevonden
boolean gewonnenKoning = false;

// Getallen waarmee de blokjes in de grid geassocieerd meeworden
final int LEEG = 0;
final int SCHAT = 1;
final int BOMMENDEPOTS = 2;
final int KONING = 3;

// Waardes die belangrijk zijn om een vak te laten zien
final int TOON_VAK = -100;
final int WAARDE_VAK = 100;

// 2D Array aanmaken met grootte van bord
int[][] spelBord = new int[bordGrootte][bordGrootte];

// Deze methode vertoont hoe de spelbord er moet gaan uitzien
void toonSpelbord(int[][] spelBord) {
  background(ZWART);
  
  int aantalRijen = spelBord.length;
  int aantalKolommen = spelBord[0].length;

  int marge = 200;
  int tekstX = schermBreedte / 2;
  int tekstY = 50;

  
  int originalMouseX = mouseX;
  int originalMouseY = mouseY;
  aantalBommen--;
  
  for (int rijTeller = 0; rijTeller < aantalRijen; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < aantalKolommen; kolomTeller++) {
      int x = margeLinks + (kolomTeller * breedte);
      int y = margeBoven + (rijTeller * hoogte);

      rect(x, y, breedte, hoogte);
      switch(spelBord[rijTeller][kolomTeller]) {
      case LEEG:
        image(leeg, x, y, breedte, hoogte);
        break;
      case SCHAT:
        image(schat, x, y, breedte, hoogte);
        if (isSchatInExplosie(originalMouseX, originalMouseY, kolomTeller+1, rijTeller+1)){
        aantalScore++;
        }
        break;
      case BOMMENDEPOTS:
        image(bommenDepots, x, y, breedte, hoogte);
        if (isBomInExplosie(originalMouseX, originalMouseY, kolomTeller+1, rijTeller+1)){
        aantalBommen += 2;
        }
        break;
      case KONING:
        image(koning, x, y, breedte, hoogte);
        gewonnenKoning = true;
        spelToestand++;
        opnieuwTekenen = true;    
        break;
      default:
        break;
      }
    }
  }
  
  String aantalScoreTekst = "Aantal score: " + aantalScore;
  String aantalBommenTekst = "Aantal bommen: " + aantalBommen;
  text(aantalScoreTekst, tekstX - marge, tekstY);
  text(aantalBommenTekst, tekstX + marge, tekstY);
  if (aantalBommen < 0) {
    spelToestand++;
    opnieuwTekenen = true;
  }
}

//Bekijk of schat in gooiBom zit
boolean isSchatInExplosie(int originalMouseX, int originalMouseY, int kolom, int rij){
int knr = bepaalKolomNummer(originalMouseX);
int rnr = bepaalRijNummer(originalMouseY);

print("k: " +abs(knr - kolom)); 
print("r: " +abs(rnr - rij)); 
return abs(knr - kolom) <= 1 && abs(rnr - rij) <= 1;
}

//Bekijk of bom in gooiBom zit
boolean isBomInExplosie(int originalMouseX, int originalMouseY, int kolom, int rij){
int knr = bepaalKolomNummer(originalMouseX);
int rnr = bepaalRijNummer(originalMouseY);

print("k: " +abs(knr - kolom)); 
print("r: " +abs(rnr - rij)); 
return abs(knr - kolom) <= 1 && abs(rnr - rij) <= 1;
}

// Deze methode voegt de elementen zoals schatten, bommendepots toe aan de array en gaat ze vervolgens shuffelen 
int[][] maakSpelBord (int[][] spelBord) {
  int aantalGetallenArray = spelBord.length * spelBord[0].length;
  int[] getallen = new int[aantalGetallenArray];

  int plaatsElementenIndex = 0;

  for (int teller = 0; teller < getallen.length; teller++) {
    getallen[teller] = 100;
  }

  for (int teller = 0; teller < aantalSchatten; teller++) {
    getallen[plaatsElementenIndex] += SCHAT;
    plaatsElementenIndex++;
  }

  for (int teller = 0; teller < aantalBommendepots; teller++) {
    getallen[plaatsElementenIndex] += BOMMENDEPOTS;
    plaatsElementenIndex++;
  }

  plaatsElementenIndex++;

  getallen[plaatsElementenIndex] += KONING;

  for (int rijTeller = 0; rijTeller < spelBord.length; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < spelBord[rijTeller].length; kolomTeller++) {
      spelBord[rijTeller][kolomTeller] = 100;
    }
  }

  getallen = shuffleArray(getallen, aantalGetallenArray);
  int teller = 0;
  for (int rijTeller = 0; rijTeller < spelBord.length; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < spelBord[rijTeller].length; kolomTeller++) {
      spelBord[rijTeller][kolomTeller] = getallen[teller++];
    }
  }



  return spelBord;
}

// Shuffelen van een 1D-array, als tip van Daniel Roth. 
int[] shuffleArray(int[] getallen, int nieuweGetallen) {
  for (int indexGetal = nieuweGetallen-1; indexGetal > 0; indexGetal--) {
    int randomIndexGetal = int(random(indexGetal+1));
    int tijdelijk = getallen[indexGetal];

    getallen[indexGetal] = getallen[randomIndexGetal];
    getallen[randomIndexGetal] = tijdelijk;
  }

  return getallen;
}  

// Bij deze methode krijg je als parameter de spelbord, kolomNr en rijNr gegeven en weet je welke blokje in de grid is aangeklikt.
int[][] gooiBom(int[][] spelBord, int kolomNr, int rijNr) {
  kolomNr -= 1;
  rijNr -= 1;
  int aantalRijen = spelBord.length;
  int aantalKolommen = spelBord[0].length;

  int vorigeKolom = kolomNr - 1;
  int volgendeKolom = kolomNr + 1;
  int vorigeRij = rijNr - 1;
  int volgendeRij = rijNr + 1;

  boolean binnenDeSpelBord = kolomNr >= 0 && rijNr >= 0;

  if (binnenDeSpelBord) {
    if (spelBord[rijNr][kolomNr] >= 100) {
      spelBord[rijNr][kolomNr] -= 100;
    }
    if (vorigeKolom >= 0 && vorigeKolom <= aantalKolommen - 1 && spelBord[rijNr][vorigeKolom] >= WAARDE_VAK) {
      spelBord[rijNr][vorigeKolom] -= WAARDE_VAK;
    }
    if (volgendeKolom >= 0 && volgendeKolom <= aantalKolommen - 1 && spelBord[rijNr][volgendeKolom] >= WAARDE_VAK) {
      spelBord[rijNr][volgendeKolom] -= WAARDE_VAK;
    }
    if (vorigeRij >= 0 && vorigeRij <= aantalRijen - 1 && spelBord[vorigeRij][kolomNr] >= WAARDE_VAK) {
      spelBord[vorigeRij][kolomNr] -= WAARDE_VAK;
    }
    if (volgendeRij >= 0 && volgendeRij <= aantalRijen - 1 && spelBord[volgendeRij][kolomNr] >= WAARDE_VAK) {
      spelBord[volgendeRij][kolomNr] -= WAARDE_VAK;
    }
  }
  return spelBord;
}

// Tekst voor eindscherm
void resultaatSpelBord (boolean koning) {
  String score = "Aantal score: " + aantalScore;
  if (koning) {
    text("Je hebt gewonnen, je hebt de koning gevonden", schermBreedte / 2, schermHoogte / 2);
    text(score, schermBreedte / 2, schermHoogte / 2 + margeBoven);
    gewonnenKoning = false;
  } else {
    text("Je hebt verloren", schermBreedte / 2, schermHoogte / 2);
    text(score, schermBreedte / 2, schermHoogte / 2 - margeBoven);
  }
}

// Reset alle waarde, zodat hij met default instellingen weer door kan gaan en nieuwe met de getallen van vorige game
void resetWaarde() {
  aantalSchatten = 15; // 15 default
  aantalBommendepots = 6; // 6 default
  aantalScore = 0; // 0 default
  aantalBommen = 10; // 10 default
}
