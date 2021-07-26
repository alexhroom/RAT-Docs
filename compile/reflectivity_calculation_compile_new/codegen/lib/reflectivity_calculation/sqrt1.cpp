//
// Non-Degree Granting Education License -- for use at non-degree
// granting, nonprofit, educational organizations only. Not for
// government, commercial, or other organizational use.
//
// sqrt1.cpp
//
// Code generation for function 'sqrt1'
//

// Include files
#include "sqrt1.h"
#include "hypot.h"
#include "isinf.h"
#include "isnan.h"
#include "rt_nonfinite.h"
#include <cmath>

// Function Definitions
namespace coder {
namespace internal {
namespace scalar {
void c_sqrt(double *x)
{
  *x = std::sqrt(*x);
}

void c_sqrt(creal_T *x)
{
  double absxi;
  double xi;
  double xr;
  xr = x->re;
  xi = x->im;
  if (xi == 0.0) {
    if (xr < 0.0) {
      absxi = 0.0;
      xr = std::sqrt(-xr);
    } else {
      absxi = std::sqrt(xr);
      xr = 0.0;
    }
  } else if (xr == 0.0) {
    if (xi < 0.0) {
      absxi = std::sqrt(-xi / 2.0);
      xr = -absxi;
    } else {
      absxi = std::sqrt(xi / 2.0);
      xr = absxi;
    }
  } else if (b_isnan(xr)) {
    absxi = xr;
  } else if (b_isnan(xi)) {
    absxi = xi;
    xr = xi;
  } else if (b_isinf(xi)) {
    absxi = std::abs(xi);
    xr = xi;
  } else if (b_isinf(xr)) {
    if (xr < 0.0) {
      absxi = 0.0;
      xr = xi * -xr;
    } else {
      absxi = xr;
      xr = 0.0;
    }
  } else {
    double absxr;
    absxr = std::abs(xr);
    absxi = std::abs(xi);
    if ((absxr > 4.4942328371557893E+307) ||
        (absxi > 4.4942328371557893E+307)) {
      absxr *= 0.5;
      absxi *= 0.5;
      absxi = b_hypot(absxr, absxi);
      if (absxi > absxr) {
        absxi = std::sqrt(absxi) * std::sqrt(absxr / absxi + 1.0);
      } else {
        absxi = std::sqrt(absxi) * 1.4142135623730951;
      }
    } else {
      absxi = std::sqrt((b_hypot(absxr, absxi) + absxr) * 0.5);
    }
    if (xr > 0.0) {
      xr = 0.5 * (xi / absxi);
    } else {
      if (xi < 0.0) {
        xr = -absxi;
      } else {
        xr = absxi;
      }
      absxi = 0.5 * (xi / xr);
    }
  }
  x->re = absxi;
  x->im = xr;
}

} // namespace scalar
} // namespace internal
} // namespace coder

// End of code generation (sqrt1.cpp)