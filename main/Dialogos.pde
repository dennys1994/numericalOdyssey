int dialogo = 0;
float velocidadeDigitacao = 0.5;
int comprimentoAtual = 1;
int contador = 0;
int indiceDialogo = 0;

void criarDialogo(String[] texto, int linhas, Personagem npcAct){
  if(dialogo != 0){
    fill(255);
    rect(240,272,14*32,2*32,5);
    if(indiceDialogo == linhas){
      indiceDialogo = 0;
      contador = 0;
      dialogo = 0;
      matrizMapa.mapaPart2();
      player.interacaoPersonagem = 1;
      npcAct.acaoAtual = 1;
    }
    else
      mostrarTexto(texto[indiceDialogo]);
  }
}

void mostrarTexto(String texto) {
  int comprimentoMaximo = texto.length(); // Adiciona texto dentro do retângulo
  fill(0); // Define a cor do texto para preto

  // Calcula a quantidade de caracteres a serem exibidos com base no contador
  int caracteresExibidos = min(int(contador * velocidadeDigitacao), comprimentoMaximo);

  // Obtém a substring do texto com base na quantidade de caracteres a serem exibidos
  String textoParcial = texto.substring(0, caracteresExibidos);

  text(textoParcial, 240, 272); // Define o texto e a posição

  // Atualiza o comprimento atual continuamente
  comprimentoAtual = caracteresExibidos;

  // Verifica se todos os caracteres foram exibidos
  if (caracteresExibidos >= comprimentoMaximo && contador >= comprimentoMaximo / velocidadeDigitacao) {
    // Se sim, você pode adicionar lógica adicional aqui, se necessário
  }

  // Incrementa o contador
  contador++;
}
