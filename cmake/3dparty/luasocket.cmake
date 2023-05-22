
set(LIB_NAME "LuaSocket")
set(${LIB_NAME}_DIRNAME "luasocket")
set(${LIB_NAME}_CMAKE_DIR "${EXTERNAL_LIB_CMAKE_DIRECTORY}/${${LIB_NAME}_DIRNAME}")
set(${LIB_NAME}_SOURCE_DIR "${EXTERNAL_LIB_SOURCE_DIRECTORY}/${${LIB_NAME}_DIRNAME}/src")
list(APPEND ${LIB_NAME}_CONFIG "-DSOURCE_CODE_DIR=${${LIB_NAME}_SOURCE_DIR}")
list(APPEND ${LIB_NAME}_CONFIG "-DLUA_INCLUDE_DIR=${LUA_INSTALL_DIRECTORY}/include")
build_external_lib(${LIB_NAME})
