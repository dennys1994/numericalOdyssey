//Pagina com todas as funções relacionado a personagem principal ou npc

class Personagem {
  PImage[] quadros;
  float x, y;
  int larguraQuadro, alturaQuadro;
  int frameAtual = 0;
  
  Personagem(PImage[] quadros, float x, float y) {
    this.quadros = quadros;
    this.x = x;
    this.y = y;
    this.larguraQuadro = quadros[0].width;
    this.alturaQuadro = quadros[0].height;
  }
  
  void mostrar() {
    image(quadros[frameAtual], x, y);
  }
}

/*void moverPersonagemPrincipal(){//funcao com a logica de mudanca de frame do personagem principal e movimentancao do mesmo
  if (key == 'w' || key == 'W') {
    if(player.frameAtual < 0 || player.frameAtual > 8)
      player.frameAtual = 0; // Define o quadro de movimento para cima
    else if(player.frameAtual >=0 && player.frameAtual <=8){
      player.frameAtual++;
      if(frameAtual>8)
        player.frameAtual=0;
    }
    player.y -= 5; // Ajusta a posição para cima
  } else if (key == 'a' || key == 'A') {
    if(player.frameAtual < 9 || player.frameAtual > 17)
      player.frameAtual = 9; // Define o quadro de movimento para a esquerda
    else if(player.frameAtual >=9 && player.frameAtual <=17){
      player.frameAtual++;
      if(player.frameAtual>17)
        player.frameAtual=9;
    }
    player.x -= 5; // Ajusta a posição para a esquerda
  } else if (key == 's' || key == 'S') {
    if(player.frameAtual < 18 || player.frameAtual > 26)
      player.frameAtual = 18; // Define o quadro de movimento para baixo
    else if(player.frameAtual >=18 && player.frameAtual <=26){
      player.frameAtual++;
      if(player.frameAtual>26)
        player.frameAtual=18;
    }
    player.y += 5; // Ajusta a posição para baixo
  } else if (key == 'd' || key == 'D') {
    if(player.frameAtual < 27)
      player.frameAtual = 27; // Define o quadro de movimento para a direita
    else if(player.frameAtual >=27 && player.frameAtual <=35){
      player.frameAtual++;
      if(player.frameAtual>35)
        player.frameAtual=28;
    }
    player.x += 5; // Ajusta a posição para a direita
  }

}*/



void moverPersonagemPrincipal() {
   int UP_START_FRAME = 0;
   int LEFT_START_FRAME = 9;
   int DOWN_START_FRAME = 18;
   int RIGHT_START_FRAME = 27;
   int FRAME_RANGE = 8;

  if (key == 'w' || key == 'W') {
    if (player.frameAtual < UP_START_FRAME || player.frameAtual > UP_START_FRAME + FRAME_RANGE)
      player.frameAtual = UP_START_FRAME; // Define o quadro de movimento para cima
    else if (player.frameAtual >= UP_START_FRAME && player.frameAtual <= UP_START_FRAME + FRAME_RANGE) {
      player.frameAtual++;
      if (player.frameAtual > UP_START_FRAME + FRAME_RANGE)
        player.frameAtual = UP_START_FRAME;
    }
    player.y -= 5; // Ajusta a posição para cima
  } else if (key == 'a' || key == 'A') {
    if (player.frameAtual < LEFT_START_FRAME || player.frameAtual > LEFT_START_FRAME + FRAME_RANGE)
      player.frameAtual = LEFT_START_FRAME; // Define o quadro de movimento para a esquerda
    else if (player.frameAtual >= LEFT_START_FRAME && player.frameAtual <= LEFT_START_FRAME + FRAME_RANGE) {
      player.frameAtual++;
      if (player.frameAtual > LEFT_START_FRAME + FRAME_RANGE)
        player.frameAtual = LEFT_START_FRAME;
    }
    player.x -= 5; // Ajusta a posição para a esquerda
  } else if (key == 's' || key == 'S') {
    if (player.frameAtual < DOWN_START_FRAME || player.frameAtual > DOWN_START_FRAME + FRAME_RANGE)
      player.frameAtual = DOWN_START_FRAME; // Define o quadro de movimento para baixo
    else if (player.frameAtual >= DOWN_START_FRAME && player.frameAtual <= DOWN_START_FRAME + FRAME_RANGE) {
      player.frameAtual++;
      if (player.frameAtual > DOWN_START_FRAME + FRAME_RANGE)
        player.frameAtual = DOWN_START_FRAME;
    }
    player.y += 5; // Ajusta a posição para baixo
  } else if (key == 'd' || key == 'D') {
    if (player.frameAtual < RIGHT_START_FRAME || player.frameAtual > RIGHT_START_FRAME + FRAME_RANGE)
      player.frameAtual = RIGHT_START_FRAME; // Define o quadro de movimento para a direita
    else if (player.frameAtual >= RIGHT_START_FRAME && player.frameAtual <= RIGHT_START_FRAME + FRAME_RANGE) {
      player.frameAtual++;
      if (player.frameAtual > RIGHT_START_FRAME + FRAME_RANGE)
        player.frameAtual = RIGHT_START_FRAME;
    }
    player.x += 5; // Ajusta a posição para a direita
  }
}
