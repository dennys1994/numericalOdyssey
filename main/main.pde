
int estadoSystem = 0;//estado 0 = menu ; estado 1 = jogando
int partHistoria = 0;//para sabermos em qual parte da historia esta
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
  //carrega elementos do mapa
  carregarImgElementos();
  //cria o mapa
  matrizMapa.mapaPart1();
  //cria a primeira expressao matematica
  gerarExpressao();
  //
  tempoInicio = millis();
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
      //escrita.escreverMapa(); funcao desativada, era para escrever no mapa observacoes quando trocasse de mapa, mas nao funcionou, arrumar futuramente...
      // rect(player.x,player.y,5,5);
      // println("Pos char x: ",player.x,"y: ",player.y);
      //println("Pos bloco x: ", player.x/32, "y: ", player.y/32, "vel char: ", (player.y+player.velChar)/32);
    }
  } else if (estadoSystem == 2) {//modo batalha ohhhhh
    mostrarBatalha();
  }
}
void keyPressed() {
  if (estadoSystem == 1) {
    player.moverPersonagem();
    if (key == ' ') {
      // Avança para a próxima imagem
      fotoAtual = (fotoAtual + 1);
      if (fotoAtual>11) {
        contador = 0;
        indiceDialogo++;
      }
    }
    if (key == 'e') {
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
  }
}

void keyReleased() {
  if (key == ' ')
    player.andar();
}

void mousePressed() {
  //clicar no menu
  if (estadoSystem == 0)
    cliqueOpcao();
}
