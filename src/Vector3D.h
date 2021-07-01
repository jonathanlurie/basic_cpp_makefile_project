#ifndef __VECTOR3D__H
#define __VECTOR3D__H


class Vector3D {
  public:
  double x, y, z;

  Vector3D(double xVal, double yVal, double zVal);
  virtual ~Vector3D();

};

#endif