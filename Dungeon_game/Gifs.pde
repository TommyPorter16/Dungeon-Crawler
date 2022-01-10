class gifs {

  //instance variables
  int numberOfFrames;
  PImage[] images;
  int f;
  float x, y;
  float w, h;
  float rate;

  //constructor

  gifs(int nf, float r, String pre, String post) {

    numberOfFrames = nf;
    rate = r;
    images = new PImage[numberOfFrames];

    int i = 0;
    while (i < numberOfFrames) {
      images[i] = loadImage(pre +i+ post);

      i++;
    }
    f = 0;
  }





  //behaviour fuunctions
  void show() {
    //space gif




    if (f == numberOfFrames) f =0;
    image(images[f], 0, 0, width, height);
    if (frameCount % rate ==0) f = f+1;
  }

  void show(float x, float y, float w, float h) {
    //space gif




    if (f == numberOfFrames) f =0;
    image(images[f], x, y, w, h);
    if (frameCount % rate ==0) f = f+1;
  }
}
