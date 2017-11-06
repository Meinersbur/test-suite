
add_library(P32lib polybench.c)
target_include_directories(P32lib INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
test_suite_add_build_dependencies(P32lib)
