
int estadoSystem = 0;//estado 0 = menu ; estado 1 = jogando
int partHistoria = 0;//para sabermos em qual parte da historia esta
color background;
void setup() {
  size(480, 320);
  background(255);

  //Carrega elementos do menu
  criarMenu();
  // Carrega as imagens da intro
  criarIntro();
  //Carrega imgs do personagem
  criarPersonagem();
  criarNpc();
  //carrega elementos do mapa
  carregarImgElementos();
  //cria o mapa
  matrizMapa.mapaPart1();
}

void draw() {
  background(background);
  // player.mostrar();
  if (estadoSystem == 0) {
    mostrarTitulo();
    mostrarMenu();
  } else if (estadoSystem == 1) {
    if (fotoAtual >= 0 && fotoAtual <= 10)
      image(introJogo[fotoAtual], 0, 0, width, height);//quando aperta SPACE troca pra proxima img
    else {
      matrizMapa.exibirMatriz();
      acaoNpc();
      player.mostrar();
      story();
     // rect(player.x,player.y,5,5);
     // println("Pos char x: ",player.x,"y: ",player.y);
      println("Pos bloco x: ",player.x/32,"y: ",player.y/32, "vel char: ", (player.y+player.velChar)/32);
     
    }
  }
  else if (estadoSystem == 2){//modo batalha ohhhhh
    mostrarBatalha();
  }
}
void keyPressed() {
  player.moverPersonagem();
  if (key == ' ') {
    // Avança para a próxima imagem
    fotoAtual = (fotoAtual + 1);
    if(fotoAtual>11){
      contador = 0;
      indiceDialogo++;
    }
  }
  if (key == 'e') {
    player.correr();
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
