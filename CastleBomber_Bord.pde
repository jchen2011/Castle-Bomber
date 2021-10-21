int aantalSchatten = 15;
int aantalBommendepots = 6;

int margeLinks = 200;
int margeBoven = 100;

int bordGrootte = 10;

int breedte = schermBreedte / (bordGrootte * 2);
int hoogte = (schermHoogte - margeBoven) / (bordGrootte);

PImage bommenDepots;
PImage koning;
PImage schat;
PImage leeg;

final int LEEG = 0;
final int SCHAT = 1;
final int BOMMENDEPOTS = 2;
final int KONING = 3;

final int TOON_VAK = -100;

int[][] spelBord = new int[bordGrootte][bordGrootte];


void toonSpelbord(int[][] spelBord) {
  background(0);

  int aantalRijen = spelBord.length;
  int aantalKolommen = spelBord[0].length;

  for (int rijTeller = 0; rijTeller < aantalRijen; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < aantalKolommen; kolomTeller++) {
      int x = (kolomTeller * breedte) + margeLinks;
      int y = (rijTeller * hoogte) + margeBoven;
      rect(x, y, breedte, hoogte);
      if (spelBord[rijTeller][kolomTeller] == LEEG) {
        image(leeg, x, y, breedte, hoogte);
      } else if (spelBord[rijTeller][kolomTeller] == SCHAT) {
        image(schat, x, y, breedte, hoogte);
      } else if (spelBord[rijTeller][kolomTeller] == BOMMENDEPOTS) {
        image(bommenDepots, x, y, breedte, hoogte);
      } else if (spelBord[rijTeller][kolomTeller] == KONING) {
        image(koning, x, y, breedte, hoogte);
      }
    }
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
int[] shuffleArray(int getallen[], int nGetallen) {
  for (int getalIndex = nGetallen-1; getalIndex > 0; getalIndex--) {
    int randomIndex = int(random(getalIndex+1));
    int temp = getallen[getalIndex];

    getallen[getalIndex] = getallen[randomIndex];
    getallen[randomIndex] = temp;
  }

  return getallen;
}

int[][] gooiBom(int[][] spelBord, int kolomNr, int rijNr) {
  boolean ja = kolomNr > 0 && rijNr > 0;
  if (ja) {
    if (spelBord[rijNr][kolomNr] >= 100) {
      spelBord[rijNr][kolomNr] -= 100;
    } 
    if (rijNr - 1 >= 0 && rijNr - 1 <= spelBord.length - 1 && spelBord[rijNr-1][kolomNr] >= 100) {
      spelBord[rijNr - 1][kolomNr] -= 100;
    }
    if (rijNr + 1 >= 0 && rijNr + 1 <= spelBord.length - 1 && spelBord[rijNr+1][kolomNr] >= 100) {
      spelBord[rijNr + 1][kolomNr] -= 100;
    }
    if (kolomNr - 1 >= 0 && kolomNr - 1 <= spelBord[0].length - 1 && spelBord[rijNr][kolomNr - 1] >= 100) {
      spelBord[rijNr][kolomNr - 1] -= 100;
    }
    if (kolomNr + 1 >= 0 && kolomNr + 1 <= spelBord[0].length - 1 && spelBord[rijNr][kolomNr + 1] >= 100) {
      spelBord[rijNr][kolomNr + 1] -= 100;
    }
  }
  return spelBord;
}
