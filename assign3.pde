int b = 0, tX = floor(random(550)), tY = floor(random(400));

//for fighter moving
float x;
float y;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

//for enemy moving
float eX = 0, eY = floor(random(400));
float spacingX = 61;
float spacingY = 61;
float circle = 0;

PImage backgroundFormerImg, backgroundLaterImg;
PImage fighterImg;
PImage treasureImg;
PImage enemyImg;
PImage hpImg;

void setup(){
  size(640, 480);
  
  x = width*3/4;
  y = floor(random(400));
  
  hpImg = loadImage("img/hp.png");
  fighterImg = loadImage("img/fighter.png");
  treasureImg = loadImage("img/treasure.png");
  enemyImg = loadImage("img/enemy.png");
  backgroundFormerImg = loadImage("img/bg1.png");
  backgroundLaterImg = loadImage("img/bg2.png");
}

void draw(){
//background    
    b += 2;
    b %= 1280;
    image(backgroundFormerImg,b,0);
    image(backgroundLaterImg,b-640,0);
    image(backgroundFormerImg,b-1280,0);
//treasure    
    image(treasureImg,tX,tY); 
    if(x+51 >= tX && x <= tX+41){
      if(y+51 >= tY && y <= tY+41){
         tX = floor(random(550));
         tY = floor(random(400));
      }
    } 
//fighter    
    image(fighterImg, x, y);
    if (upPressed) {y -= speed;}
    if (downPressed) {y += speed;}
    if (leftPressed) {x -= speed;}
    if (rightPressed) {x += speed;}   
//fighter boundary detection
  if (x < 0){x = 0;}
  if (x > width-61){x = width - 61;}
  if (y < 0){y = 0;}
  if (y > height-61){y = height - 61;}    

//enemy    
  for(int i = 0; i < 5; i++){
    if(circle % 3 == 0){
      image(enemyImg, eX+i*spacingX, eY);
    }else if(circle % 3 == 1){
      image(enemyImg, eX+i*spacingX, eY-i*spacingY);
      if(eY < 244){
        eY = 244;
      }
    }else{
      if(i <= 2){
      image(enemyImg, eX+i*spacingX, eY+i*spacingY);
      image(enemyImg, eX+i*spacingX, eY-i*spacingY);        
      }else if(i == 3){
      image(enemyImg, eX+i*spacingX, eY+spacingY);
      image(enemyImg, eX+i*spacingX, eY-spacingY);        
      }else{
        image(enemyImg, eX+i*spacingX, eY);
      }
      if(eY < 122){
        eY = 122;
      }
      if(eY > 297){
        eY = 297;
      }
    }
    eX += 1;
    if(eX >= width){
      circle++;
      eX = 0;
      eY = random(400);
    }
  }

//blood    
    fill(#ff0000);
    rect(8, 4, 200, 17);
    image(hpImg,0,0); 
}

void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }
}
