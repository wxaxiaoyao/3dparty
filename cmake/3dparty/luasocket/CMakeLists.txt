cmake_minimum_required (VERSION 3.20.0)

project(LuaSocket VERSION 3.1.0 LANGUAGES C)

if (MSVC OR WIN32)
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_CURRENT_BINARY_DIR}/lib)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_CURRENT_BINARY_DIR}/lib)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_CURRENT_BINARY_DIR}/bin)
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_CURRENT_BINARY_DIR}/lib)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_CURRENT_BINARY_DIR}/lib)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_CURRENT_BINARY_DIR}/bin)
else()
	set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
	set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
	set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bin)
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED true)

if (LINUX)
	add_definitions(-DLUASOCKET_DEBUG)
elseif(MACOS OR IOS)
	add_definitions(-DLUASOCKET_DEBUG)
	add_definitions(-DUNIX_HAS_SUN_LEN)
elseif(WIN32)
	add_definitions(-DLUASOCKET_DEBUG)
	add_definitions(-DNDEBUG)
	if (MINGW32)
		add_definitions(-DWINVER=0x0501)
	endif()
else()
endif()

message("SOURCE_CODE_DIR =>" ${SOURCE_CODE_DIR})
message("LUA_INCLUDE_DIR: " ${LUA_INCLUDE_DIR})

# 设置源码目录
if (NOT SOURCE_CODE_DIR)
	message(FATAL_ERROR "SOURCE_CODE_DIR NOT DEFINE!!!")
endif()

list(APPEND SOCKET_SRC_FILES
	${SOURCE_CODE_DIR}/luasocket.c
	${SOURCE_CODE_DIR}/timeout.c
	${SOURCE_CODE_DIR}/buffer.c
	${SOURCE_CODE_DIR}/io.c
	${SOURCE_CODE_DIR}/auxiliar.c
	${SOURCE_CODE_DIR}/compat.c
	${SOURCE_CODE_DIR}/options.c
	${SOURCE_CODE_DIR}/inet.c
	${SOURCE_CODE_DIR}/except.c
	${SOURCE_CODE_DIR}/select.c
	${SOURCE_CODE_DIR}/tcp.c
	${SOURCE_CODE_DIR}/udp.c
)
if (MSVC OR WIN32)
	list(APPEND SOCKET_SRC_FILES ${SOURCE_CODE_DIR}/wsocket.c)
else()
	list(APPEND SOCKET_SRC_FILES ${SOURCE_CODE_DIR}/usocket.c)
endif()

list(APPEND MIME_SRC_FILES
	${SOURCE_CODE_DIR}/mime.c
	${SOURCE_CODE_DIR}/compat.c
)

add_library(${PROJECT_NAME} STATIC ${SOCKET_SRC_FILES} ${MIME_SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE ${LUA_INCLUDE_DIR})

list(APPEND UNIX_SRC_FILE_LIST
	${SOURCE_CODE_DIR}/buffer.c
	${SOURCE_CODE_DIR}/auxiliar.c
	${SOURCE_CODE_DIR}/options.c
	${SOURCE_CODE_DIR}/timeout.c
	${SOURCE_CODE_DIR}/io.c
	${SOURCE_CODE_DIR}/usocket.c
	${SOURCE_CODE_DIR}/unixstream.c
	${SOURCE_CODE_DIR}/unixdgram.c
	${SOURCE_CODE_DIR}/compat.c
	${SOURCE_CODE_DIR}/unix.c
)

list(APPEND SERIAL_SRC_FILE_LIST
	${SOURCE_CODE_DIR}/buffer.c
	${SOURCE_CODE_DIR}/compat.c
	${SOURCE_CODE_DIR}/auxiliar.c
	${SOURCE_CODE_DIR}/options.c
	${SOURCE_CODE_DIR}/timeout.c
	${SOURCE_CODE_DIR}/io.c
	${SOURCE_CODE_DIR}/usocket.c
	${SOURCE_CODE_DIR}/serial.c
)

install(FILES
	${SOURCE_CODE_DIR}/ltn12.lua
	${SOURCE_CODE_DIR}/socket.lua
	${SOURCE_CODE_DIR}/mime.lua
	DESTINATION lua
)

install(FILES
	${SOURCE_CODE_DIR}/http.lua 
	${SOURCE_CODE_DIR}/url.lua 
	${SOURCE_CODE_DIR}/tp.lua 
	${SOURCE_CODE_DIR}/ftp.lua 
	${SOURCE_CODE_DIR}/headers.lua 
	${SOURCE_CODE_DIR}/smtp.lua
	DESTINATION lua/scoket
)

# make install or cmake --install 
# 拷贝可执行文件和库文件,头文件到安装目录的bin|lib|include
install(TARGETS ${PROJECT_NAME}
	EXPORT ${PROJECT_NAME}Targets
	ARCHIVE DESTINATION lib 
	LIBRARY DESTINATION lib 
	RUNTIME DESTINATION bin
)

# 识别静态库后缀名
if (MSVC OR WIN32) 
    set(LUASOCKET_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/${PROJECT_NAME}.lib)
else()
    set(LUASOCKET_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/lib${PROJECT_NAME}.a)
endif()

# 设置头文件目录和库路径以便传递给LuaConfig.cmake

# 生成版本兼容配置
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	VERSION ${PACKAGE_VERSION}
	COMPATIBILITY SameMajorVersion
)

# 安装导出目标CMake
install(EXPORT ${PROJECT_NAME}Targets
	FILE ${PROJECT_NAME}Targets.cmake
	DESTINATION lib/cmake/${PROJECT_NAME}
)

# 生成配置文件LuaConfig.cmake
configure_package_config_file(
	Config.cmake.in ${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION lib/cmake/${PROJECT_NAME}
	PATH_VARS LUASOCKET_LIBRARIES
)

# 安装配置文件到相应目录
install(FILES 
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION lib/cmake/${PROJECT_NAME}
)
