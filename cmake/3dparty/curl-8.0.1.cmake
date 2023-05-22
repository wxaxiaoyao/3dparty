set(LIB_NAME "CURL")
set(${LIB_NAME}_DIRNAME "curl-8.0.1")
if (MSVC)
    if (DEBUG)
        set(${LIB_NAME}_INTERFACE_LIBRARY_NAME "libcurl-d")
    else()
        set(${LIB_NAME}_INTERFACE_LIBRARY_NAME "libcurl")
    endif()
else()
    if (DEBUG)
        set(${LIB_NAME}_INTERFACE_LIBRARY_NAME "curl-d")
    else()
        set(${LIB_NAME}_INTERFACE_LIBRARY_NAME "curl")
    endif()
endif()
list(APPEND ${LIB_NAME}_CONFIG "-DBUILD_SHARED_LIBS=OFF")
list(APPEND ${LIB_NAME}_CONFIG "-DCURL_ENABLE_SSL=OFF")
build_external_lib(${LIB_NAME})

# set(LIB_NAME CURL)
# set(LIB_DIRNAME curl-8.0.1)
# string(TOUPPER "${LIB_NAME}" LIB_NAME_UPPER)
# set(${LIB_NAME_UPPER}_INSTALL_DIRECTORY ${EXTERNAL_LIB_INSTALL_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_SOURCE_DIR ${EXTERNAL_LIB_SOURCE_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_CMAKE_DIR ${${LIB_NAME_UPPER}_SOURCE_DIR})
# set(${LIB_NAME_UPPER}_BUILD_DIR ${EXTERNAL_LIB_BUILD_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_BUILD_TYPE ${EXTERNAL_LIB_BUILD_TYPE})
# message("==================================BEGIN curl=============================")
# message("Install Directory: " ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY})
# message("Source Directory: " ${${LIB_NAME_UPPER}_SOURCE_DIR})
# message("Build Directory: " ${${LIB_NAME_UPPER}_BUILD_DIR})
# message("Cmake Directory: " ${${LIB_NAME_UPPER}_CMAKE_DIR})

# find_package(${LIB_NAME} PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} NO_DEFAULT_PATH)
# message("find_package: " ${${LIB_NAME}_FOUND})

# if (NOT ${LIB_NAME}_FOUND)
#     execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${${LIB_NAME_UPPER}_BUILD_DIR})
#     execute_process(COMMAND ${CMAKE_COMMAND} 
#         -S ${${LIB_NAME_UPPER}_CMAKE_DIR}
#         -B ${${LIB_NAME_UPPER}_BUILD_DIR}
#         -DCMAKE_INSTALL_PREFIX=${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}
#         -DCMAKE_BUILD_TYPE=${${LIB_NAME_UPPER}_BUILD_TYPE}
#         -DBUILD_SHARED_LIBS=OFF 
#     )
#     if (MSVC) 
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
#     else()
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR})
#     endif()
#     execute_process(COMMAND ${CMAKE_COMMAND} --install ${${LIB_NAME_UPPER}_BUILD_DIR}  --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
#     find_package(${LIB_NAME} CONFIG REQUIRED PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} NO_DEFAULT_PATH)
# endif()

# message("Include Directory: " ${${LIB_NAME}_INCLUDE_DIR})
# message("Libraries: " ${${LIB_NAME}_LIBRARIES})

# add_library(${LIB_NAME}_interface INTERFACE)
# target_include_directories(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/include)
# if (DEBUG)
#     target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib/${STATIC_LIB_PREFIX}curl-d${STATIC_LIB_SUFFIX})
# else()
#     target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib/${STATIC_LIB_PREFIX}curl${STATIC_LIB_SUFFIX})
# endif()
# add_external_lib(${LIB_NAME}_interface)
# add_external_macro_define(-DUSE_CURL)