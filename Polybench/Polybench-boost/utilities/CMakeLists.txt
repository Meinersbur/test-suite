
add_library(Pboostlib polybench.c)
target_include_directories(Pboostlib INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
test_suite_add_build_dependencies(Pboostlib)
