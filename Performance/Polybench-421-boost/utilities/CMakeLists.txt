
add_library(Pboostlib polybench.c)
target_compile_definitions(Pboostlib PRIVATE -DNDEBUG)
target_compile_definitions(Pboostlib PUBLIC -DPOLYBENCH_USE_RESTRICT -DPOLYBENCH_TIME -DBOOST_UBLAS_NDEBUG)
target_include_directories(Pboostlib INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
test_suite_add_build_dependencies(Pboostlib)
