PImage I;
I =  loadImage("Tobias.jpg");
size(562,561);
image(I, 0, 0);
loadPixels();
for (int x = 0; x < pixels.length; x++){
  pixels[x] = color(255-red(pixels[x]),255-green(pixels[x]),255-blue(pixels[x]));
  }
updatePixels();
save("Inverse.jpg");