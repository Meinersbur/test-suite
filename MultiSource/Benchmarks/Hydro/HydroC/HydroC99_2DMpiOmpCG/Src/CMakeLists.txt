set(PROG HydroC99_2DMpiOmpCG)

list(APPEND CPPFLAGS)
list(APPEND LDFLAGS -lm)
#list(APPEND CPPFLAGS -fopenmp)
#list(APPEND LDFLAGS -fopenmp -lm)

set(RUN_OPTIONS -i "${CMAKE_CURRENT_SOURCE_DIR}/../../../Input/input_500x500_corner.nml")

llvm_multisource()
