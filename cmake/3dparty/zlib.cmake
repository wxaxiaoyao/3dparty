set(LIB_NAME "zlib")
set(${LIB_NAME}_DIRNAME "zlib")
list(APPEND ${LIB_NAME}_CONFIG "-DBUILD_SHARED_LIBS=OFF")
build_external_lib(${LIB_NAME})

# set(LIB_NAME zlib)
# set(LIB_DIRNAME zlib)
# string(TOUPPER "${LIB_NAME}" LIB_NAME_UPPER)
# set(${LIB_NAME_UPPER}_INSTALL_DIRECTORY ${EXTERNAL_LIB_INSTALL_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_SOURCE_DIR ${EXTERNAL_LIB_SOURCE_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_CMAKE_DIR ${${LIB_NAME_UPPER}_SOURCE_DIR})
# set(${LIB_NAME_UPPER}_BUILD_DIR ${EXTERNAL_LIB_BUILD_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_BUILD_TYPE ${EXTERNAL_LIB_BUILD_TYPE})
# message("==================================BEGIN zlib=============================")
# message("Install Directory: " ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY})
# message("Source Directory: " ${${LIB_NAME_UPPER}_SOURCE_DIR})
# message("Build Directory: " ${${LIB_NAME_UPPER}_BUILD_DIR})
# message("Cmake Directory: " ${${LIB_NAME_UPPER}_CMAKE_DIR})
# find_path(${LIB_NAME}_INCLUDE_DIR NAMES zlib.h PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/include NO_DEFAULT_PATH)
# if (DEBUG)
#     find_library(${LIB_NAME}_LIBRARIES NAMES zlibstaticd.lib PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib NO_DEFAULT_PATH)
# else()
#     find_library(${LIB_NAME}_LIBRARIES NAMES zlibstatic.lib PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib NO_DEFAULT_PATH)
# endif()
# if ("${${LIB_NAME}_INCLUDE_DIR}" STREQUAL "${LIB_NAME}_INCLUDE_DIR-NOTFOUND" OR "${${LIB_NAME}_LIBRARIES}" STREQUAL "${LIB_NAME}_LIBRARIES-NOTFOUND")
#     message("build zlib")
#     execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${${LIB_NAME_UPPER}_BUILD_DIR})
#     execute_process(COMMAND ${CMAKE_COMMAND} 
#         -S ${${LIB_NAME_UPPER}_CMAKE_DIR} 
#         -B ${${LIB_NAME_UPPER}_BUILD_DIR}
#         -DCMAKE_INSTALL_PREFIX=${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} 
#         -DCMAKE_BUILD_TYPE=${EXTERNAL_LIB_BUILD_TYPE}
#         -DBUILD_SHARED_LIBS=OFF 
#     )
#     if (MSVC) 
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${EXTERNAL_LIB_BUILD_TYPE})
#     else()
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR})
#     endif()
#     execute_process(COMMAND ${CMAKE_COMMAND} --install ${${LIB_NAME_UPPER}_BUILD_DIR}  --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
# endif()
# find_path(${LIB_NAME}_INCLUDE_DIR NAMES zlib.h PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/include NO_DEFAULT_PATH)
# if (DEBUG)
#     find_library(${LIB_NAME}_LIBRARIES NAMES zlibstaticd.lib PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib NO_DEFAULT_PATH)
# else()
#     find_library(${LIB_NAME}_LIBRARIES NAMES zlibstatic.lib PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib NO_DEFAULT_PATH)
# endif()
# if ("${${LIB_NAME}_INCLUDE_DIR}" STREQUAL "${LIB_NAME}_INCLUDE_DIR-NOTFOUND" OR "${${LIB_NAME}_LIBRARIES}" STREQUAL "${LIB_NAME}_LIBRARIES-NOTFOUND")
#     set(ZLIB_FOUND FALSE)
# else()
#     set(ZLIB_FOUND TRUE)
# endif()

# message("Include Directory: " ${${LIB_NAME}_INCLUDE_DIR})
# message("Libraries: " ${${LIB_NAME}_LIBRARIES})

# add_library(${LIB_NAME}_interface INTERFACE)
# target_include_directories(${LIB_NAME}_interface INTERFACE ${${LIB_NAME}_INCLUDE_DIR})
# target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME}_LIBRARIES})
# add_external_lib(${LIB_NAME}_interface)
# add_external_macro_define(-DUSE_ZLIB)

# message("==================================END zlib=============================")


# set(LIB_NAME zlib)
# string(TOUPPER "${LIB_NAME}" LIB_NAME_UPPER)
# set(LIB_DIRNAME zlib-1.2.12)
# set(${LIB_NAME_UPPER}_INSTALL_DIRECTORY ${EXTERNAL_LIB_INSTALL_DIRECTORY}/${LIB_DIRNAME})
# find_path(${LIB_NAME_UPPER}_INCLUDE_DIRS NAMES zlib.h PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/include NO_DEFAULT_PATH)
# if (DEBUG)
#     find_library(${LIB_NAME_UPPER}_LIBRARIES NAMES zlibstaticd.lib PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib NO_DEFAULT_PATH)
# else()
#     find_library(${LIB_NAME_UPPER}_LIBRARIES NAMES zlibstatic.lib PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib NO_DEFAULT_PATH)
# endif()
# if ("${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}" STREQUAL "${LIB_NAME_UPPER}_INSTALL_DIRECTORY-NOTFOUND" OR "${${LIB_NAME_UPPER}_LIBRARIES}" STREQUAL "${LIB_NAME_UPPER}_LIBRARIES-NOTFOUND")
#     set(${LIB_NAME_UPPER}_SRC_DIR ${EXTERNAL_LIB_SOURCE_DIRECTORY}/${LIB_DIRNAME})
#     set(${LIB_NAME_UPPER}_BUILD_DIR ${EXTERNAL_LIB_BUILD_DIRECTORY}/${LIB_DIRNAME})
#     execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${${LIB_NAME_UPPER}_BUILD_DIR})
#     execute_process(COMMAND ${CMAKE_COMMAND} 
#         -S ${${LIB_NAME_UPPER}_SRC_DIR} 
#         -B ${${LIB_NAME_UPPER}_BUILD_DIR}
#         -DCMAKE_INSTALL_PREFIX=${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} 
#         -DCMAKE_BUILD_TYPE=${EXTERNAL_LIB_BUILD_TYPE}
#         -DBUILD_SHARED_LIBS=OFF 
#     )
#     if (MSVC) 
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${EXTERNAL_LIB_BUILD_TYPE})
#     else()
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR})
#     endif()
#     execute_process(COMMAND ${CMAKE_COMMAND} --install ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${EXTERNAL_LIB_BUILD_TYPE})
# endif()
# message("\nLIB_NAME=" ${LIB_NAME} " FOUND=" ${${LIB_NAME}_FOUND})
# message("INSTALL_DIRECTORY=" ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY})
# message("INCLUDE_DIRS=" ${${LIB_NAME_UPPER}_INCLUDE_DIRS})
# message("LIBRARIES=" ${${LIB_NAME_UPPER}_LIBRARIES})
# add_library(${LIB_NAME} INTERFACE)
# target_include_directories(${LIB_NAME} INTERFACE ${${LIB_NAME_UPPER}_INCLUDE_DIRS})
# target_link_libraries(${LIB_NAME} INTERFACE ${${LIB_NAME_UPPER}_LIBRARIES})
# set(${LIB_NAME_UPPER}_FOUND TRUE)
# set(${LIB_NAME_UPPER}_LIBRARY ${${LIB_NAME_UPPER}_LIBRARIES})
# set(${LIB_NAME_UPPER}_INCLUDE_DIR ${${LIB_NAME_UPPER}_INCLUDE_DIRS})