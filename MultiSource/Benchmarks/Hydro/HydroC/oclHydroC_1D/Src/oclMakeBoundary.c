/*
  A simple 2D hydro code
  (C) Romain Teyssier : CEA/IRFU           -- original F90 code
  (C) Pierre-Francois Lavallee : IDRIS      -- original F90 code
  (C) Guillaume Colin de Verdiere : CEA/DAM -- for the C version
*/

/*

This software is governed by the CeCILL license under French law and
abiding by the rules of distribution of free software.  You can  use, 
modify and/ or redistribute the software under the terms of the CeCILL
license as circulated by CEA, CNRS and INRIA at the following URL
"http://www.cecill.info". 

As a counterpart to the access to the source code and  rights to copy,
modify and redistribute granted by the license, users are provided only
with a limited warranty  and the software's author,  the holder of the
economic rights,  and the successive licensors  have only  limited
liability. 

In this respect, the user's attention is drawn to the risks associated
with loading,  using,  modifying and/or developing or reproducing the
software by the user in light of its specific status of free software,
that may mean  that it is complicated to manipulate,  and  that  also
therefore means  that it is reserved for developers  and  experienced
professionals having in-depth computer knowledge. Users are therefore
encouraged to load and test the software's suitability as regards their
requirements in conditions enabling the security of their systems and/or 
data to be ensured and,  more generally, to use and operate it in the 
same conditions as regards security. 

The fact that you are presently reading this means that you have had
knowledge of the CeCILL license and that you accept its terms.

*/

#include <stdlib.h>
#include <unistd.h>
#include <math.h>
#include <stdio.h>

#include "parametres.h"
#include "oclMakeBoundary.h"
#include "utils.h"
#include "oclInit.h"
#include "ocltools.h"

void
oclMakeBoundary(long idim, const hydroparam_t H, hydrovar_t * Hv, cl_mem uoldDEV)
{

  // - - - - - - - - - - - - - - - - - - -
  // Cette portion de code est a verifier
  // detail. J'ai des doutes sur la conversion
  // des index depuis fortran.
  // - - - - - - - - - - - - - - - - - - -
  long i, i0, j, j0;
  long n = 1;
  double sign;
  WHERE("make_boundary");
  // #warning "Programme a verifier en detail ainsi que les kernels."

  // la boucle sur les variables est integree au kernel. Le changement
  // de signe est pris en compte dans les kernels.
  if (idim == 1) {
    // Left boundary
    n = ((H.jmax - ExtraLayer) - (H.jmin + ExtraLayer));
    // SetBlockDims(n * H.nvar, THREADSSZ, block, grid);
    for (i = 0; i < ExtraLayer; i++) {
      sign = 1.0;
      if (H.boundary_left == 1) {
        i0 = ExtraLayerTot - i - 1;
        //         if (ivar == IU) {
        //           sign = -1.0;
        //         }
      } else if (H.boundary_left == 2) {
        i0 = 2;
      } else {
        i0 = H.nx + i;
      }
      OCLINITARG;
      OCLSETARG(ker[Loop1KcuMakeBoundary], i);
      OCLSETARG(ker[Loop1KcuMakeBoundary], i0);
      OCLSETARG(ker[Loop1KcuMakeBoundary], sign);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.jmin);
      OCLSETARG(ker[Loop1KcuMakeBoundary], n);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.nxt);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.nyt);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.nvar);
      OCLSETARG(ker[Loop1KcuMakeBoundary], uoldDEV);
      oclLaunchKernel(ker[Loop1KcuMakeBoundary], cqueue, n * H.nvar, THREADSSZ, __FILE__, __LINE__);
      //       Loop1KcuMakeBoundary <<< grid, block >>> (i, i0, sign, H.jmin, n, H.nxt, H.nyt, H.nvar, uoldDEV);
      //       CheckErr("Loop1KcuMakeBoundary");
      //       cudaThreadSynchronize();
      //       CheckErr("After synchronize Loop1KcuMakeBoundary");
    }
    // Right boundary
    for (i = H.nx + ExtraLayer; i < H.nx + ExtraLayerTot; i++) {
      sign = 1.0;
      if (H.boundary_right == 1) {
        i0 = 2 * H.nx + ExtraLayerTot - i - 1;
        //         if (ivar == IU) {
        //           sign = -1.0;
        //         }
      } else if (H.boundary_right == 2) {
        i0 = H.nx + ExtraLayer;
      } else {
        i0 = i - H.nx;
      }
      OCLINITARG;
      OCLSETARG(ker[Loop1KcuMakeBoundary], i);
      OCLSETARG(ker[Loop1KcuMakeBoundary], i0);
      OCLSETARG(ker[Loop1KcuMakeBoundary], sign);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.jmin);
      OCLSETARG(ker[Loop1KcuMakeBoundary], n);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.nxt);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.nyt);
      OCLSETARG(ker[Loop1KcuMakeBoundary], H.nvar);
      OCLSETARG(ker[Loop1KcuMakeBoundary], uoldDEV);
      oclLaunchKernel(ker[Loop1KcuMakeBoundary], cqueue, n * H.nvar, THREADSSZ, __FILE__, __LINE__);
      //       Loop1KcuMakeBoundary <<< grid, block >>> (i, i0, sign, H.jmin, n, H.nxt, H.nyt, H.nvar, uoldDEV);
      //       CheckErr("Loop1KcuMakeBoundary 2");
      //       cudaThreadSynchronize();
      //       CheckErr("After synchronize Loop1KcuMakeBoundary 2");
    }
  } else {
    n = ((H.imax - ExtraLayer) - (H.imin + ExtraLayer));
    // SetBlockDims(n * H.nvar, THREADSSZ, block, grid);
    // Lower boundary
    j0 = 0;
    for (j = 0; j < ExtraLayer; j++) {
      sign = 1.0;
      if (H.boundary_down == 1) {
        j0 = ExtraLayerTot - j - 1;
        //         if (ivar == IV) {
        //           sign = -1.0;
        //         }
      } else if (H.boundary_down == 2) {
        j0 = ExtraLayerTot;
      } else {
        j0 = H.ny + j;
      }
      OCLINITARG;
      OCLSETARG(ker[Loop2KcuMakeBoundary], j);
      OCLSETARG(ker[Loop2KcuMakeBoundary], j0);
      OCLSETARG(ker[Loop2KcuMakeBoundary], sign);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.imin);
      OCLSETARG(ker[Loop2KcuMakeBoundary], n);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.nxt);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.nyt);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.nvar);
      OCLSETARG(ker[Loop2KcuMakeBoundary], uoldDEV);
      oclLaunchKernel(ker[Loop2KcuMakeBoundary], cqueue, n * H.nvar, THREADSSZ, __FILE__, __LINE__);
      //       Loop2KcuMakeBoundary <<< grid, block >>> (j, j0, sign, H.imin, n, H.nxt, H.nyt, H.nvar, uoldDEV);
      //       CheckErr("Loop2KcuMakeBoundary ");
      //       cudaThreadSynchronize();
      //       CheckErr("After synchronize Loop2KcuMakeBoundary ");
    }
    // Upper boundary
    for (j = H.ny + ExtraLayer; j < H.ny + ExtraLayerTot; j++) {
      sign = 1.0;
      if (H.boundary_up == 1) {
        j0 = 2 * H.ny + ExtraLayerTot - j - 1;
        //         if (ivar == IV) {
        //           sign = -1.0;
        //         }
      } else if (H.boundary_up == 2) {
        j0 = H.ny + 1;
      } else {
        j0 = j - H.ny;
      }
      OCLINITARG;
      OCLSETARG(ker[Loop2KcuMakeBoundary], j);
      OCLSETARG(ker[Loop2KcuMakeBoundary], j0);
      OCLSETARG(ker[Loop2KcuMakeBoundary], sign);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.imin);
      OCLSETARG(ker[Loop2KcuMakeBoundary], n);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.nxt);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.nyt);
      OCLSETARG(ker[Loop2KcuMakeBoundary], H.nvar);
      OCLSETARG(ker[Loop2KcuMakeBoundary], uoldDEV);
      oclLaunchKernel(ker[Loop2KcuMakeBoundary], cqueue, n * H.nvar, THREADSSZ, __FILE__, __LINE__);
      //       Loop2KcuMakeBoundary <<< grid, block >>> (j, j0, sign, H.imin, n, H.nxt, H.nyt, H.nvar, uoldDEV);
      //       CheckErr("Loop2KcuMakeBoundary 2");
      //       cudaThreadSynchronize();
      //       CheckErr("After synchronize Loop2KcuMakeBoundary 2");
    }
  }
}                               // make_boundary


//EOF
