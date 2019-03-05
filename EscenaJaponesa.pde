PShape taburete,silla,templo,cat,plataforma;
PImage fondo,tabTextura,sillaTextura,temploTextura,catTextura, suelo;
boolean vistaPerfil;

void setup(){
  size(960,639,P3D);
  noStroke(); 
  vistaPerfil = false;
  fondo = loadImage("fondo.jpg");
  plataforma = createShape(BOX,650);
  suelo = loadImage("sueloPiedra.jpg");
  taburete = loadShape("wooden stool.obj");
  taburete.scale(14);
  tabTextura = loadImage("wooden stool texture(F).png");
  
  silla = loadShape("chair.obj");
  silla.scale(5);
  sillaTextura = loadImage("madera.jpg");
  
  templo = loadShape("Japanese_Temple.obj");
  templo.scale(26);
  temploTextura = loadImage("Japanese_Temple.png");
  
  cat = loadShape("12221_Cat_v1_l3.obj");
  cat.scale(5);
  catTextura = loadImage("Cat_diffuse.jpg");  
}


void draw(){
  background(fondo);
  textSize(16);
  fill(0);
  text("Para cambiar a camara lateral pulse 1", 600 , 50 ); 
  translate ( width /2 , height /2 , 0 ) ;
  rotate(radians(180));
  if (vistaPerfil) {
    camera(mouseX, 30.0, 0.0, // eyeX, eyeY, eyeZ
           0.0, 0.0, 0.0, // centerX, centerY, centerZ
           1.0, 0.0, 0.0); // upX, upY, upZ
  } 
  
  //Luces
  lights();
  directionalLight(255, 255, 255, width/2-100, height/2-100, -1);
  
  //Puesta de los modelos en pantalla
  beginShape();
  plataforma.setTexture(suelo);
  endShape();
  shape(plataforma,0,-height);
  
  beginShape();
  taburete.setTexture(tabTextura);
  endShape();
  shape(taburete,-210,-height /2 );
  beginShape();
  silla.setTexture(sillaTextura);
  endShape();
  shape(silla,-100,-height /2 +60);
  
  pushMatrix();
  beginShape();
  templo.setTexture(temploTextura);
  endShape();
  translate(0,0,-300);
  shape(templo, 0 ,-height /2 );
  popMatrix();
  
  pushMatrix();
  beginShape();
  cat.setTexture(catTextura);
  endShape();
  rotateX(radians(270));
  translate(280,200,-300);
  shape(cat,50,-height /2+100);
  popMatrix();

}

void keyPressed ( ) {
  if(key == 49) vistaPerfil = true;
}
