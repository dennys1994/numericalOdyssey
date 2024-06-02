Boolean viewCapa = true; 

void mostrarCapa() {
  // Exibe a imagem por 3 segundos
  PImage minhaImagem = loadImage("capa/capa.png");
  image(minhaImagem, 0, 0,width,height);
  //delay(3000);  // Aguarda 3 segundos
  //background(255);  // Limpa a tela após 3 segundos
  viewCapa = false;
  
}

void mostrarTitulo(){
  // Exibe o título do jogo
    fill(255);
    PFont fonte = createFont("font/AncientModern.ttf", 32/2);
    textFont(fonte);
    textAlign(CENTER, CENTER);
    textSize(25);
    text("Odisseia Numérica\n Uma Aventura Além da Matemática\n\n", width / 2, 80);
}
