##===- TestSuite.cmake ----------------------------------------------------===##
#
# Defines helper functions to create .test files that describe how to run a
# benchmark and optionally how to prepare before running, how to verify the
# results and how to extract metrics from the output.
#
##===----------------------------------------------------------------------===##

# Specify a "RUN: " line to be put in a .test file. See also llvm_add_test().
macro(llvm_test_run)
  CMAKE_PARSE_ARGUMENTS(ARGS "" "RUN_TYPE;EXECUTABLE;WORKDIR" "" ${ARGN})
  # If no executable is specified use $EXECUTABLE$ placeholder which will be
  # replaced later.
  if(NOT DEFINED ARGS_EXECUTABLE)
    set(ARGS_EXECUTABLE "$EXECUTABLE$")
  endif()
  if(NOT DEFINED TESTSCRIPT)
    set(TESTSCRIPT "" PARENT_SCOPE)
  endif()
  if(DEFINED ARGS_WORKDIR)
    set(ARGS_EXECUTABLE "cd ${ARGS_WORKDIR} ; ${ARGS_EXECUTABLE}")
  endif()
 
  # ARGS_UNPARSED_ARGUMENTS is a semicolon-separated list. Change it into a
  # whitespace-separated string.
  string(REPLACE ";" " " JOINED_ARGUMENTS "${ARGS_UNPARSED_ARGUMENTS}")
  if(NOT DEFINED ARGS_RUN_TYPE OR "${ARGS_RUN_TYPE}" STREQUAL "${TEST_SUITE_RUN_TYPE}")
    set(TESTSCRIPT "${TESTSCRIPT}RUN: ${ARGS_EXECUTABLE} ${JOINED_ARGUMENTS}\n")
  endif()
endmacro()

# Specify a "VERIFY: " line to be put in a .test file. See also llvm_add_test().
macro(llvm_test_verify)
  CMAKE_PARSE_ARGUMENTS(ARGS "" "RUN_TYPE;WORKDIR" "" ${ARGN})
  if(NOT DEFINED TESTSCRIPT)
    set(TESTSCRIPT "" PARENT_SCOPE)
  endif()

  set(_prefix)
  if(DEFINED ARGS_WORKDIR)
    set(_prefix "cd ${ARGS_WORKDIR} ; ")
  endif()
  
  # ARGS_UNPARSED_ARGUMENTS is a semicolon-separated list. Change it into a
  # whitespace-separated string.
  string(REPLACE ";" " " JOINED_ARGUMENTS "${ARGS_UNPARSED_ARGUMENTS}")
  if(NOT DEFINED ARGS_RUN_TYPE OR "${ARGS_RUN_TYPE}" STREQUAL "${TEST_SUITE_RUN_TYPE}")
    set(TESTSCRIPT "${TESTSCRIPT}VERIFY: ${_prefix}${JOINED_ARGUMENTS}\n")
  endif()
endmacro()

# Specify a "PREPARE: " line to be put in a .test file. See also
# llvm_add_test().
macro(llvm_test_prepare)
  CMAKE_PARSE_ARGUMENTS(ARGS "" "RUN_TYPE" "" ${ARGN})
  if(NOT DEFINED TESTSCRIPT)
    set(TESTSCRIPT "" PARENT_SCOPE)
  endif()
  # ARGS_UNPARSED_ARGUMENTS is a semicolon-separated list. Change it into a
  # whitespace-separated string.
  string(REPLACE ";" " " JOINED_ARGUMENTS "${ARGS_UNPARSED_ARGUMENTS}")
  if(NOT DEFINED ARGS_RUN_TYPE OR "${ARGS_RUN_TYPE}" STREQUAL "${TEST_SUITE_RUN_TYPE}")
    set(TESTSCRIPT "${TESTSCRIPT}PREPARE: ${JOINED_ARGUMENTS}\n")
  endif()
endmacro()

# Specify a "METRIC: " line to be put in a .test file. See also llvm_add_test().
macro(llvm_test_metric)
  CMAKE_PARSE_ARGUMENTS(ARGS "" "RUN_TYPE;METRIC" "" ${ARGN})
  if(NOT DEFINED TESTSCRIPT)
    set(TESTSCRIPT "" PARENT_SCOPE)
  endif()
  # ARGS_UNPARSED_ARGUMENTS is a semicolon-separated list. Change it into a
  # whitespace-separated string.
  string(REPLACE ";" " " JOINED_ARGUMENTS "${ARGS_UNPARSED_ARGUMENTS}")
  if(NOT DEFINED ARGS_RUN_TYPE OR "${ARGS_RUN_TYPE}" STREQUAL "${TEST_SUITE_RUN_TYPE}")
    set(TESTSCRIPT "${TESTSCRIPT}METRIC: ${ARGS_METRIC}: ${JOINED_ARGUMENTS}\n")
  endif()
endmacro()

macro(llvm_test_sources)
  CMAKE_PARSE_ARGUMENTS(ARGS "" "" "" ${ARGN})
  foreach (_source IN LISTS ARGS_UNPARSED_ARGUMENTS)
    get_filename_component(_abspath "${_source}" ABSOLUTE)
    set(TESTSCRIPT "${TESTSCRIPT}SOURCE: ${_abspath}\n")
  endforeach()
endmacro()

macro(llvm_test_prefix)
  CMAKE_PARSE_ARGUMENTS(ARGS "" "PREFIX" "" ${ARGN})
  if (ARGS_PREFIX)
    set(TESTSCRIPT "${TESTSCRIPT}PREFIX: ${ARGS_PREFIX}\n")
  endif()
endmacro()

macro(llvm_test_refout REFOUT)
  set(TESTSCRIPT "${TESTSCRIPT}REFOUT: ${REFOUT}\n")
endmacro()

# Create a .test driver file suitable for LIT.
# The file contents come from previous llvm_test_XXX() calls.
function(llvm_add_test testfile executable)
  # Replace $EXECUTABLE$ placeholder.
  string(REPLACE "$EXECUTABLE$" "${executable}" TESTSCRIPT "${TESTSCRIPT}")
  
  set(TESTSCRIPT "${TESTSCRIPT}SOURCEDIR: ${CMAKE_CURRENT_SOURCE_DIR}\n")
  
  # Produce .test file
  file(GENERATE OUTPUT ${testfile} CONTENT "${TESTSCRIPT}")
  
  message("Written test file ${testfile}")
  #message("TEST_SUITE_RUN_TYPE=${TEST_SUITE_RUN_TYPE}")
  
  # flush the test script
  set(TESTSCRIPT "" PARENT_SCOPE)
endfunction()
