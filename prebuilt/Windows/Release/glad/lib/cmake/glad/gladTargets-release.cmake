#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "glad_gl" for configuration "Release"
set_property(TARGET glad_gl APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(glad_gl PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/glad_gl.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS glad_gl )
list(APPEND _IMPORT_CHECK_FILES_FOR_glad_gl "${_IMPORT_PREFIX}/lib/glad_gl.lib" )

# Import target "glad_gles2" for configuration "Release"
set_property(TARGET glad_gles2 APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(glad_gles2 PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/glad_gles2.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS glad_gles2 )
list(APPEND _IMPORT_CHECK_FILES_FOR_glad_gles2 "${_IMPORT_PREFIX}/lib/glad_gles2.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
