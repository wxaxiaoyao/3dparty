cmake_minimum_required (VERSION 3.20.0)

# 项目名称
project(Lua VERSION 5.4.4 LANGUAGES "C")

# 设置源码目录
if (NOT SOURCE_CODE_DIR)
	message(FATAL_ERROR "SOURCE_CODE_DIR NOT DEFINE!!!")
endif()

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

# 核心源码文件
list(APPEND CORE_SRC_FILES 
	${SOURCE_CODE_DIR}/lapi.c 
	${SOURCE_CODE_DIR}/lcode.c
	${SOURCE_CODE_DIR}/lctype.c
	${SOURCE_CODE_DIR}/ldebug.c
	${SOURCE_CODE_DIR}/ldo.c
	${SOURCE_CODE_DIR}/ldump.c
	${SOURCE_CODE_DIR}/lfunc.c
	${SOURCE_CODE_DIR}/lgc.c
	${SOURCE_CODE_DIR}/llex.c
	${SOURCE_CODE_DIR}/lmem.c
	${SOURCE_CODE_DIR}/lobject.c
	${SOURCE_CODE_DIR}/lopcodes.c
	${SOURCE_CODE_DIR}/lparser.c
	${SOURCE_CODE_DIR}/lstate.c
	${SOURCE_CODE_DIR}/lstring.c
	${SOURCE_CODE_DIR}/ltable.c
	${SOURCE_CODE_DIR}/ltm.c
	${SOURCE_CODE_DIR}/lundump.c
	${SOURCE_CODE_DIR}/lvm.c
	${SOURCE_CODE_DIR}/lzio.c
)

# 库源码文件
list(APPEND LIB_SRC_FILES 
	${SOURCE_CODE_DIR}/lauxlib.c
	${SOURCE_CODE_DIR}/lauxlib.c
	${SOURCE_CODE_DIR}/lbaselib.c
	${SOURCE_CODE_DIR}/lcorolib.c
	${SOURCE_CODE_DIR}/ldblib.c
	${SOURCE_CODE_DIR}/liolib.c
	${SOURCE_CODE_DIR}/lmathlib.c
	${SOURCE_CODE_DIR}/loadlib.c
	${SOURCE_CODE_DIR}/loslib.c
	${SOURCE_CODE_DIR}/lstrlib.c
	${SOURCE_CODE_DIR}/ltablib.c
	${SOURCE_CODE_DIR}/lutf8lib.c
	${SOURCE_CODE_DIR}/linit.c
	${SOURCE_CODE_DIR}/lbaselib.c
	${SOURCE_CODE_DIR}/lcorolib.c
	${SOURCE_CODE_DIR}/ldblib.c
	${SOURCE_CODE_DIR}/liolib.c
	${SOURCE_CODE_DIR}/lmathlib.c
	${SOURCE_CODE_DIR}/loadlib.c
	${SOURCE_CODE_DIR}/loslib.c
	${SOURCE_CODE_DIR}/lstrlib.c
	${SOURCE_CODE_DIR}/ltablib.c
	${SOURCE_CODE_DIR}/lutf8lib.c
	${SOURCE_CODE_DIR}/linit.c
)

# 添加静态库木目标 liblua.a
add_library(${PROJECT_NAME} STATIC ${CORE_SRC_FILES} ${LIB_SRC_FILES})
# 导出头文件目录
# target_include_directories(${PROJECT_NAME} PUBLIC ${SOURCE_CODE_DIR})

# 设置静态库属性
# if (MSVC)
# 	set_property(TARGET lua PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
# endif()

# if (EMSCRIPTEN)
# 	install(TARGETS ${PROJECT_NAME}
# 	EXPORT ${PROJECT_NAME}Targets
# 	ARCHIVE DESTINATION lib 
# 	LIBRARY DESTINATION lib 
# 	RUNTIME DESTINATION bin
# 	# PUBLIC_HEADER DESTINATION include
# 	)
# else()
	# 添加可执行文件lua
	# add_executable(lua-exe ${SOURCE_CODE_DIR}/lua.c)
	# if (WIN32)
	# 	target_link_libraries(lua-exe PUBLIC ${PROJECT_NAME})
	# else()
	# 	target_link_libraries(lua-exe PUBLIC ${PROJECT_NAME} m)
	# endif()
	# #add_custom_command(TARGET lua-exe POST_BUILD COMMAND ${CMAKE_COMMAND} -E rename ${CMAKE_CURRENT_BINARY_DIR}/lua-exe ${CMAKE_CURRENT_BINARY_DIR}/lua)

	# # 添加可执行文件luac
	# add_executable(luac ${SOURCE_CODE_DIR}/luac.c)
	# if (WIN32)
	# 	target_link_libraries(luac PUBLIC ${PROJECT_NAME})
	# else()
	# 	target_link_libraries(luac PUBLIC ${PROJECT_NAME} m)
	# endif()

	# # make install or cmake --install 
	# # 拷贝可执行文件和库文件,头文件到安装目录的bin|lib|include
	# install(TARGETS ${PROJECT_NAME} luac lua-exe
	# 	EXPORT ${PROJECT_NAME}Targets
	# 	ARCHIVE DESTINATION lib 
	# 	LIBRARY DESTINATION lib 
	# 	RUNTIME DESTINATION bin
	# 	# PUBLIC_HEADER DESTINATION include
	# )
# endif()

# 拷贝可执行文件和库文件,头文件到安装目录的bin|lib|include
install(TARGETS ${PROJECT_NAME}
	EXPORT ${PROJECT_NAME}Targets
	ARCHIVE DESTINATION lib 
	LIBRARY DESTINATION lib 
	RUNTIME DESTINATION bin
	# PUBLIC_HEADER DESTINATION include
)

# 安装头文件
install(FILES 
	${SOURCE_CODE_DIR}/lua.h 
	${SOURCE_CODE_DIR}/luaconf.h 
	${SOURCE_CODE_DIR}/lualib.h 
	${SOURCE_CODE_DIR}/lauxlib.h 
	DESTINATION include
)
	
# 设置头文件目录和库路径以便传递给LuaConfig.cmake
set(LUA_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)

if (MSVC OR WIN32) 
	set(LUA_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/lua.lib)
else()
	set(LUA_LIBRARIES ${CMAKE_INSTALL_PREFIX}/lib/liblua.a)
endif()

# 生成版本兼容配置
include(CMakePackageConfigHelpers)
write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	VERSION ${PACKAGE_VERSION}
	COMPATIBILITY AnyNewerVersion
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
	PATH_VARS LUA_INCLUDE_DIR LUA_LIBRARIES
)

# 安装配置文件到相应目录
install(FILES 
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION lib/cmake/${PROJECT_NAME}
)

# extern "C" {
# 	#include "lua.h"
# 	#include "lualib.h"
# 	#include "lauxlib.h"
# 	}
	