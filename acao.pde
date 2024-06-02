void acaoEspecial(int x, int y) {
  if (matrizMapa.matrizCodColisao[x][y] == 0) {
  } else if (matrizMapa.matrizCodColisao[x][y] == 2) {
    matrizMapa.mapaCasa();
    player.atualizaPos(8, 8);
    npc.atualizaPos(20, 20);//fora do mapa
  } else if (matrizMapa.matrizCodColisao[x][y] == 3) {
    matrizMapa.mapaPart2();
    player.atualizaPos(14, 5);
    //npc.atualizaPos(13, 5);
  } else if (matrizMapa.matrizCodColisao[x][y] == 4) {
    dialogo = 1;
    partHistoria=1;
    player.interacaoPersonagem = 0;
  } else if (matrizMapa.matrizCodColisao[x][y] == 5) {
    dialogo = 1;
    partHistoria = 2;
  } else if (matrizMapa.matrizCodColisao[x][y] == 6) {
    matrizMapa.mapaPart4();
    player.atualizaPos(6, 8);
    npc.atualizaPos(6, 3);
    npc.acaoAtual = 3;
    npc.frameAtual = 22;
  } else if (matrizMapa.matrizCodColisao[x][y] == 7) {
    matrizMapa.mapaPart3();
    npc.acaoAtual = -1;
    player.atualizaPos(6, 1);
  } else if (matrizMapa.matrizCodColisao[x][y] == 8) {
    matrizMapa.mapaBiblioteca();
    npc.acaoAtual = -1;
    player.atualizaPos(7, 8);
  } else if (matrizMapa.matrizCodColisao[x][y] == 9) {
    matrizMapa.mapaPart6();
    npc.acaoAtual = -1;
    player.atualizaPos(14, 5);
  } else if (matrizMapa.matrizCodColisao[x][y] == 10) {
    matrizMapa.mapaPart7();
    npc.acaoAtual = -1;
    player.atualizaPos(2, 5);
  } else if (matrizMapa.matrizCodColisao[x][y] == 11) {
    matrizMapa.mapaPart8();
    npc.acaoAtual = -1;
    player.atualizaPos(6, 8);
  } else if (matrizMapa.matrizCodColisao[x][y] == 12) {
    matrizMapa.mapaPart5();
    npc.acaoAtual = -1;
    player.atualizaPos(2, 5);
  } else if (matrizMapa.matrizCodColisao[x][y] == 13) {
    matrizMapa.mapaPart5();
    npc.acaoAtual = -1;
    player.atualizaPos(14, 5);
  } else if (matrizMapa.matrizCodColisao[x][y] == 14) {
    matrizMapa.mapaPart5();
    npc.acaoAtual = -1;
    player.atualizaPos(6, 1);
  } else if (matrizMapa.matrizCodColisao[x][y] == 15) {
    matrizMapa.mapaPart9();
    npc.acaoAtual = -1;
    player.atualizaPos(7, 8);
  } else if (matrizMapa.matrizCodColisao[x][y] == 16) {
    matrizMapa.mapaPart8();
    npc.acaoAtual = -1;
    player.atualizaPos(7, 1);
  } else if (matrizMapa.matrizCodColisao[x][y] == 17) {
    matrizMapa.mapaPart10();
    npc.acaoAtual = -1;
    player.atualizaPos(4, 8);
  } else if (matrizMapa.matrizCodColisao[x][y] == 18) {
    matrizMapa.mapaPart9();
    npc.acaoAtual = -1;
    player.atualizaPos(4, 1);
  }
  else if (matrizMapa.matrizCodColisao[x][y] == 19) {
    matrizMapa.mapaBiblioteca();
    npc.acaoAtual = 7;
    npc.frameAtual = 22;
    npc.atualizaPos(3,4);
    player.atualizaPos(7,8);
  }
  else if (matrizMapa.matrizCodColisao[x][y] == 20) {
    npc.acaoAtual = 8;
    dialogo = 1;
  }
  else if (matrizMapa.matrizCodColisao[x][y] == 21) {
    npc.acaoAtual = 10;
    dialogo = 1;
  }
 // println(matrizMapa.matrizCodColisao[x][y], " acao especial");
}

void story() {//funcao para dialogos e acoes pois batalhas
  if (partHistoria == 0) {
    String[] texto1 = {
      " ",
      "Ohh! Que lugar é esse? Lembro de ter ido dormir",
      "e acordei nesse mundo medieval.",
      "Há um homem naquela casa; vou falar com ele."
    };
    dialogo = 1 ;
    criarDialogo(texto1, 4, null, -1);//string, linhas, npc, prox acao do npc se nao houver sera -1
  } else if(partHistoria == 1){
    String[] texto2 = {
      "Alex:Olá, senhor! Me chamo Alex. Estou perdido. ",
     /* "Consegue me ajudar? Apenas lembro deter ido dormir e acordar aqui.",
      "Professor: Olá, Alex! Me chame de Professor.",
      "Sou o prefeito de Mathcity, cidade da matemática,",
      "onde todas as contas matemáticas surgem. Você é bom em contas?",
      "Alex: Não, professor, não vejo utilidade.",
      "Professor: Então, acredito que você tenha vindo parar aqui",
      "exatamente por ter esse pensamento.",
      "Você poderá me ajudar a resolver as coisas por aqui.",
      "Alex: Professor, que coisas?",*/
      "Professor: Eu te conto na cidade. Por favor, me siga."
    };
    criarDialogo(texto2, texto2.length, npc, 1);//string, linhas, npc, prox acao do npc se nao houver sera -1
  }
  else if (partHistoria == 2) {
    String[] texto2 = {
      "Alex: Professor, que tipo de ajuda você precisa?",
      /*"Professor: Estou tendo problemas com as operações matemáticas.",
      "Cada operação é representada por um ser vivo,",
      "os monstros matemáticos,",
      "revoltados pelo renascimento do rei demônio.",
      "Alex: Um rei demônio?",
      "Professor: Sim, ele é responsável por muitos problemas",
      "matemáticos complicados. Você foi trazido aqui para ser",
      "o herói e derrotá-lo. Precisamos vencê-lo para você",
      "retornar ao seu mundo.",
      "Alex: Como fazemos isso?",
      "Professor: Cada monstro matemático pode ser derrotado",
      "acertando seus desafios, envolvendo contas matemáticas.",
      "Alex: Mas por que eu? Sou ruim em cálculos.",
      "Professor: Como você é o herói, só você pode colocar",
      "magia nas respostas e ferir os monstros. Mas cuidado,",
      "cada resposta errada pode resultar em um ataque do inimigo.",
      "Alex: Precisarei de ajuda.",
      "Professor: Posso te ajudar com o básico, mas as respostas",
      "são por sua conta. Irei te ensinar as 4 operações dos monstros",
      "matemáticos para passar por eles.",
      "Alex: Tudo bem, professor, prestarei atenção.",*/
      "Prof: Vamos para a biblioteca..."
    };
    criarDialogo(texto2, texto2.length, npc, 4);
  } else if (partHistoria == 3) {
    String[] texto3 ={
      "Prof.: Aqui você pode tirar dúvidas sobre as operações.",
      "Pergunte qual operação precisa de ajuda, e explicarei.",
      "Depois, vá atrás dos monstros pelo mundo."
    };
    criarDialogo(texto3, texto3.length, npc, 9);
  }
  else if (partHistoria == 4) {
    String[] texto4 ={
      "Frank: Olá, sou o frank",
      "estou aqui para te ajudar",
      "em qual operacao quer batalhar?"
    };
    criarDialogo(texto4, texto4.length, npc, 11);//acao 7 apenas para mostrar os npcs apos o dialogo
  }
  else if (partHistoria == 5){//sair do modo de batalha do frank
    npc.acaoAtual=7;
    matrizMapa.mapaBiblioteca();
    player.interacaoPersonagem = 1;
    partHistoria = -1;
    frank.atualizaPos(7,3);
    npc.atualizaPos(3,4);
    player.atualizaPos(7,5);
    estadoSystem = 1;
    escolhida = 0;
  }
}
