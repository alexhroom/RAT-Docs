//
// Non-Degree Granting Education License -- for use at non-degree
// granting, nonprofit, educational organizations only. Not for
// government, commercial, or other organizational use.
// File: shiftdata.h
//
// MATLAB Coder version            : 5.0
// C/C++ source code generated on  : 11-Jan-2021 16:52:33
//
#ifndef SHIFTDATA_H
#define SHIFTDATA_H

// Include Files
#include <cstddef>
#include <cstdlib>
#include "rtwtypes.h"
#include "omp.h"
#include "reflectivity_calculation_types.h"
#define MAX_THREADS                    omp_get_max_threads()

// Function Declarations
extern void shiftdata(double scalefac, double horshift, double dataPresent,
                      coder::array<double, 2U> &data, const double dataLimits[2]);

#endif

//
// File trailer for shiftdata.h
//
// [EOF]
//
