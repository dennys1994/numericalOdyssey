//Pagina com todas as funções relacionado a personagem principal ou npc
Personagem player;

void criarPersonagem() {
  //player = new Personagem(4, 9, tamanhoElementoPx*13-12, tamanhoElementoPx*4-12, loadImage("data/char_move.png"));
  player = new Personagem(4, 9, 0, 0, loadImage("data/char_move.png"));
  player.dividirFlames(578, 256, 9, 4);//dimesao da img  e tamanho da matriz
}

class Personagem {
  PImage[] quadros;//frames do personagem
  PImage splite;//imagem com todos os frames
  int x, y;
  //int larguraQuadro, alturaQuadro;
  int frameAtual = 22;//flame que ira comecar o personagem
  int velChar = 3;
  Personagem(int linhas, int colunas, int x, int y, PImage splite) {
    this.quadros = new PImage[linhas*colunas];
    this.x = x;
    this.y = y;
    //this.larguraQuadro = colunas;
    //this.alturaQuadro = linhas;
    this.splite = splite;
  }

  void mostrar() {//Funcao que mostra o personagem na pos x,y
    image(quadros[frameAtual], x-32, y-48);
  }
  void atualizarPos(int x, int y) {//funcao que atualiza posicao do personagem
    this.x = x;
    this.y = y;
  }

  void atualizarFrame(int x) {//funcao para mudar o frame do personagem, usaremos quando mudar de mapa pra terminar se o personagem sera criado de costa ou de frente etc
    this.frameAtual = x;
  }

  void correr() {
    this.velChar=8;
  }
  void andar() {
    this.velChar=3;
  }

  void moverPersonagemPrincipal() {
    int UP_START_FRAME = 0;
    int LEFT_START_FRAME = 9;
    int DOWN_START_FRAME = 18;
    int RIGHT_START_FRAME = 27;
    int FRAME_RANGE = 8;

    if (key == 'w' || key == 'W') {
      if (this.frameAtual < UP_START_FRAME || this.frameAtual > UP_START_FRAME + FRAME_RANGE)
        this.frameAtual = UP_START_FRAME; // Define o quadro de movimento para cima
      else if (this.frameAtual >= UP_START_FRAME && this.frameAtual <= UP_START_FRAME + FRAME_RANGE) {
        this.frameAtual++;
        if (this.frameAtual > UP_START_FRAME + FRAME_RANGE)
          this.frameAtual = UP_START_FRAME;
      }
      if (this.y-velChar>0)//lembrando que 30px é o tamnho do personagem
      {
        if(x/32<15)
          if (matrizMapa.matrizCodColisao[x/32][((y-velChar)/32)] == 0)//devido ao personagem pro lado
            this.y-=velChar;
          else if(matrizMapa.matrizCodColisao[x/32][((y-velChar)/32)] == 2)
            matrizMapa.mudarMapa();
      } 
      else
        this.y = 0;
    } else if (key == 'a' || key == 'A') {
      if (this.frameAtual < LEFT_START_FRAME || this.frameAtual > LEFT_START_FRAME + FRAME_RANGE)
        this.frameAtual = LEFT_START_FRAME; // Define o quadro de movimento para a esquerda
      else if (this.frameAtual >= LEFT_START_FRAME && this.frameAtual <= LEFT_START_FRAME + FRAME_RANGE) {
        this.frameAtual++;
        if (this.frameAtual > LEFT_START_FRAME + FRAME_RANGE)
          this.frameAtual = LEFT_START_FRAME;
      }
      if (this.x-velChar>0)//lembrando que 30px é o tamnho do personagem
      {
        if (matrizMapa.matrizCodColisao[(x-velChar)/32][y/32] == 0)
          this.x-=velChar;
      } else
        this.x = 0;
    } else if (key == 's' || key == 'S') {
      if (this.frameAtual < DOWN_START_FRAME || this.frameAtual > DOWN_START_FRAME + FRAME_RANGE)
        this.frameAtual = DOWN_START_FRAME; // Define o quadro de movimento para baixo
      else if (player.frameAtual >= DOWN_START_FRAME && this.frameAtual <= DOWN_START_FRAME + FRAME_RANGE) {
        this.frameAtual++;
        if (this.frameAtual > DOWN_START_FRAME + FRAME_RANGE)
          this.frameAtual = DOWN_START_FRAME;
      }
      if (this.y+velChar<295){//
        if((y+velChar)/32+1 < 10){
          if(x/32 <15)
            if (matrizMapa.matrizCodColisao[x/32][((y+velChar)/32)] == 0)
              this.y+=velChar;// Ajusta a posição para baixo
            else if (matrizMapa.matrizCodColisao[x/32][((y+velChar)/32)] == 3)
              matrizMapa.criarMapa();
        }
      }
        else
          this.y = 295;
    } else if (key == 'd' || key == 'D') {
      if (this.frameAtual < RIGHT_START_FRAME || this.frameAtual > RIGHT_START_FRAME + FRAME_RANGE)
        this.frameAtual = RIGHT_START_FRAME; // Define o quadro de movimento para a direita
      else if (this.frameAtual >= RIGHT_START_FRAME && this.frameAtual <= RIGHT_START_FRAME + FRAME_RANGE) {
        this.frameAtual++;
        if (this.frameAtual > RIGHT_START_FRAME + FRAME_RANGE)
          this.frameAtual = RIGHT_START_FRAME;
      }
      if (this.x+velChar<450)//lembrando que 30px é o tamnho do personagem
      {
        if((x+velChar)/32< 15) 
          if (matrizMapa.matrizCodColisao[(x+velChar)/32][y/32] == 0)
            this.x+=velChar;
      } else
        this.x = 450;
    }
  }
  void dividirFlames(int img_largura, int img_altura, int colunas, int linhas) {
    int larguraQuadro = img_largura / colunas;
    int alturaQuadro = img_altura / linhas;
    this.quadros = new PImage[colunas * linhas];

    for (int i = 0; i < colunas; i++) {
      for (int j = 0; j < linhas; j++) {
        int x = i * larguraQuadro;
        int y = j * alturaQuadro;
        this.quadros[i + j * 9] = this.splite.get(x, y, larguraQuadro, alturaQuadro);
      }
    }
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
 
 }
 
 void moverPersonagemPrincipal() {
 int UP_START_FRAME = 0;
 int LEFT_START_FRAME = 9;
 int DOWN_START_FRAME = 18;
 int RIGHT_START_FRAME = 27;
 int FRAME_RANGE = 8;
 
 if (key == 'w' || key == 'W') {
 if (player.frameAtual < UP_START_FRAME || player.frameAtual > UP_START_FRAME + FRAME_RANGE)
 this.frameAtual = UP_START_FRAME; // Define o quadro de movimento para cima
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
 */
