
int estadoSystem = 0;//estado 0 = menu ; estado 1 = jogando

void setup() {
  size(480, 320);
  background(0);

  //Carrega elementos do menu
  criarMenu();
  // Carrega as imagens da intro
  criarIntro();
  //Carrega imgs do personagem
  criarPersonagem();
  //carrega elementos do mapa
  carregarImgElementos();
  //cria o mapa
  matrizMapa.criarMapa();
}

void draw() {

  background(192, 232, 64);
  // player.mostrar();
  if (estadoSystem == 0) {
    mostrarTitulo();
    mostrarMenu();
  } else if (estadoSystem == 1) {
    if (fotoAtual >= 0 && fotoAtual <= 10)
      image(introJogo[fotoAtual], 0, 0, width, height);//quando aperta SPACE troca pra proxima img
    else {
      matrizMapa.exibirMatriz();
      player.mostrar();
     // rect(player.x,player.y,5,5);
     // println("Pos char x: ",player.x,"y: ",player.y);
     // println("Pos bloco x: ",player.x/32,"y: ",player.y/32);
    }
  }
}
void keyPressed() {
  player.moverPersonagemPrincipal();
  if (key == ' ') {
    // Avança para a próxima imagem
    fotoAtual = (fotoAtual + 1);
    if(fotoAtual>10)
      player.correr();
  }
  if (key == 'o') {
    player.atualizarPos(240, 160);
  }
}

void keyReleased(){
 if(key == ' ')
   player.andar();
}

void mousePressed() {
  //clicar no menu
  if (estadoSystem == 0)
    cliqueOpcao();
}
