# Polybench 4.2.1 beta
# https://sourceforge.net/projects/polybench/


set(suitename P32)




#message(${CMAKE_CURRENT_LIST_FILE})
if (NOT TARGET ${suitename}lib)
  file(RELATIVE_PATH relsource "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_LIST_DIR}")
  add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/utilities" "${CMAKE_CURRENT_BINARY_DIR}/${relsource}/utilities")

  #add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/utilities" "${CMAKE_CURRENT_LIST_DIR}/utilities")
  #add_library(${suitename}lib "${CMAKE_CURRENT_LIST_DIR}/utilities/polybench.c")
  #target_include_directories(${suitename}lib INTERFACE "${CMAKE_CURRENT_LIST_DIR}/utilities")
endif ()


function (polybench_benchmark name)
  polybench_target(${suitename}_${name} ${name})
  #polybench_target(${suitename}r_${name} ${name} -DPOLYBENCH_USE_RESTRICT)
endfunction ()


function (polybench_target target name)
  llvm_test_traditional(${target})

  llvm_test_executable(${target} "${name}.c")
  target_compile_definitions(${target} PRIVATE -DSTANDARD_DATASET ${ARGN})
  #add_dependencies(${target} ${suitename}lib)
  target_link_libraries(${target} PRIVATE ${suitename}lib -lm)
  test_suite_add_build_dependencies(${target})
endfunction ()
