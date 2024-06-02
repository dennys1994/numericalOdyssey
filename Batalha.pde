//para criar a batalha precisamos arrumar o mapa, acao do npc, acao do mapa
Personagem lutador;
int bloco = 32; // tamanho dos blocos do jogo
int respostaCorreta;
String expressao;
String[] opcoes;
boolean embaralhar = true;
int vidaImg1 = 100; // Vida inicial
int vidaImg2 = 100; // Vida inicial
int tremorImg1 = 11;
int tremorImg2 = 11;
int tremorMagnitude = 20; // Ajuste a intensidade do tremor
boolean gameOver;
boolean vitoria;
int operador = 0;

void mostrarBatalha(){
  background = color(255); // Define o fundo para branco
 if(vidaImg1 > 0 && vidaImg2 > 0){
    exibirLuta();
    exibirConta();
    tremorPersonagens();
  }
  
  if (vidaImg1 <= 0) {
    gameOver = true;
  } else if (vidaImg2 <= 0) {
    vitoria = true;
  }
  // Exibe mensagens de Game Over ou Vitória
  if (gameOver) {
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(255, 0, 0);
    text("Game Over", width / 2, height / 2);
  } else if (vitoria) {
    textAlign(CENTER, CENTER);
    textSize(32);
    fill(0, 255, 0);
    text("Vitória!", width / 2, height / 2);
    partHistoria++;
    estadoSystem = 1;
    vidaImg1 = 100; // Vida inicial
    vidaImg2 = 100; // Vida inicial
    vitoria = false;
    println("ue nao acabou?", partHistoria);
  }
}

void exibirLuta(){
  // Desenha a primeira imagem no canto inferior esquerdo
  image(player.luta, 0, height - bloco*4, bloco*4, bloco*4); // player menor que o adversário
  
  // Desenha a segunda imagem no canto superior direito
  image(lutador.luta, width - bloco*5+16, 0+bloco, bloco*5, bloco*5);

  // Desenha barras de vida
  desenharBarraVida(0 + bloco*2, height - bloco * 4, vidaImg1);
  desenharBarraVida(width - bloco*2, 0+bloco/2, vidaImg2);

  // Bloco de fala NPC
  fill(255);
  rect(width-bloco*9, 0+bloco, bloco*10, bloco*2, 5);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(16);
  text("Vamos ao Calculos Alex!", width-bloco*9, 0+bloco, bloco*10, bloco*2);
}
void exibirConta() {
  // Exibe a expressão matemática no espaço entre img2 e o retângulo
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text(expressao, width - bloco*8, bloco*5, bloco*8, bloco*3);
  
  // Desenha o retângulo com opções de resposta do nosso player
  rectMode(CENTER);
  rect(bloco*9, height - bloco*2, bloco*10, bloco*3, 5);
  
  // Embaralha as opções de resposta
  if(embaralhar){
    embaralharOpcoes();
    embaralhar = false; 
  }
  
  // Exibe as opções de resposta no retângulo
  textAlign(CENTER, CENTER);
  textSize(16);
  fill(255);
  for (int i = 0; i < opcoes.length; i++) {
    text((char)('A' + i) + ": " + opcoes[i], bloco*9, height - bloco*2.5 + (bloco/1.75)*(i-1), bloco*10, bloco);
  }
}

void gerarExpressao(int operador) {
  int num1 = int(random(1, 10));
  int num2 = int(random(1, 10));
  char[] operadores = {'+', '-', '*', '/'};
  
  
  expressao = num1 + " " + operadores[operador] + " " + num2;
  
  // Calcula a resposta correta
  switch (operadores[operador]) {
    case '+':
      respostaCorreta = num1 + num2;
      break;
    case '-':
      respostaCorreta = num1 - num2;
      break;
    case '*':
      respostaCorreta = num1 * num2;
      break;
    case '/': 
      respostaCorreta = num1 / num2;
  }
  
  // Gera opções de resposta incorretas
  opcoes = new String[5];
  opcoes[0] = str(respostaCorreta - 2);
  opcoes[1] = str(respostaCorreta - 1);
  opcoes[2] = str(respostaCorreta);
  opcoes[3] = str(respostaCorreta + 1);
  opcoes[4] = str(respostaCorreta + 2);
}

void embaralharOpcoes() {
  // Embaralha as opções de resposta utilizando o algoritmo de Fisher-Yates
  for (int i = opcoes.length - 1; i > 0; i--) {
    int j = int(random(i + 1));
    String temp = opcoes[i];
    opcoes[i] = opcoes[j];
    opcoes[j] = temp;
  }
}

void verificarResposta(String escolha) {
  if (escolha.equals(str(respostaCorreta))) {
    println("Resposta correta!");
    embaralhar = true;
    // Reduz a vida da imagem 2 se a resposta estiver correta
    vidaImg2 -= 20;
    tremorImg2--;
  } else {
    println("Resposta incorreta. Tente novamente!");
    // Reduz a vida da imagem 1 se a resposta estiver incorreta
    vidaImg1 -= 20;
    tremorImg1--;
  }
  
  // Gera uma nova expressão matemática
  gerarExpressao(operador);
}

void desenharBarraVida(float x, float y, int vida) {
  // Desenha uma barra de vida
  fill(255, 0, 0);
  rect(x, y, vida, bloco / 4, 5);
}

void tremorPersonagens(){
  // Verifica se as imagens precisam tremer
  if (tremorImg1 < 11) {
      if(tremorImg1%2 == 0)
        image(player.luta, 0 + 15, height - bloco*4, bloco*4, bloco*4);
      else
        image(player.luta, 0 - 15, height - bloco*4, bloco*4, bloco*4);
    if(tremorImg1 == 0)
      tremorImg1 = 11;
    else
      tremorImg1--;
    }
    if (tremorImg2 < 11) {
      if(tremorImg2%2 == 0)
        image(lutador.luta, width - bloco*5 + 30, 0+bloco, bloco*5, bloco*5);
      else
        image(lutador.luta, width - bloco*5 - 15, 0+bloco, bloco*5, bloco*5);
    if(tremorImg2 == 0)
      tremorImg2 = 11;
    else
      tremorImg2--;
    }
}
