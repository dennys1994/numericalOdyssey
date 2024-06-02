//240,160


int larguraMapa = 15; // Número de colunas do mapa
int alturaMapa = 10;  // Número de linhas do mapa
int tamCelula = 16;   // Tamanho de cada célula do mapa em pixels
int tamanhoElementoPx = 32;
/*
EscritaMapa escrita = new EscritaMapa(0, 0, "oi", false);

class EscritaMapa {
  float x, y;
  String text;
  Boolean escrever;
  EscritaMapa(int ax, int by, String text, Boolean escrever) {
    this.x=ax;
    this.y=by;
    this.text=text;
    this.escrever=escrever;
  }

  void atualizar(int ax, int by, String text) {
      this.x = ax * tamanhoElementoPx;
      this.y = by * tamanhoElementoPx;
      this.text=text;
  }
  void escreverMapa(){
    if(escrever){
      textAlign(RIGHT,CENTER);
      text("äaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",x,y);
      println("oi2");
    }
    println("oi");
  }
}*/

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
    //escrita.escrever = false;
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

  void mapaCasa() {
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

  void mapaPart4() {//mapa biblioteca
    background = color(192, 232, 64);
    //fill(0);
//escrita.atualizar(8*32+16,4*32-8,"Biblioteca");
    //escrita.escrever = true;
    //consultar os arquivos_grade.pnj para ver quais elementos deseja imprimir
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(1, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "c1004", 1, "c1104", 1, "c1204", 1, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(2, "t0500", 0, "c1000", 1, "c1100", 1, "c1200", 1, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "c1005", 1, "c1105", 1, "c1205", 1, "t0501", 0, "c1300", 1, "c1400", 1, "c1500", 1);
    preencher(3, "t0501", 0, "c1001", 1, "c1101", 1, "c1201", 1, "t0501", 0, "o0204", 5, "t0500", 0, "t0501", 0, "c0302", 1, "c0402", 1, "c0502", 1, "t0501", 0, "c1301", 1, "c1401", 1, "c1501", 1);
    preencher(4, "t0500", 0, "c0303", 1, "c0403", 1, "c0503", 1, "o0304", 0, "o0405", 0, "o0504", 0, "t0500", 0, "c0303", 1, "c0403", 1, "c0503", 1, "t0501", 0, "c0001", 1, "c0101", 1, "c0201", 1);
    preencher(5, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0405", 0, "o0405", 0, "o0405", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0);
    preencher(6, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0306", 0, "o0405", 0, "o0506", 0, "t0501", 0, "v0012", 1, "v0112", 1, "v0212", 1, "v0312", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(7, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "t0501", 0, "t0500", 0, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0501", 0, "v0506", 1, "t0501", 0);
    preencher(8, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "o0204", 0, "t0500", 0, "t0501", 0, "v0014", 1, "v0114", 1, "v0214", 1, "v0314", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(9, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "v0305", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0505", 1);
  }
  void mapaPart4meio() {//mapa biblioteca pos dialogo
    background = color(192, 232, 64);
    //fill(0);
//escrita.atualizar(8*32+16,4*32-8,"Biblioteca");
    //escrita.escrever = true;
    //consultar os arquivos_grade.pnj para ver quais elementos deseja imprimir
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(1, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "c1004", 1, "c1104", 1, "c1204", 1, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(2, "t0500", 0, "c1000", 1, "c1100", 1, "c1200", 1, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "c1005", 1, "c1105", 1, "c1205", 1, "t0501", 0, "c1300", 1, "c1400", 1, "c1500", 1);
    preencher(3, "t0501", 0, "c1001", 1, "c1101", 1, "c1201", 1, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "c0302", 1, "c0402", 1, "c0502", 1, "t0501", 0, "c1301", 1, "c1401", 1, "c1501", 1);
    preencher(4, "t0500", 0, "c0303", 1, "c0403", 1, "c0503", 1, "o0304", 0, "o0405", 0, "o0504", 0, "t0500", 0, "c0303", 1, "c0403", 19, "c0503", 1, "t0501", 0, "c0001", 1, "c0101", 1, "c0201", 1);
    preencher(5, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0405", 0, "o0405", 0, "o0405", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0);
    preencher(6, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0306", 0, "o0405", 0, "o0506", 0, "t0501", 0, "v0012", 1, "v0112", 1, "v0212", 1, "v0312", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(7, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "t0501", 0, "t0500", 0, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0501", 0, "v0506", 1, "t0501", 0);
    preencher(8, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "o0204", 0, "t0500", 0, "t0501", 0, "v0014", 1, "v0114", 1, "v0214", 1, "v0314", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(9, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "v0305", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0505", 1);
  }
  
  void mapaPart5() {//mapa biblioteca principal resto das partes
    background = color(192, 232, 64);
    //escrita.atualizar(8*32+16,4*32-8,"Biblioteca");
//escrita.escrever = true;
    //consultar os arquivos_grade.pnj para ver quais elementos deseja imprimir
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "o0204", 11, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(1, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "c1004", 1, "c1104", 1, "c1204", 1, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(2, "t0500", 0, "c1000", 1, "c1100", 1, "c1200", 1, "t0500", 0, "o0204", 0, "t0501", 0, "t0500", 0, "c1005", 1, "c1105", 1, "c1205", 1, "t0501", 0, "c1300", 1, "c1400", 1, "c1500", 1);
    preencher(3, "t0501", 0, "c1001", 1, "c1101", 1, "c1201", 1, "t0501", 0, "o0204", 0, "t0500", 0, "t0501", 0, "c0302", 1, "c0402", 1, "c0502", 1, "t0501", 0, "c1301", 1, "c1401", 1, "c1501", 1);
    preencher(4, "t0500", 0, "c0303", 1, "c0403", 1, "c0503", 1, "o0304", 0, "o0405", 0, "o0504", 0, "t0500", 0, "c0303", 1, "c0403", 8, "c0503", 1, "t0501", 0, "c0001", 1, "c0101", 1, "c0201", 1);
    preencher(5, "o0403", 9, "o0403", 0, "o0403", 0, "o0403", 0, "o0405", 0, "o0405", 0, "o0405", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 0, "o0403", 10);
    preencher(6, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0306", 0, "o0405", 0, "o0506", 0, "t0501", 0, "v0012", 1, "v0112", 1, "v0212", 1, "v0312", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(7, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "t0501", 0, "t0500", 0, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0501", 0, "v0506", 1, "t0501", 0);
    preencher(8, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "o0204", 0, "t0500", 0, "t0501", 0, "v0014", 1, "v0114", 1, "v0214", 1, "v0314", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(9, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 0, "o0204", 0, "v0305", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0405", 1, "v0505", 1);
  }

  void mapaBiblioteca() {
    background = color(168, 128, 96);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "i0000", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0100", 1, "i0200", 1 );
    preencher(1, "i0001", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0802", 1, "i0201", 1 );
    preencher(2, "i0001", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0803", 1, "i0201", 1 );
    preencher(3, "i0001", 1, "o1401", 1, "i0013", 20, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 21, "i0013", 0, "i0013", 0, "i1505", 0, "i1203", 0, "i1303", 0, "i1505", 0, "i0013", 0, "i0201", 1 );
    preencher(4, "i0001", 1, "i1505", 0, "i0013", 20, "i1505", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i1505", 0, "i1204", 0, "i1304", 0, "i1505", 0, "i0013", 0, "i0201", 1 );
    preencher(5, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(6, "i0001", 1, "i1505", 0, "i0013", 0, "i1505", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(7, "i0001", 1, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0201", 1 );
    preencher(8, "i0001", 1, "i1505", 0, "i0013", 0, "i1505", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0013", 0, "i0801", 1, "i0013", 0, "i0801", 1, "i0013", 0, "i0801", 1, "i0201", 1 );
    preencher(9, "i0002", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i1112", 6, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0102", 1, "i0202", 1 );
  }
  
   void mapaPart6() {//floresta orc
    background = color(192, 232, 64);
   //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "v0012", 1, "v0112", 1, "v0212", 1, "v0112", 1, "v0212", 1, "v0112", 1, "v0212", 1, "v0112", 1, "v0212", 1, "v0112", 1, "v0212", 1, "v0312", 1, "t0501", 0, "t0500", 0, "t0501", 0);
    preencher(1, "v0013", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0500", 0, "t0501", 0, "t0500", 0);
    preencher(2, "v0013", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0501", 0, "t0500", 0, "t0501", 1);
    preencher(3, "v0014", 1, "v0114", 1, "v0214", 1, "v0114", 1, "v0214", 1, "v0114", 1, "v0214", 1, "v0114", 1, "v0214", 1, "v0114", 1, "v0214", 1, "v0314", 1, "t0500", 0, "t0501", 0, "t0500", 1);
    preencher(4, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0500", 0, "t0501", 0, "t0500", 0, "t0501", 1);
    preencher(5, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "t0501", 0, "o0303", 0, "o0403", 0, "o0403", 0, "o0403", 12);
    preencher(6, "v0012", 1, "v0112", 1, "v0212", 1, "v0312", 1, "v0012", 1, "v0112", 1, "v0212", 1, "v0312", 1, "v0012", 1, "v0112", 1, "v0212", 1, "v0312", 1, "t0501", 0, "t0501", 0, "t0501", 0);
    preencher(7, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0501", 0, "t0501", 0, "t0501", 0);
    preencher(8, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "t0501", 0, "t0501", 0, "t0501", 0);
    preencher(9, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0013", 1, "v0113", 1, "v0213", 1, "v0313", 1, "v0000", 1, "v0100", 1, "v0000", 1);
  }
  
  void mapaPart7() {//floresta morta caveira
    background= color(152, 96, 80);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "v1102", 1, "v1202", 1, "t1003", 0, "v1102", 1, "v1202", 1, "t1002", 0, "v1102", 1, "v1202", 1, "t1003", 0, "v1102", 1, "v1202", 1, "t1002", 0, "t1003", 0, "v1201", 0, "t1003", 0);
    preencher(1, "v1103", 1, "v1203", 1, "v1201", 0, "v1103", 1, "v1203", 1, "t1003", 0, "v1103", 1, "v1203", 1, "v1201", 0, "v1103", 1, "v1203", 1, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0);
    preencher(2, "v1201", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "v1201", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0);
    preencher(3, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0);
    preencher(4, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "v1201", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0);
    preencher(5, "o0403", 13, "o0403", 0, "o0503", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0);
    preencher(6, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "v0500", 0, "v0600", 1, "v0700", 1, "t1002", 0, "v0800", 1, "v0900", 1, "v1000", 1);
    preencher(7, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "v0501", 0, "v0601", 1, "v0701", 1, "t1003", 0, "v0801", 1, "v0901", 1, "v1001", 1);
    preencher(8, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1002", 0, "v0602", 1, "v0702", 1, "t1002", 0, "v0802", 1, "v0902", 1, "v1002", 1);
    preencher(9, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "t1002", 0, "t1003", 0, "v0503", 0, "v0603", 1, "v0703", 1, "t1003", 0, "v0803", 1, "v0903", 1, "v1003", 1);
  }
  void mapaPart8(){//deserto minotauro
  background = color(240, 240, 120);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1405", 15, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1205", 1, "t1202", 1);
    preencher(1, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1103", 1);
    preencher(2, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1103", 1);
    preencher(3, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1103", 1);
    preencher(4, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1103", 1);
    preencher(5, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1103", 1);
    preencher(6, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1103", 1);
    preencher(7, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "o0203", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1103", 1);
    preencher(8, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "o0204", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1103", 1);
    preencher(9, "t1504", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "o0204", 14, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1404", 0, "t1103", 1);
  }
  
  
  void mapaPart9(){//neve dragao
     background = color(48, 176, 144);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "d0103", 1, "d0103", 1, "d0404", 1, "t0507", 17, "t0507", 17, "d0304", 1, "d0103", 1, "d0103", 1, "d0103", 1, "d0103", 1, "d0103", 1, "d0103", 1, "d0103", 1, "d0103", 1, "d0103", 1);
    preencher(1, "t0507", 0, "t0507", 0, "t0403", 0, "t0503", 0, "t0503", 0, "t0603", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(2, "t0507", 0, "t0507", 0, "t0404", 0, "t0504", 0, "t0504", 0, "t0604", 0, "t0507", 0, "t0403", 0, "t0603", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(3, "t0507", 0, "t0507", 0, "t0404", 0, "t0504", 0, "t0504", 0, "t0604", 0, "t0507", 0, "t0405", 0, "t0605", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(4, "t0403", 0, "t0603", 0, "t0405", 0, "t0505", 0, "t0505", 0, "t0605", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(5, "t0405", 0, "t0605", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0403", 0, "t0603", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(6, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0403", 0, "t0603", 0, "t0507", 0, "t0405", 0, "t0605", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(7, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0405", 0, "t0605", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(8, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0, "t0507", 0);
    preencher(9, "t1200", 1, "t1200", 1, "t1200", 1, "t1200", 1, "t1200", 1, "t1300", 1, "t0507", 16, "t1100", 1, "t1200", 1, "t1200", 1, "t1200", 1, "t1200", 1, "t1200", 1, "t1200", 1, "t1200", 1);
  }
  
  void mapaPart10(){//castelo rei demonioo
    background = color(48, 176, 144);
    //              0          1          2             3          4            5          6           7           8           9          10          11          12          13          14
    preencher(0, "d0900", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1000", 1, "d1100", 1);
    preencher(1, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(2, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(3, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(4, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(5, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(6, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(7, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(8, "d0901", 1, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1001", 0, "d1101", 1);
    preencher(9, "d0902", 1, "d1002", 1, "d1002", 1, "d0803", 18, "d0803", 18, "d1002", 1, "d1002", 0, "d1002", 1, "d1002", 1, "d1002", 1, "d1002", 1, "d1002", 1, "d1002", 1, "d1002", 1, "d1102", 1);
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
    else {
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
