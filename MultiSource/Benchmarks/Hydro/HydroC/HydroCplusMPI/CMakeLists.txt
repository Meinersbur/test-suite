set(PROG HydroCplusMPI)

list(APPEND CPPFLAGS -DMPI)
list(APPEND LDFLAGS)

set(RUN_OPTIONS -i "${CMAKE_CURRENT_SOURCE_DIR}/../../Input/input_500x500_corner.nml")

llvm_multisource()
