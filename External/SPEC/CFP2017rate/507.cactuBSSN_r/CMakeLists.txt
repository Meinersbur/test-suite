# https://www.spec.org/cpu2017/Docs/benchmarks/507.cactuBSSN_r.html
include(../../SpecCPU2017.cmake)
if (NOT TEST_SUITE_SPEC2017_ROOT)
  return ()
endif ()

speccpu2017_benchmark(RATE)

enable_language (Fortran)
add_definitions(-DCCODE -DCCTK_DISABLE_RESTRICT=1 -D__TIME__=NULL -D__DATE__=NULL)
speccpu2017_add_include_dirs(include)

## test ########################################################################

speccpu2017_run_test(
  spec_test.par
  STDOUT spec_test.out
  RUN_TYPE test
)

## train #######################################################################

speccpu2017_run_test(
  spec_train.par
  STDOUT spec_train.out
  RUN_TYPE train
)

## ref #########################################################################

speccpu2017_run_test(
  spec_ref.par
  STDOUT spec_ref.out
  RUN_TYPE ref
)

################################################################################

speccpu2017_verify_output(ABSOLUTE_TOLERANCE 0.0000000000005)
speccpu2017_add_executable()
speccpu2017_prepare_rundir()
