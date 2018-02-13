set(POLYBENCH_SOURCE_ROOT ${CMAKE_CURRENT_SOURCE_DIR})

set(GLOBAL_CFLAGS ${CFLAGS})
set(GLOBAL_CPPFLAGS ${CPPFLAGS})
set(GLOBAL_LDFLAGS ${LDFLAGS})

file(COPY lit.local.cfg DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")
  
macro(add_polybench)
  cmake_parse_arguments(ARG "" "PROG" "DATASET;SOURCES" ${ARGN})
  set(PROG ARG_PROG)
  
  set(_dataset "-DLARGE_DATASET")
  #if (DEFINED ARG_DATASET)
  #  set(_dataset ${ARG_DATASET})
  #endif ()
  
  if (ARG_SOURCES)
    set(Source ${ARG_SOURCES})
  endif ()
  
  set(benchname "Pb421")
  
  set(CPPFLAGS  ${GLOBAL_CFLAGS} -I "${POLYBENCH_SOURCE_ROOT}/utilities" "${_dataset}" -ffast-math)
  set(LDFLAGS ${GLOBAL_LDFLAGS} -lm)
  
  llvm_singlesource(PREFIX "${benchname}-perf_" ${ARG_UNPARSED_ARGUMENTS})
  
  list(APPEND CPPFLAGS -DPOLYBENCH_USE_RESTRICT)
  llvm_singlesource(PREFIX "${benchname}-perf-restrict_" ${ARG_UNPARSED_ARGUMENTS})
  
  unset(Source)
endmacro()


add_subdirectory(datamining)
add_subdirectory(delicm)
add_subdirectory(linear-algebra)
add_subdirectory(medley)
add_subdirectory(stencils)
