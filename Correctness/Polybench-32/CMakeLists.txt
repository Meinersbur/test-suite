set(POLYBENCH_SOURCE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(GLOBAL_CFLAGS ${CFLAGS})
set(GLOBAL_CPPFLAGS ${CPPFLAGS})
set(GLOBAL_LDFLAGS ${LDFLAGS})

file(COPY lit.local.cfg DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
  
macro(add_polybench)
  cmake_parse_arguments(ARG "" "PROG" "" ${ARGN})
  set(PROG ARG_PROG)
  
  set(benchname "Pb32")
  
  set(CPPFLAGS ${GLOBAL_CFLAGS} -I "${POLYBENCH_SOURCE_ROOT}/utilities" -DPOLYBENCH_DUMP_ARRAYS -DMINI_DATASET)
  set(LDFLAGS ${GLOBAL_LDFLAGS} -lm)
  
  llvm_singlesource(PREFIX "${benchname}_" ${ARG_UNPARSED_ARGUMENTS})
  
  list(APPEND CPPFLAGS -DPOLYBENCH_USE_RESTRICT)
  llvm_singlesource(PREFIX "${benchname}-restrict_" ${ARG_UNPARSED_ARGUMENTS})
endmacro()


add_subdirectory(datamining)
add_subdirectory(linear-algebra)
add_subdirectory(medley)
add_subdirectory(stencils)
