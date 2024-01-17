Personagem player;
int estadoSystem = 0;//estado 0 = menu ; estado 1 = jogando
int x=0, y=0;// posicao inicial do personagem
int numFotos = 11;
PImage[] introJogo = new PImage[numFotos];
int fotoAtual = 0;

void setup() {
  size(400, 400);
  personagemPrincipalMove = loadImage("data/char_move.png");
  dividirImagem(578, 256, 9, 4);//dimesao da img  e tamanho da matriz
  player = new Personagem(quadros, 0, 0);
  size(800, 600);
  criarMenu();
  // Carrega as imagens da intro
  for (int i = 0; i < numFotos; i++) {
    introJogo[i] = loadImage(i + 1 + ".png");
  }

}

void draw() {
  
  background(255);
  // player.mostrar();
  if (estadoSystem == 0) {
    // Exibe o título do jogo
    fill(0, 0, 255);
    textAlign(CENTER, CENTER);
    textSize(20);
    text("Odisseia Numérica\n Uma Aventura Além da Matemática\n\n", width / 2, 50);

    mostrarMenu();
  }
  else if(estadoSystem == 1){
    if(fotoAtual >= 0 && fotoAtual <= 10) 
      image(introJogo[fotoAtual], 0, 0, width, height);
    else
      player.mostrar();    
}
}
void keyPressed() {
  moverPersonagemPrincipal();
  if (key == ' ') {
    // Avança para a próxima imagem
    fotoAtual = (fotoAtual + 1);
  }
}
