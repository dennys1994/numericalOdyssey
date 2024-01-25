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
 }
 else if(matrizMapa.matrizCodColisao[x][y] == 6){
 }
}

void story(){
  String[] texto = {
      "Oi Alex, seja bem vindo ao mundo da matematica! ",
      "Vejo que voce esta perdido hahaha, vou te ",
      " Falar um pouco sobre esse mundo",
      "Me siga..."
    };
  if(partHistoria == 0)
    criarDialogo(texto, 4, npc);
}
