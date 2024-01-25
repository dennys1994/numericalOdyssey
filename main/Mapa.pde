//240,160


int larguraMapa = 15; // Número de colunas do mapa
int alturaMapa = 10;  // Número de linhas do mapa
int tamCelula = 16;   // Tamanho de cada célula do mapa em pixels
int tamanhoElementoPx = 32;

Mapa matrizMapa = new Mapa(new PImage[15][10], new String[15][10], new int[15][10]);

class Mapa {
  PImage[][] matrizMapa;//guardara os elementos do mapa
  String[][] matrizCodMapa;//guardara os cod dos elementos do mapa, usaremos para determinar se o personagem pode interagir, colidir ou pode sobreescrever a imagem ou profundidade(um portal o personagem teria que passar por "baixo")
  int[][] matrizCodColisao;// 0 nao tem colisao e o personagem sobrepoe, 1 tem colisao, 2 nao tem colisao o personagem passa por baixo, ... falta cod para acoes
  int colisaoXmin, colisaoXmax;
  int colisaoYmin, colisaoYmax;
  Mapa(PImage [][] matrizMapa, String[][] matrizCodMapa, int[][]matrizCodColisao) {
    this.matrizMapa = matrizMapa;
    this.matrizCodMapa = matrizCodMapa;
    this.matrizCodColisao = matrizCodColisao;
  }


  void mapaPart1() {
    background = color(192, 232, 64);
    // Crie a matriz de 16x10
    //matrizMapa = new PImage[15][10];
    //codigo de imagem sao primeira letra a tipo de elemento: v = vegetacao, c = casa, d = caverna, i = interiorCasa, o = objetos, t = terreno
    // Col x00xx esses 2 numeros representam a coluna que sera representada
    //Lin xxx00 esses 2 numeros a linha que sera representa
    //consultar os arquivos_grade.pnj para ver quais elementos deseja imprimir
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14         
    preencher(0, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "o0000", 1, "o0204", 0, "o0000", 1, "v0406", 1, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "t0406", 0);
    preencher(1, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(2, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "c1000", 1, "c1100", 1, "c1200", 1);
    preencher(3, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "c1001", 1, "c1101", 1, "c1201", 1);
    preencher(4, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "c0000", 1, "c0100", 1, "c0200", 1);
    preencher(5, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0006", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0405", 4, "o0405", 0, "o0505", 0);
    preencher(6, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0501", 0, "o0306", 0, "o0406", 0, "o0506", 0);
    preencher(7, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "v0000", 0);
    preencher(8, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "v0001", 0);
    preencher(9, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0);
  }
   void mapaPart2() {
     background = color(192, 232, 64);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14         
    preencher(0, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "o0000", 1, "o0204", 0, "o0000", 1, "v0406", 1, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "t0406", 0);
    preencher(1, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(2, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "c1000", 1, "c1100", 1, "c1200", 1);
    preencher(3, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "c1001", 1, "c1101", 1, "c1201", 1);
    preencher(4, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "c0000", 1, "c0100", 2, "c0200", 1);
    preencher(5, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0006", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0405", 0, "o0405", 0, "o0505", 0);
    preencher(6, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0501", 0, "o0306", 0, "o0406", 0, "o0506", 0);
    preencher(7, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "v0000", 0);
    preencher(8, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "v0001", 0);
    preencher(9, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0);
  } 
   void mapaPart3() {
     background = color(192, 232, 64);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14         
    preencher(0, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "o0000", 1, "o0204", 6, "o0000", 1, "v0406", 1, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "v0406", 1, "v0506", 1, "t0406", 0);
    preencher(1, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(2, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "c1000", 1, "c1100", 1, "c1200", 1);
    preencher(3, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "c1001", 1, "c1101", 1, "c1201", 1);
    preencher(4, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "c0000", 1, "c0100", 2, "c0200", 1);
    preencher(5, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0006", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0405", 0, "o0405", 0, "o0505", 0);
    preencher(6, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0501", 0, "o0306", 0, "o0406", 0, "o0506", 0);
    preencher(7, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "v0000", 0);
    preencher(8, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "v0001", 0);
    preencher(9, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0, "v0000", 0, "v0100", 0);
  }         
    
  void mapaCasa(){
    background = color(168, 128, 96);
     //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "i0000", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0502", 1, "i0802", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0200", 1 );
    preencher(1, "i0001", 1, "i1400", 1, "i1500", 1, "i0901", 1, "i0013", 0, "i0013", 0, "i0803", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(2, "i0001", 1, "i1401", 1, "i1501", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(3, "i0001", 1, "i1402", 1, "i1502", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i1203", 1, "i1303", 1, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(4, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i1204", 1, "i1304", 1, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(5, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(6, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(7, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(8, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(9, "i0002", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i1112", 3, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0202", 1 );
  }
  
  void mapaPart4() {
     background = color(192, 232, 64);
    //consultar os arquivos_grade.pnj para ver quais elementos deseja imprimir
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14         
    preencher(0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(1, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(2, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(3, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 5, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(4, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(5, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(6, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(7, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(8, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(9, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 7, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
  }  
  void mapaPart5() {
     background = color(192, 232, 64);
    //consultar os arquivos_grade.pnj para ver quais elementos deseja imprimir
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14         
    preencher(0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(1, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(2, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(3, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(4, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(5, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(6, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(7, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(8, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(9, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "o0204", 7, "t0501", 0, "t0500", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0);
  } 
  
  PImage buscarElemento(String codElemento) {
    char tipoElemento = codElemento.charAt(0);
    int x = Integer.parseInt(codElemento.substring(1, 3));
    int y = Integer.parseInt(codElemento.substring(3, 5));
    if (tipoElemento == 'v')
      return vegetacao[x][y];
    else if (tipoElemento == 'c')
      return casas[x][y];
    else if (tipoElemento == 'd')
      return caverna[x][y];
    else if (tipoElemento == 'i')
      return interiorCasa[x][y];
    else if (tipoElemento == 'o')
      return objetos[x][y];
    else if (tipoElemento == 't')
      return terreno[x][y];
    else{
      println("oi");
      return loadImage("error.png");
    }
  }

  void preencher(int linha, String elemento0, int codColisao0, String elemento1, int codColisao1, String elemento2, int codColisao2, String elemento3, int codColisao3,
                            String elemento4, int codColisao4, String elemento5, int codColisao5, String elemento6, int codColisao6, String elemento7, int codColisao7, String elemento8, int codColisao8,
                            String elemento9, int codColisao9, String elemento10, int codColisao10, String elemento11, int codColisao11, String elemento12, int codColisao12, String elemento13, int codColisao13,
                            String elemento14, int codColisao14) {

    this.matrizMapa[0][linha] = buscarElemento(elemento0);
    this.matrizMapa[1][linha] = buscarElemento(elemento1);
    this.matrizMapa[2][linha] = buscarElemento(elemento2);
    this.matrizMapa[3][linha] = buscarElemento(elemento3);
    this.matrizMapa[4][linha] = buscarElemento(elemento4);
    this.matrizMapa[5][linha] = buscarElemento(elemento5);
    this.matrizMapa[6][linha] = buscarElemento(elemento6);
    this.matrizMapa[7][linha] = buscarElemento(elemento7);
    this.matrizMapa[8][linha] = buscarElemento(elemento8);
    this.matrizMapa[9][linha] = buscarElemento(elemento9);
    this.matrizMapa[10][linha] = buscarElemento(elemento10);
    this.matrizMapa[11][linha] = buscarElemento(elemento11);
    this.matrizMapa[12][linha] = buscarElemento(elemento12);
    this.matrizMapa[13][linha] = buscarElemento(elemento13);
    this.matrizMapa[14][linha] = buscarElemento(elemento14);

   this.matrizCodColisao[0][linha] = codColisao0;
    this.matrizCodColisao[1][linha] = codColisao1;
    this.matrizCodColisao[2][linha] = codColisao2;
    this.matrizCodColisao[3][linha] = codColisao3;
    this.matrizCodColisao[4][linha] = codColisao4;
    this.matrizCodColisao[5][linha] = codColisao5;
    this.matrizCodColisao[6][linha] = codColisao6;
    this.matrizCodColisao[7][linha] = codColisao7;
    this.matrizCodColisao[8][linha] = codColisao8;
    this.matrizCodColisao[9][linha] = codColisao9;
    this.matrizCodColisao[10][linha] = codColisao10;
    this.matrizCodColisao[11][linha] = codColisao11;
    this.matrizCodColisao[12][linha] = codColisao12;
    this.matrizCodColisao[13][linha] = codColisao13;
    this.matrizCodColisao[14][linha] = codColisao14;
    for (int i = 0; i < 15; i++) {
      // Use i para mudar de elemento0 para elemento1, elemento2, etc.
      this.matrizCodMapa[i][linha] = "elemento" + i;
      //matrizMapa.matrizCodColisao[i][linha] = "codColisao" + i;da erro de mismatch
    }
  }

  void exibirMatriz() {
    // Exibe os elementos na tela
    for (int i = 0; i < this.matrizMapa.length; i++) {
      for (int j = 0; j < this.matrizMapa[i].length; j++) {
        int x = i * tamanhoElementoPx;  // Ajuste conforme necessário
        int y = j * tamanhoElementoPx;  // Ajuste conforme necessário
        image(this.matrizMapa[i][j], x, y, tamanhoElementoPx, tamanhoElementoPx);
      }
    }
  }
}




//elementos Mapa
PImage[][] caverna, casas, interiorCasa, objetos, terreno, vegetacao, aux;

void carregarImgElementos() {//Carrega as imagens dos elementos do mapa
  caverna = carregarElemento("Dungeon", 16, 16);
  casas = carregarElemento("Houses", 16, 16);
  interiorCasa = carregarElemento("inside", 16, 16);
  objetos = carregarElemento("Objects", 16, 16);
  terreno = carregarElemento("Terrian", 16, 16);
  vegetacao = carregarElemento("vegetation", 16, 16);
}

PImage[][] carregarElemento(String nomeElemento, int colunas, int linhas) {
  PImage[][] elemento = new PImage[colunas][linhas];
  PImage elementoPrincipal = loadImage(nomeElemento + ".png");

  elemento = dividirImagem(elementoPrincipal);

  return elemento;
}

PImage[][] dividirImagem(PImage img) {
  PImage[][] quadros = new PImage[16][16];//img 16x16px

  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 16; j++) {
      int x = i * 16;
      int y = j * 16;
      quadros[i][j] = img.get(x, y, 16, 16);
    }
  }

  return quadros;
}
