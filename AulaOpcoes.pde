int block = 32; // Ajuste o tamanho do bloco conforme necessário
int opcaoSelecionada = 1; // Variável para armazenar a opção selecionada
int escolhida = 0;
int slideAtual = 0;
String[] opcoesAula ={
 "SOMA",
 "SUBTRAÇÃO",
 "MULTIPLICAÇÃO",
 "DIVISÃO",
 "SAIR"
};
void Opcoes() {


  rectMode(CENTER); // Defina o modo de retângulo como CENTER
  fill(255);
  rect(block*7.5, block*8.5, 14*block, 2*block, 5);
  
  textSize(15);
  textAlign(CENTER, CENTER);
  fill(0);
  
  // Desenha as quatro opções
  for (int i = 1; i <= 5; i++) {
    if (i == opcaoSelecionada) {
      fill(0, 0, 255); // Cor azul para a opção selecionada
    } else {
      fill(0); // Cor preta para as outras opções
    }
   // text(opcoes[i-1], block*2 + (i-1)*3*block, block*8.5);
   float x = i * 3 * block - 1.5*block; // Ajuste o valor multiplicador para alterar o espaçamento
    text(opcoesAula[i - 1], x, block * 8.5);
  
  }
}

PImage[] aulas = new PImage[24];

void carregaAulas(){
  // Carrega as imagens no vetor
  for (int i = 0; i < 24; i++) {
    String nomeArquivo = "data/aulas/aula" + i + ".png";
    aulas[i] = loadImage(nomeArquivo);
  }
}
//soma aula 1 ate 5 subtracao aula 6 ate 10, multiplicacao aula11 ate 16,divisao  aula 17 ate 23


int getInicioAulas(int opcao) {
  // Retorna o índice inicial das aulas para a opção escolhida
  if (opcao == 1) {
    return 0;
  } else if (opcao == 2) {
    return 6;
  } else if (opcao == 3) {
    return 11;
  } else if (opcao == 4) {
    return 17;
  } else {
    return 1; // Valor padrão para opção inválida
  }
}

int getFimAulas(int opcao) {
  // Retorna o índice final das aulas para a opção escolhida
  if (opcao == 1) {
    return 5;
  } else if (opcao == 2) {
    return 10;
  } else if (opcao == 3) {
    return 16;
  } else if (opcao == 4) {
    return 23;
  } else {
    return 1; // Valor padrão para opção inválida
  }
}
