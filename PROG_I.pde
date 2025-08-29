int naveX, naveY;
int naveW = 40, naveH = 40;
int velocidad = 6;

int enemigoX, enemigoY;
int enemigoW = 40, enemigoH = 40;
int enemigoVel = 5;

color enemigoColor;

int score = 0;
boolean gameOver = false;

void setup() {
  size(500, 600);
  naveX = width/2;
  naveY = height - 60;
  enemigoX = int(random(0, width - enemigoW));
  enemigoY = -enemigoH;
  enemigoColor = color(random(255), random(255), random(255));
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
    // Dibujar nave (verde fosforescente)
    fill(0, 255, 100);
    rect(naveX, naveY, naveW, naveH);

    // Movimiento de la nave
    if (keyPressed) {
      if (keyCode == LEFT && naveX > 0) naveX -= velocidad;
      if (keyCode == RIGHT && naveX < width - naveW) naveX += velocidad;
    }

    // Dibujar enemigo con color aleatorio
    fill(enemigoColor);
    rect(enemigoX, enemigoY, enemigoW, enemigoH);
    enemigoY += enemigoVel;

    // Si el enemigo sale de la pantalla, reiniciarlo
    if (enemigoY > height) {
      enemigoY = -enemigoH;
      enemigoX = int(random(0, width - enemigoW));
      enemigoVel++; // aumenta la dificultad
      score++;
      enemigoColor = color(random(255), random(255), random(255)); // nuevo color
    }

    // Colisión
    if (naveX < enemigoX + enemigoW &&
        naveX + naveW > enemigoX &&
        naveY < enemigoY + enemigoH &&
        naveY + naveH > enemigoY) {
      gameOver = true;
    }

    // Puntaje (amarillo brillante)
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
    // Reiniciar
    gameOver = false;
    score = 0;
    naveX = width/2;
    naveY = height - 60;
    enemigoX = int(random(0, width - enemigoW));
    enemigoY = -enemigoH;
    enemigoVel = 5;
    enemigoColor = color(random(255), random(255), random(255));
  }
}
