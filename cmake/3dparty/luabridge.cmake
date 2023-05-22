

set(LIB_NAME "LuaBridge")
set(${LIB_NAME}_DIRNAME "LuaBridge")

define_external_lib_variable(${LIB_NAME})
execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${${LIB_NAME_UPPER}_INTERFACE_INCLUDE_DIR})
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${${LIB_NAME_UPPER}_INTERFACE_INCLUDE_DIR}/LuaBridge)
execute_process(COMMAND ${CMAKE_COMMAND} -E copy_directory ${${LIB_NAME_UPPER}_SOURCE_DIR}/Source/LuaBridge ${${LIB_NAME_UPPER}_INTERFACE_INCLUDE_DIR}/LuaBridge)

build_external_lib_only_header(${LIB_NAME})
