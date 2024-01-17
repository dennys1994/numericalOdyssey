int frameAtual = 18;
int tempoEntreQuadros = 100; // ajuste conforme necessário
int ultimoTempo = 0;

PImage personagemPrincipalMove;//carregar imagem do personagem principal para dividir em quadros
PImage[] quadros;//usado para carregar as imgs de movimentacao do personagem


void dividirImagem(int img_largura, int img_altura, int colunas, int linhas) {
  int larguraQuadro = img_largura / colunas;
  int alturaQuadro = img_altura / linhas;
  quadros = new PImage[colunas * linhas];

  for (int i = 0; i < colunas; i++) {
    for (int j = 0; j < linhas; j++) {
      int x = i * larguraQuadro;
      int y = j * alturaQuadro;
      quadros[i + j * 9] = personagemPrincipalMove.get(x, y, larguraQuadro, alturaQuadro);
    }
  }
}
