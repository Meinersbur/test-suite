
add_library(P421lib polybench.c)
target_include_directories(P421lib INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
test_suite_add_build_dependencies(P421lib)
