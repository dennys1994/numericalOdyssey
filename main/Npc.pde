Personagem npc;

void criarNpc(){
  npc = new Personagem(9, 4, 13, 5, loadImage("data/npc_move.png"));
  npc.dividirFlames(578, 256, 9, 4);
}

void acaoNpc(){
  if(npc.acaoAtual == 0){
    npc.mostrar();
  }
  else if(npc.acaoAtual == 1){
    npc.andar = 2;
    npc.moverPersonagem();
    npc.mostrar();
    if(npc.x < 6*32-16){
      npc.acaoAtual = 2;
    }
  }
  else if(npc.acaoAtual == 2){
    npc.andar = 1;
    npc.moverPersonagem();
    npc.mostrar();
    if(npc.y < 32){
      npc.andar = 0;
      npc.acaoAtual = -1;
    }
  } 
}
