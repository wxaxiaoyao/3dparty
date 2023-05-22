# cmake 版本指定
cmake_minimum_required (VERSION 3.20.0)

# 项目名
project(glad VERSION 2.0.4 LANGUAGES "C")
add_library(glad_gl STATIC src/gl.c)
target_include_directories(glad_gl PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)
add_library(glad_gles2 STATIC src/gles2.c)
target_include_directories(glad_gles2 PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include)


# set_property(TARGET ${PROJECT_NAME} PROPERTY MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

install(FILES 
	${CMAKE_CURRENT_SOURCE_DIR}/include/glad/gl.h 
	${CMAKE_CURRENT_SOURCE_DIR}/include/glad/gles2.h 
	DESTINATION include/glad
)

install(FILES 
	${CMAKE_CURRENT_SOURCE_DIR}/include/KHR/khrplatform.h 
	DESTINATION include/KHR
)

# make install or cmake --install 
# 拷贝可执行文件和库文件,头文件到安装目录的bin|lib|include
install(TARGETS glad_gl glad_gles2
	EXPORT ${PROJECT_NAME}Targets
	ARCHIVE DESTINATION lib 
	LIBRARY DESTINATION lib 
	RUNTIME DESTINATION bin
)

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
)

# 安装配置文件到相应目录
install(FILES 
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION lib/cmake/${PROJECT_NAME}
)
