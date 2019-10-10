## Define default build type
if ( NOT CMAKE_BUILD_TYPE )
  set ( CMAKE_BUILD_TYPE "RELEASE" CACHE STRING "Build configuration 'Release' or 'Debug'." FORCE )
  message ( STATUS "CMAKE_BUILD_TYPE not given, defaulting to RELEASE.")
else ()
  message ( STATUS "CMAKE_BUILD_TYPE is: ${CMAKE_BUILD_TYPE}")
endif ()

## FORTRAN Compiler options
if ( ${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU" )
  set ( CMAKE_CXX_FLAGS "-fopenmp -march=native -pipe" )
  set ( CMAKE_CXX_FLAGS_RELEASE  "-O3 -funroll-loops -finline-functions -flto" )
  set ( CMAKE_CXX_FLAGS_DEBUG "-Og -g" )

elseif ( ${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang" )
  set ( CMAKE_CXX_FLAGS "" )
  set ( CMAKE_CXX_FLAGS__RELEASE "" )
  set ( CMAKE_CXX_FLAGS_DEBUG "" )

elseif ( ${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel" )
  set ( CMAKE_CXX_FLAGS "" )
  set ( CMAKE_CXX_FLAGS__RELEASE "" )
  set ( CMAKE_CXX_FLAGS_DEBUG "" )

elseif ( ${CMAKE_Fortran_COMPILER_ID} STREQUAL "PGI" )
  set ( CMAKE_CXX_FLAGS "" )
  set ( CMAKE_CXX_FLAGS__RELEASE "" )
  set ( CMAKE_CXX_FLAGS_DEBUG "" )

endif ()
