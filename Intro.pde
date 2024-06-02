int numFotos = 11;//intro
PImage[] introJogo = new PImage[numFotos];//intro
int fotoAtual = 0;// variavel para intro

void criarIntro(){
   for (int i = 0; i < numFotos; i++) {
    introJogo[i] = loadImage(i + 1 + ".png");
  }
}
