set(PROG HydroC99_2DMpi)

list(APPEND LDFLAGS -lm)

set(RUN_OPTIONS -i "${CMAKE_CURRENT_SOURCE_DIR}/../../../Input/input_500x500_corner.nml")

llvm_multisource()
