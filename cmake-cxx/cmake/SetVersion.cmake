# Get program version definition in .VERSION file
file ( STRINGS "${CMAKE_SOURCE_DIR}/.VERSION" VERSION )
string ( REPLACE "." ";" VERSION_LIST ${VERSION} )
list ( GET VERSION_LIST 0 VERSION_MAJOR )
list ( GET VERSION_LIST 1 VERSION_MINOR )
list ( GET VERSION_LIST 2 VERSION_PATCH )
set ( PROJECT_VERSION "${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}" )

# Message back info
message ( STATUS "CMake build configuration for ${CMAKE_PROJECT_NAME} -- ${PROJECT_VERSION}" )
