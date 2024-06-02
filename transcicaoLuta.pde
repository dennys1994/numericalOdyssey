int blockSize = 32;
int rows, cols;
boolean lutaIniciada = false;
int blocoAtual = 0;

void efeitoLuta() {
  cols = (width / blockSize)+1;
  rows = height / blockSize;
  if (!lutaIniciada) {
    // Desenha um bloco por frame até preencher toda a tela
    for (int i = 0; i < blocoAtual; i++) {
      int y = i / cols;
      int x = i % cols;
      fill(0);
      rect(x * blockSize, y * blockSize, blockSize, blockSize);
    }

    // Incrementa o bloco atual
    blocoAtual++;

    // Verifica se todos os blocos foram desenhados
    if (blocoAtual >= cols * rows) {
      lutaIniciada = true;
      // Adicione aqui a lógica para a próxima etapa da luta ou qualquer ação desejada
      println("Início da luta!");
      estadoSystem = 2;
      blocoAtual = 0;
      lutaIniciada = false;
    }
  }
}
