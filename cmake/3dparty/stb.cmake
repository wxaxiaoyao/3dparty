set(LIB_NAME "stb")

define_external_lib_variable(${LIB_NAME})
execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${${LIB_NAME_UPPER}_INTERFACE_INCLUDE_DIR})
execute_process(COMMAND ${CMAKE_COMMAND} -E make_directory ${${LIB_NAME_UPPER}_INTERFACE_INCLUDE_DIR})
file(GLOB HEADER_FILES "${${LIB_NAME_UPPER}_SOURCE_DIR}/*.h")
file(COPY ${HEADER_FILES} DESTINATION ${${LIB_NAME_UPPER}_INTERFACE_INCLUDE_DIR})

build_external_lib_only_header(${LIB_NAME})