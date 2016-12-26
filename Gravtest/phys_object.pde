class PhysObject{
  float m;//mass
  float r;//radius
  float d;//density
  GravField g;//GravField
  PhysObject(float mass, float radius, GravField Field){
    r = radius;
    m = mass;
    d = mass/pow(PI*radius,2);
  }
}