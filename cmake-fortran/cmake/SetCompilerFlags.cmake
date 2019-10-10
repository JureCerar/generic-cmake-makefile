## Define default build type
if ( NOT CMAKE_BUILD_TYPE )
  set ( CMAKE_BUILD_TYPE "RELEASE" CACHE STRING "Build configuration 'Release' or 'Debug'." FORCE )
  message ( STATUS "CMAKE_BUILD_TYPE not given, defaulting to RELEASE.")
else ()
  message ( STATUS "CMAKE_BUILD_TYPE is: ${CMAKE_BUILD_TYPE}")
endif ()

## FORTRAN Compiler options
if ( ${CMAKE_Fortran_COMPILER_ID} STREQUAL "GNU" )
  set ( CMAKE_Fortran_FLAGS "-cpp -fopenmp -march=native -pipe" )
  set ( CMAKE_Fortran_FLAGS_RELEASE  "-O3 -funroll-loops -finline-functions -flto" )
  set ( CMAKE_Fortran_FLAGS_DEBUG "-Og -g -fbounds-check -fbacktrace -ffpe-trap=invalid,zero,overflow,underflow" )

elseif ( ${CMAKE_Fortran_COMPILER_ID} STREQUAL "Intel" )
  set ( CMAKE_Fortran_FLAGS "-fpp -openmp -FR -xHost -ipo -ip -vec-report0 -trace" )
  set ( CMAKE_Fortran_FLAGS_RELEASE "-O3 -unroll" )
  set ( CMAKE_Fortran_FLAGS_DEBUG "-O1 -g -C -traceback -check all -debug all -fpe-model strict -fpe-all=0 –no-ftz" )

elseif ( ${CMAKE_Fortran_COMPILER_ID} STREQUAL "PGI" )
  set ( CMAKE_Fortran_FLAGS "-mp" )
  set ( CMAKE_Fortran_FLAGS_RELEASE "-O3 -Munroll -Mipa -Minline -Mvect " )
  set ( CMAKE_Fortran_FLAGS_DEBUG "-O1 -g -C -Mbounds -Mchkptr -Mchkstk -traceback -Ktrap=fp –Minform=inform" )

endif ()
