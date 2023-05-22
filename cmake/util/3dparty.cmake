
# Lua
include("lua")

# LuaBridge
include("luabridge")

# LuaSocket
include("luasocket")

# GLM
include("glm")

# json
include("json")

# stb
include("stb")

# tinyxml2
include("tinyxml2")

# SDL2
include("sdl")

# HTTPLIB
include("cpp-httplib")

# assimp
include("assimp")

# glad
include("glad")

# # zlib
# include("zlib")

# # OPENAL
# if (USE_OPENAL)
#     include(libsndfile-1.2.0)
#     include(openal-soft-1.23.0)
# endif()

# OPENGL
# if (USE_OPENGL)
#     include(glad)
# endif()

# # if (USE_SDL_MIXER) 
#     include(${EXTERNAL_LIB_SOURCE_DIRECTORY}/cmake/sdl2_mixer-2.6.3.cmake)
# endif()

# # FREETYPE
# if (USE_FREETYPE)
#     if (EMSCRIPTEN)
#         set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -sUSE_FREETYPE=1")
#     else()
#         include(${EXTERNAL_LIB_SOURCE_DIRECTORY}/cmake/freetype-2.12.0.cmake)
#     endif()
# endif()

# # zlib
# if (USE_ZLIB)
#     if (EMSCRIPTEN)
#         set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -sUSE_ZLIB=1")
#     else()
#         include(${EXTERNAL_LIB_SOURCE_DIRECTORY}/cmake/zlib-1.2.12.cmake)
#     endif()
# endif()

