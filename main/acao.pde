void acaoEspecial(int x, int y){
 if(matrizMapa.matrizCodColisao[x][y] == 0){
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 2){
   matrizMapa.mapaCasa();
   player.atualizaPos(8, 8);
   npc.atualizaPos(20,20);//fora do mapa
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 3){
   matrizMapa.mapaPart2();
   player.atualizaPos(14, 5);
  //npc.atualizaPos(13, 5);
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 4){
   dialogo = 1;
   player.interacaoPersonagem = 0;
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 5){
   dialogo = 1;
   partHistoria = 1;
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 6){
   matrizMapa.mapaPart4();
   player.atualizaPos(6,8);
   npc.atualizaPos(6,3);
   npc.acaoAtual = 3;
   npc.frameAtual = 22;
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 7){
   matrizMapa.mapaPart3();
   npc.acaoAtual = -1;
   player.atualizaPos(6,1);
 }
 println(matrizMapa.matrizCodColisao[x][y], " acao especial");
}

void story(){
  String[] texto1 = {
      "Oi Alex, seja bem vindo ao mundo da matematica! ",
      "Vejo que voce esta perdido hahaha, vou te ",
      " Falar um pouco sobre esse mundo",
      "Me siga..."
    };
  if(partHistoria == 0)
    criarDialogo(texto1, 4, npc, 1);//string, linhas, npc, prox acao do npc se nao houver sera -1
  else if(partHistoria == 1){
    String[] texto2 = {
      "Entao alex, vou te ensinar o basico",
      "de matematica, para voce sobreviver",
      "vamos aos calculos..."
    };
    criarDialogo(texto2, 3, npc, 4);
  }
  else if(partHistoria == 2){
    npc.acaoAtual=-1;
    npc.atualizaPos(20,20);//fora do mapa, se ele nao aparecer influencia no jogo ? omg
    matrizMapa.mapaPart5();
    player.atualizaPos(6,2);
    player.interacaoPersonagem = 1;
    partHistoria = -1;
  }
}
