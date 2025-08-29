class Enemigo {
  int x, y, w, h, vel;
  color c;

  Enemigo(int x, int y, int w, int h, int vel) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vel = vel;
    this.c = color(random(255), random(255), random(255));
  }

  void mostrar() {
    fill(c);
    rect(x, y, w, h);
  }

  void mover() {
    y += vel;
  }

  void reiniciar() {
    y = -h;
    x = int(random(0, width - w));
    vel++;
    c = color(random(255), random(255), random(255));
  }
}
