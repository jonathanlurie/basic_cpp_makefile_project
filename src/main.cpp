#include <iostream>
#include "Vector3D.h"
using namespace std;

int main() {
  double x = 1.;
  double y = 2.;
  double z = 3.;

  Vector3D v = Vector3D(x, y, z);
  cout << "The vector is: " << v.x << " " << v.y << " " << v.z << endl;
  return 0;
}
