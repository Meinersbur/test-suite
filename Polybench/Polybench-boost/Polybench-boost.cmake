
set(suitename Pboost)

if (NOT TARGET ${suitename}lib)
  file(RELATIVE_PATH relsource "${CMAKE_CURRENT_SOURCE_DIR}" "${CMAKE_CURRENT_LIST_DIR}")
  add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/utilities" "${CMAKE_CURRENT_BINARY_DIR}/${relsource}/utilities")
endif ()


function (polybench_benchmark name)
  polybench_target(${suitename}_${name} ${name})
endfunction ()


set(DIR_OF_FOO_CMAKE "${CMAKE_CURRENT_LIST_DIR}")  
function (polybench_target target name)
  llvm_test_traditional(${target})

  llvm_test_executable(${target} "${name}.cpp")
  target_compile_definitions(${target} PRIVATE -DPOLYBENCH_USE_RESTRICT -DBOOST_UBLAS_NDEBUG -DNDEBUG ${ARGN})
  target_include_directories(${target} PRIVATE "${DIR_OF_FOO_CMAKE}/boost")
  target_link_libraries(${target} PRIVATE ${suitename}lib -lm)
  test_suite_add_build_dependencies(${target})
endfunction ()
