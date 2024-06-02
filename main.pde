import processing.sound.*;

SoundFile music;
int estadoSystem = 0;//estado 0 = menu ; estado 1 = jogando
int partHistoria = -1;//para sabermos em qual parte da historia esta
color background;
int tempoInicio;

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
  criarFrank();
  //carrega elementos do mapa
  carregarImgElementos();
  //cria o mapa
  matrizMapa.mapaPart1();
  //usado para fazer tela de carregamento
  tempoInicio = millis();
  //carregaer imagens das  aulas
  carregaAulas();
  // Carregar a música
  carregarMusica();
}
void carregarMusica(){
   music = new SoundFile(this, "trilha (online-audio-converter.com).wav");
   music.amp(0.05);//volume audio
  // Configurar a reprodução em loop
  if(music != null)
    music.loop();
    else
    println("erro");
    /*void tocarMusica(){//podemos usar pra trocar trilha s2
    // Verifique se a música terminou de tocar
  if (!music.isPlaying()) {
    // Reinicie a música
    music.play();
  }
    }*/
}

void draw() {
  background(background);
  // player.mostrar();
  if (estadoSystem == 0) {
    if (millis() - tempoInicio < 3000) {
      mostrarCapa();
      textAlign(CENTER, CENTER);
      textSize(50);
      text("CARREGANDO\n\n", width / 2, 80);
    } else {
      mostrarCapa();
      mostrarTitulo();
      mostrarMenu();
    }
  } else if (estadoSystem == 1) {
    if (fotoAtual >= 0 && fotoAtual <= 10)
      image(introJogo[fotoAtual], 0, 0, width, height);//quando aperta SPACE troca pra proxima img
    else {
      matrizMapa.exibirMatriz();
      acaoNpc();
      player.mostrar();
      story();
      if (key == 'w' || key == 'W') {
        player.andar = 1;
        player.moverPersonagem();
      } else if (key == 'a' || key == 'A') {
        player.andar = 2;
        player.moverPersonagem();
      } else if (key == 's' || key == 'S') {
        player.andar = 3;
        player.moverPersonagem();
      } else if (key == 'd' || key == 'D') {
        player.andar = 4;
        player.moverPersonagem();
      }

      //escrita.escreverMapa(); funcao desativada, era para escrever no mapa observacoes quando trocasse de mapa, mas nao funcionou, arrumar futuramente...
      // rect(player.x,player.y,5,5);
      // println("Pos char x: ",player.x,"y: ",player.y);
      //println("Pos bloco x: ", player.x/32, "y: ", player.y/32, "vel char: ", (player.y+player.velChar)/32);
    }
  } else if (estadoSystem == 2) {//modo batalha ohhhhh
    mostrarBatalha();
  } else if (estadoSystem == 3) {
    if(escolhida  == 0){
      matrizMapa.exibirMatriz();
      Opcoes();
  }
  else{
    image(aulas[slideAtual], 0, 0, width, height);
  }
  }
  else if(estadoSystem == 4){
    if(escolhida  == 0){
      matrizMapa.exibirMatriz();
      Opcoes();
    }
    else{
      matrizMapa.exibirMatriz();
      efeitoLuta();
      /*estadoSystem = 1;
        player.atualizaPos(2, 7);
        npc.acaoAtual = 7;
        player.interacaoPersonagem = 1 ;*/
    }
      
  }
}
void keyPressed() {
  if (estadoSystem == 1) {
    if (key == ' ') {
      // Avança para a próxima imagem
      fotoAtual = (fotoAtual + 1);
      if (fotoAtual == 11 && partHistoria == -1)
        partHistoria = 0;
      if (fotoAtual>11) {
        contador = 0;
        indiceDialogo++;
      }
    } else  if (key == 'e') {
      player.correr();
    }
  } else if (estadoSystem == 2) {
    int opcaoSelecionada = -1;
    if (key == 'a' || key == 'A' || key == CODED && keyCode == LEFT) {
      opcaoSelecionada = 0;
    } else if (key == 'b' || key == 'B' || key == CODED && keyCode == DOWN) {
      opcaoSelecionada = 1;
    } else if (key == 'c' || key == 'C' || key == CODED && keyCode == ENTER) {
      opcaoSelecionada = 2;
    } else if (key == 'd' || key == 'D' || key == CODED && keyCode == UP) {
      opcaoSelecionada = 3;
    } else if (key == 'e' || key == 'E' || key == CODED && keyCode == RIGHT) {
      opcaoSelecionada = 4;
    }

    if (opcaoSelecionada >= 0 && opcaoSelecionada < opcoes.length) {
      verificarResposta(opcoes[opcaoSelecionada]);
    }
  } else if (estadoSystem == 3) {
    // Verifica se a tecla pressionada é 'w' ou 's' e atualiza a opção selecionada
    if (key == 'a' && opcaoSelecionada > 1) {
      opcaoSelecionada--;
    } else if (key == 'd' && opcaoSelecionada < 5) {
      opcaoSelecionada++;
    }
    if (key == ' ' && escolhida == 0) {
      if (opcaoSelecionada != 5) {
        slideAtual = getInicioAulas(opcaoSelecionada);
        escolhida = 1;
      } else {//acao caso  palyer nao queira ver slides de aula
        println("SAIR");
        estadoSystem = 1;
        player.atualizaPos(2, 7);
        npc.acaoAtual = 7;
        player.interacaoPersonagem = 1 ;
      }
    } else if (escolhida == 1  && key == ' ') {
      slideAtual++;
      // Verifica se chegou ao fim das aulas da opção escolhida
      if (slideAtual > getFimAulas(opcaoSelecionada)) {
        // Volta para o início das aulas da opção escolhida
        escolhida = 0;
      }
    }
  }else if (estadoSystem == 4) {
    // Verifica se a tecla pressionada é 'w' ou 's' e atualiza a opção selecionada
    if (key == 'a' && opcaoSelecionada > 1) {
      opcaoSelecionada--;
    } else if (key == 'd' && opcaoSelecionada < 5) {
      opcaoSelecionada++;
    }
    if (key == ' ' && escolhida == 0) {
      if (opcaoSelecionada != 5) {
        
        lutador = frank;
        operador = opcaoSelecionada-1;
        gerarExpressao(operador);//gera primeira expressao para luta de frank
        escolhida = 1;
        partHistoria = 4;//gambiarra, pq quando comeca batalha em algum lugar ta deixando historia como -1;
      } else {//acao caso  palyer nao queira ver slides de aula
        println("SAIR");
        estadoSystem = 1;
        player.atualizaPos(2, 7);
        npc.acaoAtual = 7;
        player.interacaoPersonagem = 1 ;
      }
    } 
  }
}

void keyReleased() {
  if (key == ' ')
    player.andar();
  if (key == 'a' || key == 'A' ||key == 'd' || key == 'D' || key == 's' || key == 'S' || key == 'w' || key == 'W' ) {
    player.andar = 0;
    key = ' ';//precisa "zerar" a variavel key;
  }
}

void mousePressed() {
  //clicar no menu
  if (estadoSystem == 0)
    cliqueOpcao();
}
