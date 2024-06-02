Personagem npc;//professor
Personagem frank;

void criarFrank(){
  frank = new Personagem(9, 4 , 7, 3, loadImage("data/frank_move.png"), loadImage("data/personagens/frank.png"));
  frank.dividirFlames(578, 256, 9, 4);
}

void criarNpc() {
  npc = new Personagem(9, 4, 13, 5, loadImage("data/npc_move.png"), loadImage("data/personagens/professor.png"));
  npc.dividirFlames(578, 256, 9, 4);
}

void acaoNpc() {
  if (npc.acaoAtual == 0) {
    npc.mostrar();
  } else if (npc.acaoAtual == 1) {
    matrizMapa.mapaPart2();
    npc.andar = 2;
    npc.moverPersonagem();
    npc.mostrar();
    if (npc.x < 6*32-16) {
      npc.acaoAtual = 2;
    }
  } else if (npc.acaoAtual == 2) {
    npc.andar = 1;
    npc.moverPersonagem();
    npc.mostrar();
    if (npc.y < 32) {
      matrizMapa.mapaPart3();
      npc.andar = 0;
      npc.acaoAtual = -1;
    }
  } else if (npc.acaoAtual == 3) {
    npc.mostrar();
  } else if (npc.acaoAtual == 4) {
    player.interacaoPersonagem = 0;
    matrizMapa.mapaPart4meio();
    npc.andar = 4;
    npc.moverPersonagem();
    npc.mostrar();
    if (npc.x/tamanhoElementoPx > 6)
      npc.acaoAtual = 5;
  } else if (npc.acaoAtual == 5) {
    npc.andar = 3;
    npc.moverPersonagem();
    npc.mostrar();
    if (npc.y >tamanhoElementoPx*5.5) {
      npc.acaoAtual = 6;
    }
  } else if (npc.acaoAtual == 6) {
    npc.andar = 4;
    npc.moverPersonagem();
    npc.mostrar();
    if (npc.x > tamanhoElementoPx*9){
      npc.frameAtual = 0;
      player.interacaoPersonagem = 1;
      npc.acaoAtual = -1;
    }
  }
  else if(npc.acaoAtual == 7){
    npc.mostrar();
    frank.mostrar();
  }
  else if(npc.acaoAtual == 8){
    npc.mostrar();
    frank.mostrar();
    player.interacaoPersonagem = 0;
    partHistoria=3;
  }
  else if(npc.acaoAtual == 9){
    estadoSystem = 3;
    player.interacaoPersonagem = 0;
  }else if(npc.acaoAtual == 10){
    npc.mostrar();
    frank.mostrar();
    player.interacaoPersonagem = 0;
    partHistoria = 4;
  }
  else if(npc.acaoAtual == 11){
   estadoSystem = 4;
   player.interacaoPersonagem = 0;
  }
}
