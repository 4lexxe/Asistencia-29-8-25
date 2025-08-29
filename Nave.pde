class Nave {
  int x, y, w, h, vel;

  Nave(int x, int y, int w, int h, int vel) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vel = vel;
  }

  void mostrar() {
    fill(0, 255, 100);
    rect(x, y, w, h);
  }

  void mover() {
    if (keyPressed) {
      if (keyCode == LEFT && x > 0) x -= vel;
      if (keyCode == RIGHT && x < width - w) x += vel;
    }
  }

  boolean colisionaCon(Enemigo e) {
    return (x < e.x + e.w &&
            x + w > e.x &&
            y < e.y + e.h &&
            y + h > e.y);
  }
}
