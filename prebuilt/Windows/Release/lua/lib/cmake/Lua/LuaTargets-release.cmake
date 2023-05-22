#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Lua" for configuration "Release"
set_property(TARGET Lua APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Lua PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/Lua.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS Lua )
list(APPEND _IMPORT_CHECK_FILES_FOR_Lua "${_IMPORT_PREFIX}/lib/Lua.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
