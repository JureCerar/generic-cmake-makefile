cmake_minimum_required ( VERSION 2.8.8 )
project ( a.out LANGUAGES Fortran )

# Add /cmake subdirectory
list ( APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" )

# Set project Info, make Public, set Version and define Compiler flags
include ( Colors )
include ( SetVersion )
include ( FindPackages )
include ( SetCompilerFlags )

# Main build script
add_subdirectory ( src )

# Tests
enable_testing ()
add_subdirectory ( examples )
