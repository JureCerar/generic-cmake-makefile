## 0. Find all source files
file ( GLOB "FILES" RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*.f90" )

# Preprocess every source file
foreach ( "FILE" ${FILES} )
  configure_file ( ${FILE} "${PROJECT_BINARY_DIR}/src/${FILE}" )
  set ( SRC "${PROJECT_BINARY_DIR}/src/${FILE}" ${SRC} )

endforeach ()

# Include preprocessed source files
include_directories ( "${PROJECT_BINARY_DIR}/src" )

## 1. Compile ...
add_executable ( ${CMAKE_PROJECT_NAME} ${SRC} )
set_target_properties ( ${PROJECT_NAME}
  PROPERTIES
  RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}"
  Fortran_MODULE_DIRECTORY "${CMAKE_BINARY_DIR}/include"
)

# Include Fortran .mod files
target_include_directories ( ${CMAKE_PROJECT_NAME} PUBLIC "${CMAKE_BINARY_DIR}/include")

# Add any external definition
if ( CMAKE_BUILD_TYPE EQUAL "DEBUG" )
  add_definitions ( -D_DEBUG=.TRUE. )
endif ()


## 2. Link libraries ...
# target_link_libraries( ${CMAKE_PROJECT_NAME} ${xslib_LIBRARIES} )
# target_link_libraries( ${CMAKE_PROJECT_NAME} ${CUDA_CUDART_LIBRARY} )


## 3. Install ...

# Define default install directory
if ( NOT INSTALL_DIR )
  set ( INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/bin" )
endif ()

# Install program
message ( STATUS "Binaries will be installed to: ${INSTALL_DIR}" )
install ( TARGETS ${CMAKE_PROJECT_NAME} RUNTIME DESTINATION "${INSTALL_DIR}" )
