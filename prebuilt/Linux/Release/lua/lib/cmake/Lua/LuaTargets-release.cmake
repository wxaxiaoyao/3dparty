#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "Lua" for configuration "Release"
set_property(TARGET Lua APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(Lua PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libLua.a"
  )

list(APPEND _cmake_import_check_targets Lua )
list(APPEND _cmake_import_check_files_for_Lua "${_IMPORT_PREFIX}/lib/libLua.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
