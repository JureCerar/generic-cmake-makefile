# Bring some colors in your life
# * Example: ${RED} This text is red ${NOR}

if ( NOT WIN32 )
  string ( ASCII 27 ESC )
  set ( NOR         "${ESC}[m" ) # color reset 
  set ( BOLD        "${ESC}[1m" )
  set ( RED         "${ESC}[31m")
  set ( GREEN       "${ESC}[32m")
  set ( YELLOW      "${ESC}[33m")
  set ( BLUE        "${ESC}[34m")
  set ( MAGENTA     "${ESC}[35m")
  set ( CYAN        "${ESC}[36m")
  set ( WHITE       "${ESC}[37m")
  set ( BOLDRED     "${ESC}[1;31m")
  set ( BOLDGREEN   "${ESC}[1;32m")
  set ( BOLDYELLOW  "${ESC}[1;33m")
  set ( BOLDBLUE    "${ESC}[1;34m")
  set ( BOLDMAGENTA "${ESC}[1;35m")
  set ( BOLDCYAN    "${ESC}[1;36m")
  set ( BOLDWHITE   "${ESC}[1;37m")

endif ()
