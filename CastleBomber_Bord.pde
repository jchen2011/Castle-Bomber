int aantalSchatten = 15; // 15 default
int aantalBommendepots = 6; // 6 default

int aantalScore = 0;
int aantalBommen = 10;

int margeLinks = 200;
int margeBoven = 100;

int bordGrootte = 10;

int breedte = schermBreedte / (bordGrootte * 2);
int hoogte = (schermHoogte - margeBoven) / (bordGrootte);

boolean gewonnenKoning = false;

PImage bommenDepots;
PImage koning;
PImage schat;
PImage leeg;

final int LEEG = 0;
final int SCHAT = 1;
final int BOMMENDEPOTS = 2;
final int KONING = 3;

final int TOON_VAK = -100;
final int WAARDE_VAK = 100;
int[][] spelBord = new int[bordGrootte][bordGrootte];


void toonSpelbord(int[][] spelBord) {
  background(0);

  int aantalRijen = spelBord.length;
  int aantalKolommen = spelBord[0].length;

  int marge = 200;
  int tekstX = schermBreedte / 2;
  int tekstY = 50;

  String aantalScoreTekst = "Aantal score: " + aantalScore;
  String aantalBommenTekst = "Aantal bommen: " + aantalBommen;
  text(aantalScoreTekst, tekstX - marge, tekstY);
  text(aantalBommenTekst, tekstX + marge, tekstY);
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
        break;
      case BOMMENDEPOTS:
        image(bommenDepots, x, y, breedte, hoogte);
        break;
      case KONING:
        image(koning, x, y, breedte, hoogte);
        spelToestand++;
        gewonnenKoning = true;
        opnieuwTekenen = true;    
        break;
      default:
        break;
      }
    }
  }

  if (aantalBommen < 0) {
    spelToestand++;
    opnieuwTekenen = true;
  }
}

int[][] maakSpelBord (int[][] spelBord) {
  int aantalGetallenArray = spelBord.length * spelBord[0].length;
  int[] getallen = new int[aantalGetallenArray];

  int plaatsElementenIndex = 0;

  for (int i = 0; i < getallen.length; i++) {
    getallen[i] = 100;
  }

  for (int i = 0; i < aantalSchatten; i++) {
    getallen[plaatsElementenIndex] += SCHAT;
    plaatsElementenIndex++;
  }

  for (int i = 0; i < aantalBommendepots; i++) {
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
  for (int i = 0; i < spelBord.length; i++) {
    for (int j = 0; j < spelBord[i].length; j++) {
      spelBord[i][j] = getallen[teller++];
    }
  }



  return spelBord;
}

// Shuffle als tip van Daniel  
int[] shuffleArray(int getallen[], int nieuweGetallen) {
  for (int indexGetal = nieuweGetallen-1; indexGetal > 0; indexGetal--) {
    int randomIndexGetal = int(random(indexGetal+1));
    int tijdelijk = getallen[indexGetal];

    getallen[indexGetal] = getallen[randomIndexGetal];
    getallen[randomIndexGetal] = tijdelijk;
  }

  return getallen;
}

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

void resetWaarde() {
  aantalSchatten = 15; // 15 default
  aantalBommendepots = 6; // 6 default
  aantalScore = 0;
  aantalBommen = 10;
}
