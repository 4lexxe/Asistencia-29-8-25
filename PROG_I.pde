Nave nave;
Enemigo enemigo;

int score = 0;
boolean gameOver = false;

void setup() {
  size(500, 600);
  nave = new Nave(width/2, height - 60, 40, 40, 6);
  enemigo = new Enemigo(int(random(0, width-40)), -40, 40, 40, 5);
  textAlign(CENTER, CENTER);
}

void draw() {
  // Fondo con degradado animado
  for (int i = 0; i < height; i++) {
    float inter = map(i, 0, height, 0, 1);
    stroke(lerpColor(color(20, 20, 50), color(50, 0, 100), inter + sin(frameCount*0.01)*0.1));
    line(0, i, width, i);
  }

  if (!gameOver) {
    nave.mostrar();
    nave.mover();

    enemigo.mostrar();
    enemigo.mover();

    if (enemigo.y > height) {
      enemigo.reiniciar();
      score++;
    }

    if (nave.colisionaCon(enemigo)) {
      gameOver = true;
    }

    fill(255, 255, 0);
    textSize(20);
    text("Score: " + score, width/2, 30);
  } else {
    fill(255, 0, 0);
    textSize(40);
    text("GAME OVER", width/2, height/2);
    textSize(20);
    text("Puntaje final: " + score, width/2, height/2 + 50);
    text("Presiona R para reiniciar", width/2, height/2 + 100);
  }
}

void keyPressed() {
  if (gameOver && (key == 'r' || key == 'R')) {
    gameOver = false;
    score = 0;
    nave = new Nave(width/2, height - 60, 40, 40, 6);
    enemigo = new Enemigo(int(random(0, width-40)), -40, 40, 40, 5);
  }
}
