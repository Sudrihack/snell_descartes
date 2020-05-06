float X, Yi, alpha1, alpha2, module, n1, Yr, alpha3, Yr2;
float[] n2; //= {1.3, 1.35, 1.40, 1.45, 1.5, 1.55, 1.6};
float[] n3;
float nmin;
float nmax;
color rouge = color(255, 0, 0);
color orange = color(255, 128, 0);
color jaune = color(255, 255, 0);
color vert = color(0, 255, 0);
color bleu = color(0, 0, 255);
color indigo = color(75, 0, 130);
color violet = color(255, 0, 255);
color[] couleurs;//= {rouge, orange, jaune, vert, bleu, indigo, violet};
int nombre_rayon = 200;
void setup() {
  colorMode(HSB);  
  
  n2 = new float[nombre_rayon];
  n3 = new float[nombre_rayon];
  couleurs = new color[nombre_rayon];
  nmin = 2;
  nmax= 1.7;
  for (int i=1; i<nombre_rayon; i++) {
    n2[i]=nmin+0.01*i;
    n3[i]=1+0.01*i;
    couleurs[i] = color(i*230/nombre_rayon, 255, 255);
  }
  colorMode(RGB);
  fullScreen();
  smooth();
  X = width/2;
  //Y = height/2;
  n1 = 1;
}
void draw() {
  translate(width/3, height/2);

  Yi = mouseY - height/2;
  strokeWeight(1);
  background(0);
  stroke(255);
  //line(-width/2, 0, -width/2, Yi);
  line(0, -height/2, 0, height/2); //ligne verticale 1
  stroke(255, 255, 255);
  line(-width/3, Yi, 0, 0); //rayon 1
  alpha1 = atan(-Yi/( width/3));
  //translate(0, 0);
  for (int i=0; i<nombre_rayon; i++) {
    pushMatrix();

    stroke(couleurs[i]);
    alpha2 = asin((n1/n2[i]) * sin(alpha1));
    Yr = width/3 *tan(alpha2);
    line(0, 0, width/3, Yr); //rayon refracte 1
    translate(width/3, 0);
    translate(0, Yr);
    alpha3 = asin((n2[i]/n3[i])*sin(alpha2));
    Yr2 = width/3 *tan(alpha3);
    stroke(couleurs[i]);
    line(0, 0, width/3, Yr2); //rayon refracte 2
    stroke(255);
    translate(0, -Yr);
    line(0, -height/2, 0, height/2); //ligne verticale 2
    //translate(0, 0);
    popMatrix();
  }
}
