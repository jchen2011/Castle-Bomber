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
      boolean waarheid = bepaalIsBinnenVeld(mouseX, mouseY, breedte, hoogte, kolomTeller, rijTeller);
      if (waarheid) {
        println("yo");
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
}

int[][] maakSpelBord (int[][] spelBord) {
  int aantalGetallenArray = spelBord.length * spelBord[0].length;
  int[] getallen = new int[aantalGetallenArray];

  int plaatsElementenIndex = 0;

  for (int i = 0; i < getallen.length; i++) {
    getallen[i] = 0;
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

void gooiBom() {
  for (int rijTeller = 0; rijTeller < spelBord.length; rijTeller++) {
    for (int kolomTeller = 0; kolomTeller < spelBord[rijTeller].length; kolomTeller++) {
      boolean waarheid = bepaalIsBinnenVeld(mouseX, mouseY, breedte, hoogte, kolomTeller, rijTeller);
      if (waarheid) {
        if (spelBord[rijTeller][kolomTeller] < 100) {
          spelBord[rijTeller][kolomTeller] += 100;
        } else if (rijTeller - 1 >= 0 && rijTeller - 1 <= spelBord.length - 1 && spelBord[rijTeller-1][kolomTeller] < 100) {
          spelBord[rijTeller][kolomTeller] += 100;
        } else if (rijTeller + 1 >= 0 && rijTeller + 1 <= spelBord.length - 1 && spelBord[rijTeller+1][kolomTeller] < 100) {
          spelBord[rijTeller][kolomTeller] += 100;
        } else if (kolomTeller - 1 >= 0 && kolomTeller - 1 <= spelBord[0].length - 1 && spelBord[rijTeller][kolomTeller - 1] < 100) {
          spelBord[rijTeller][kolomTeller] += 100;
        } else if (kolomTeller + 1 >= 0 && kolomTeller + 1 <= spelBord[0].length - 1 && spelBord[rijTeller][kolomTeller + 1] < 100) {
          spelBord[rijTeller][kolomTeller] += 100;
        }
      }
    }
  }
}
