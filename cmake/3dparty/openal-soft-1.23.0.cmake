
set(LIB_NAME "OpenAL")
set(${LIB_NAME}_DIRNAME "openal-soft-1.23.0")
list(APPEND ${LIB_NAME}_CONFIG "-DLIBTYPE=STATIC")
list(APPEND ${LIB_NAME}_INTERFACE_MACRO_DEFINITIONS AL_LIBTYPE_STATIC)
if (MSVC)
    set(${LIB_NAME}_INTERFACE_LIBRARY_NAME "${LIB_NAME}32")
else()
    set(${LIB_NAME}_INTERFACE_LIBRARY_NAME "openal")
endif()
if (EMSCRIPTEN)
    add_link_options(-lopenal)
    add_compile_definitions(USE_OPENAL)
else()
    build_external_lib(${LIB_NAME})
endif()

# set(LIB_NAME OpenAL)
# set(LIB_DIRNAME openal-soft-1.23.0)
# string(TOUPPER "${LIB_NAME}" LIB_NAME_UPPER)
# set(${LIB_NAME_UPPER}_INSTALL_DIRECTORY ${EXTERNAL_LIB_INSTALL_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_SOURCE_DIR ${EXTERNAL_LIB_SOURCE_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_CMAKE_DIR ${${LIB_NAME_UPPER}_SOURCE_DIR})
# set(${LIB_NAME_UPPER}_BUILD_DIR ${EXTERNAL_LIB_BUILD_DIRECTORY}/${LIB_DIRNAME})
# set(${LIB_NAME_UPPER}_BUILD_TYPE ${EXTERNAL_LIB_BUILD_TYPE})
# message("==================================BEGIN OPENAL=============================")
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
#         -DLIBTYPE=STATIC 
#     )
#     if (MSVC) 
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
#     else()
#         execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR})
#     endif()
#     execute_process(COMMAND ${CMAKE_COMMAND} --install ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
#     find_package(${LIB_NAME} CONFIG REQUIRED PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} NO_DEFAULT_PATH)
# endif()

# message("Include Directory: " ${OPENAL_INCLUDE_DIR})
# message("Libraries: " ${OPENAL_LIBRARY})

# add_library(${LIB_NAME}_interface INTERFACE)
# target_include_directories(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/include)
# if (MSVC)
#     target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib/${STATIC_LIB_PREFIX}${LIB_NAME}32${STATIC_LIB_SUFFIX})
# else()
#     target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib/${STATIC_LIB_PREFIX}openal${STATIC_LIB_SUFFIX})
# endif()
# add_external_lib(${LIB_NAME}_interface)
# add_external_macro_define(-DUSE_SDL_MIXER)

# message("==================================END OPENAL=============================")



