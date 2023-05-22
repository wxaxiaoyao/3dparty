#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "LuaSocket" for configuration "Release"
set_property(TARGET LuaSocket APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(LuaSocket PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/LuaSocket.lib"
  )

list(APPEND _IMPORT_CHECK_TARGETS LuaSocket )
list(APPEND _IMPORT_CHECK_FILES_FOR_LuaSocket "${_IMPORT_PREFIX}/lib/LuaSocket.lib" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
