#include "gtest/gtest.h"

#include "mfem.hpp"

#if 0
template<typename RT, typename... Args>
RT __enzyme_autodiff(void*, Args...);

double sumAndMul(const mfem::Vector v, double mul) {
  double sum = 0;
  for(int i=0; i<v.Size(); i++) {
    sum += v[i];
  }
  return sum * mul;
}

TEST(enzyme, basic_test) {

    double scale = 2.0;
    mfem::Vector v(5);
    mfem::Vector dv(5);

    for (int i = 0; i < 5; i++) {
        v[i] = i;
        dv[i] = 1.0;
    }

    double d_mul = __enzyme_autodiff<double>((void*)sumAndMul, v, dv, scale);

}
#endif