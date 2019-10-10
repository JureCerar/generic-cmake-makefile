! Define program name and version
#define _PROGRAM "@CMAKE_PROJECT_NAME@"
#define _VERSION "v@PROJECT_VERSION@"

program main
  implicit none
  write (*,*) "Hello World!", _PROGRAM, _VERSION

end program main
