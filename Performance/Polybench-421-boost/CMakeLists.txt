# TODO: Make no depend on this
file(COPY lit.local.cfg DESTINATION "${CMAKE_CURRENT_BINARY_DIR}")

add_subdirectory(datamining)
add_subdirectory(linear-algebra)
