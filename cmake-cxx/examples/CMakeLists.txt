# List all test
add_test (
  NAME test
  COMMAND ${CMAKE_PROJECT_NAME} --arguments
)

# Copy over files needed for running the tests
# configure_file ( file.txt ${CMAKE_CURRENT_BINARY_DIR}/file.txt COPYONLY )

# Copy over whole directory for running the tests
# file ( COPY "${CMAKE_CURRENT_SOURCE_DIR}/files/" DESTINATION ${CMAKE_CURRENT_BINARY_DIR} )
