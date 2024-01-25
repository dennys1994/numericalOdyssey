//para criar a batalha precisamos arrumar o mapa, acao do npc, acao do mapa
Personagem lutador;

void mostrarBatalha(){
  background = color(255); // Define o fundo para branco
  // Desenha a primeira imagem no canto inferior esquerdo
  image(player.luta, 0, height - tamanhoElementoPx*4, tamanhoElementoPx*4, tamanhoElementoPx*4);
  
  // Desenha a segunda imagem no canto superior direito
  image(lutador.luta, width - tamanhoElementoPx*5, 0, tamanhoElementoPx*5, tamanhoElementoPx*5);
}
