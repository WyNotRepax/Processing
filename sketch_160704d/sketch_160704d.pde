/*size(512,512);


loadPixels();
for (int i = 0; i < width*height; i++) {
  pixels[i] = color(255,Math.round(i/2/height)%256,Math.round(i/2%width)%256);
}
updatePixels();
*/
void setup(){
  size(512,512);
}
int i=0;
void draw(){
  loadPixels();
  pixels[i] = color(255,Math.round(i/2/height)%256,Math.round(i/2%width)%256);
  if(i < width*height){
    i++;
  }
  updatePixels();
}