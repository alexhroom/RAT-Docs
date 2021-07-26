//
// Non-Degree Granting Education License -- for use at non-degree
// granting, nonprofit, educational organizations only. Not for
// government, commercial, or other organizational use.
//
// sum.h
//
// Code generation for function 'sum'
//

#ifndef SUM_H
#define SUM_H

// Include files
#include "rtwtypes.h"
#include "coder_array.h"
#include "omp.h"
#include <cstddef>
#include <cstdlib>

// Function Declarations
namespace coder {
void sum(const ::coder::array<double, 2U> &x, ::coder::array<double, 1U> &y);

double sum(const ::coder::array<double, 1U> &x);

} // namespace coder

#endif
// End of code generation (sum.h)