
set(LIB_NAME freetype)
set(LIB_DIRNAME freetype-2.12.0)
string(TOUPPER "${LIB_NAME}" LIB_NAME_UPPER)
set(${LIB_NAME_UPPER}_INSTALL_DIRECTORY ${EXTERNAL_LIB_INSTALL_DIRECTORY}/${LIB_DIRNAME})
set(${LIB_NAME_UPPER}_SOURCE_DIR ${EXTERNAL_LIB_SOURCE_DIRECTORY}/${LIB_DIRNAME})
set(${LIB_NAME_UPPER}_CMAKE_DIR ${${LIB_NAME_UPPER}_SOURCE_DIR})
set(${LIB_NAME_UPPER}_BUILD_DIR ${EXTERNAL_LIB_BUILD_DIRECTORY}/${LIB_DIRNAME})
set(${LIB_NAME_UPPER}_BUILD_TYPE ${EXTERNAL_LIB_BUILD_TYPE})
message("==================================BEGIN freetype=============================")
message("Install Directory: " ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY})
message("Source Directory: " ${${LIB_NAME_UPPER}_SOURCE_DIR})
message("Build Directory: " ${${LIB_NAME_UPPER}_BUILD_DIR})
message("Cmake Directory: " ${${LIB_NAME_UPPER}_CMAKE_DIR})
find_package(${LIB_NAME} PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} NO_DEFAULT_PATH)
message("find_package: " ${${LIB_NAME}_FOUND})

if (NOT ${LIB_NAME}_FOUND)
    execute_process(COMMAND ${CMAKE_COMMAND} -E remove_directory ${${LIB_NAME_UPPER}_BUILD_DIR})
    execute_process(COMMAND ${CMAKE_COMMAND} 
        -S ${${LIB_NAME_UPPER}_CMAKE_DIR}
        -B ${${LIB_NAME_UPPER}_BUILD_DIR}
        -DCMAKE_INSTALL_PREFIX=${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}
        -DCMAKE_BUILD_TYPE=${${LIB_NAME_UPPER}_BUILD_TYPE}
        -DFT_DISABLE_HARFBUZZ=ON
        -DFT_DISABLE_BROTLI=ON
        -DFT_DISABLE_PNG=ON
        -DFT_DISABLE_BZIP2=ON
        -DFT_DISABLE_ZLIB=OFF
        -DBUILD_SHARED_LIBS=OFF 
        -DZLIB_FOUND=${ZLIB_FOUND}
        -DZLIB_LIBRARY=${ZLIB_LIBRARY}
        -DZLIB_INCLUDE_DIR=${ZLIB_INCLUDE_DIR}
    )
    if (MSVC) 
        execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR} --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
    else()
        execute_process(COMMAND ${CMAKE_COMMAND} --build ${${LIB_NAME_UPPER}_BUILD_DIR})
    endif()
    execute_process(COMMAND ${CMAKE_COMMAND} --install ${${LIB_NAME_UPPER}_BUILD_DIR}  --config ${${LIB_NAME_UPPER}_BUILD_TYPE})
    find_package(${LIB_NAME} CONFIG REQUIRED PATHS ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY} NO_DEFAULT_PATH)
endif()

message("Include Directory: " ${${LIB_NAME}_INCLUDE_DIR})
message("Libraries: " ${${LIB_NAME}_LIBRARIES})

add_library(${LIB_NAME}_interface INTERFACE)
target_include_directories(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/include/freetype2)
if (DEBUG)
    target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib/freetyped.lib)
else()
    target_link_libraries(${LIB_NAME}_interface INTERFACE ${${LIB_NAME_UPPER}_INSTALL_DIRECTORY}/lib/freetype.lib)
endif()
add_external_lib(${LIB_NAME}_interface)
add_external_macro_define(-DUSE_FREETYPE)

message("==================================END freetype=============================")
