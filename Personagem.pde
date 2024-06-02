//Pagina com todas as funções relacionado a personagem principal ou npc
Personagem player;

void criarPersonagem() {
  player = new Personagem(4, 9, 8, 7, loadImage("data/char_move.png"), loadImage("data/personagens/alex1.png"));
  player.dividirFlames(578, 256, 9, 4);//dimesao da img  e tamanho da matriz
}

class Personagem {
  PImage[] quadros;//frames do personagem
  PImage luta;
  PImage splite;//imagem com todos os frames
  int x, y;
  //int larguraQuadro, alturaQuadro;
  int frameAtual = 22;//flame que ira comecar o personagem
  int velChar = 3;
  int interacaoPersonagem = 1;//se ele pode se mover
  int andar = 0; //1 cima 2 baixo 3 direita 4 esquerda
  int acaoAtual = 0;//para quando tiver uma acao especial
  Personagem(int linhas, int colunas, int x, int y, PImage splite, PImage luta) {
    this.quadros = new PImage[linhas*colunas];
    this.x = x*tamanhoElementoPx-tamanhoElementoPx/2;
    this.y = y*tamanhoElementoPx+tamanhoElementoPx/2;
    //this.larguraQuadro = colunas;
    //this.alturaQuadro = linhas;
    this.splite = splite;
    this.luta = luta;
  }

  void mostrar() {//Funcao que mostra o personagem na pos x,y
    image(quadros[frameAtual], x-32, y-48);
  }
  void atualizaPos(int x, int y) {//funcao que atualiza posicao do personagem
    this.x = x*32-16;
    this.y = y*32+16;
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

  void moverPersonagem() {
    int UP_START_FRAME = 0;
    int LEFT_START_FRAME = 9;
    int DOWN_START_FRAME = 18;
    int RIGHT_START_FRAME = 27;
    int FRAME_RANGE = 8;
    if (this.interacaoPersonagem == 1) {
      if (/*key == 'w' || key == 'W' ||*/ andar == 1) {
        if (this.frameAtual < UP_START_FRAME || this.frameAtual > UP_START_FRAME + FRAME_RANGE)
          this.frameAtual = UP_START_FRAME; // Define o quadro de movimento para cima
        else if (this.frameAtual >= UP_START_FRAME && this.frameAtual <= UP_START_FRAME + FRAME_RANGE) {
          this.frameAtual++;
          if (this.frameAtual > UP_START_FRAME + FRAME_RANGE)
            this.frameAtual = UP_START_FRAME;
        }
        if (this.y-velChar>0)//lembrando que 30px é o tamnho do personagem
        {
          if (x/32<15)
            if (matrizMapa.matrizCodColisao[x/32][((y-velChar)/32)] == 0)//devido ao personagem pro lado
              this.y-=velChar;
            else
              acaoEspecial(x/32, (y-velChar)/32);
        } else
          this.y = 0;
      } else if (/*key == 'a' || key == 'A' ||*/  andar == 2) {
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
          else
            acaoEspecial((x-velChar)/32, y/32);
        } else
          this.x = 0;
      } else if (/*key == 's' || key == 'S' ||*/  andar == 3) {
        if (this.frameAtual < DOWN_START_FRAME || this.frameAtual > DOWN_START_FRAME + FRAME_RANGE)
          this.frameAtual = DOWN_START_FRAME; // Define o quadro de movimento para baixo
        else if (player.frameAtual >= DOWN_START_FRAME && this.frameAtual <= DOWN_START_FRAME + FRAME_RANGE) {
          this.frameAtual++;
          if (this.frameAtual > DOWN_START_FRAME + FRAME_RANGE)
            this.frameAtual = DOWN_START_FRAME;
        }
        if (this.y+velChar<295) {//
          if ((y+velChar)/32 < 10) {
            if (x/32 <15)
              if (matrizMapa.matrizCodColisao[x/32][((y+velChar)/32)] == 0)
                this.y+=velChar;// Ajusta a posição para baixo
              else
                acaoEspecial(x/32, ((y+velChar))/32);
          }
        } else
          this.y = 295;
      } else if (/*key == 'd' || key == 'D' ||*/  andar == 4) {
        if (this.frameAtual < RIGHT_START_FRAME || this.frameAtual > RIGHT_START_FRAME + FRAME_RANGE)
          this.frameAtual = RIGHT_START_FRAME; // Define o quadro de movimento para a direita
        else if (this.frameAtual >= RIGHT_START_FRAME && this.frameAtual <= RIGHT_START_FRAME + FRAME_RANGE) {
          this.frameAtual++;
          if (this.frameAtual > RIGHT_START_FRAME + FRAME_RANGE)
            this.frameAtual = RIGHT_START_FRAME;
        }
        if (this.x+velChar<450)//lembrando que 30px é o tamnho do personagem
        {
          if ((x+velChar)/32< 15)
            if (matrizMapa.matrizCodColisao[(x+velChar)/32][y/32] == 0)
              this.x+=velChar;
            else
              acaoEspecial((x+velChar)/32, y/32);
        } else
          this.x = 450;
      }
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
