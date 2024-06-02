class MenuOption {
  String label;
  float x, y, w, h;
  boolean selected;

  MenuOption(String label, float x, float y, float w, float h) {
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.selected = false;
  }

  void display() {
    textAlign(CENTER, CENTER);
    textSize(20);
    if (selected) {
      fill(255, 0, 0); // Destaca a opção selecionada
    } else {
      fill(0); // Cor padrão para as outras opções
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(255);
    text(label, x, y);
  }

  boolean isMouseOver() {
    return mouseX > x - w/2 && mouseX < x + w/2 && mouseY > y - h/2 && mouseY < y + h/2;
  }
}

ArrayList<MenuOption> menuOptions;
int selectedOptionIndex = -1;

void cliqueOpcao(){
  if(estadoSystem == 0)
  for (int i = 0; i < menuOptions.size(); i++) {
    if (menuOptions.get(i).isMouseOver()) {
      selectedOptionIndex = i;
      selecionarOpcao();
      break;
    }
  }
}

void selecionarOpcao() {
  if (selectedOptionIndex != -1) {
    MenuOption selectedOption = menuOptions.get(selectedOptionIndex);
    println("Selecionado: " + selectedOption.label);

    // Adicione o código correspondente à opção selecionada aqui
    if (selectedOption.label.equals("Iniciar")) {
      estadoSystem = 1;
    } else if (selectedOption.label.equals("Opções")) {
      // Adicione o código para abrir as opções aqui
    } else if (selectedOption.label.equals("Créditos")) {
      // Adicione o código para ver os créditos aqui
    } else if (selectedOption.label.equals("Sair")) {
      exit();
    }
  }
}
void criarMenu(){
  menuOptions = new ArrayList<MenuOption>();
  menuOptions.add(new MenuOption("Iniciar", width / 2, 100, 120, 40));
  menuOptions.add(new MenuOption("Opções", width / 2, 150, 120, 40));
  menuOptions.add(new MenuOption("Créditos", width / 2, 200, 120, 40));
  menuOptions.add(new MenuOption("Sair", width / 2, 250, 120, 40));
}

void mostrarMenu(){
  for (int i = 0; i < menuOptions.size(); i++) {
      MenuOption option = menuOptions.get(i);
      option.selected = i == selectedOptionIndex;
      option.display();
    }
}
