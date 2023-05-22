
cmake_minimum_required(VERSION 3.20.0)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)

project(3dparty)

# 指定模块目录
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/util)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/3dparty)
# # 包含全局模块
include(variables)
# # 包含通用模块
include(common)
# # 包含第三方库模块
include(3dparty)

# https://learn.microsoft.com/zh-cn/cpp/build/cmake-presets-vs?view=msvc-170
