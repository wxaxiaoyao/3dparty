#!/bin/bash

IS_GITHUB=0
SOURCE_DIRECTORY="gitlab"
CURRENT_DIRECTORY=`pwd`
echo "${CURRENT_DIRECTORY}"

if [ "$1" == "github" ]; then
    IS_GITHUB=1
    SOURCE_DIRECTORY="github"
fi

if [ $IS_GITHUB -eq 0 ]; then
    echo "===============use gitlab====================="
else
    echo "===============use github====================="
fi 


download_source()
{
    repo_name=$1
    repo_url=$2
    repo_tag=$3

    echo "repo_name: ${repo_name}\nrepo_url=${repo_url}\nrepo_tag=${repo_tag}\n"
    echo ${repo_url}
    cd ${CURRENT_DIRECTORY}
    git submodule add ${repo_url} ${SOURCE_DIRECTORY}/${repo_name}
    cd ${SOURCE_DIRECTORY}/${repo_name}
    if [ "${repo_tag}" != "" ]; then
        git checkout -b ${repo_tag} tags/${repo_tag}
    fi
    cd ${CURRENT_DIRECTORY}
}

if [ $IS_GITHUB -eq 0 ]; then
    download_source "lua" "git@gitee.com:__xiaoyao__/lua.git" "v5.4.4"
    download_source "LuaBridge" "git@gitee.com:__xiaoyao__/LuaBridge.git" "2.6"
    download_source "luasocket" "git@gitee.com:__xiaoyao__/luasocket.git" "v3.1.0"
    download_source "glm" "git@gitee.com:__xiaoyao__/glm.git" "0.9.9.8"
    download_source "json" "git@gitee.com:__xiaoyao__/json.git" "v3.11.2"
    download_source "stb" "git@gitee.com:__xiaoyao__/stb.git" ""
    download_source "tinyxml2" "git@gitee.com:__xiaoyao__/tinyxml2.git" "9.0.0"
    download_source "SDL" "git@gitee.com:__xiaoyao__/SDL.git" "release-2.26.5"
    download_source "SDL_net" "git@gitee.com:__xiaoyao__/SDL_net.git" "release-2.2.0"
    download_source "cpp-httplib" "git@gitee.com:__xiaoyao__/cpp-httplib.git" "v0.12.2"
    download_source "assimp" "git@gitee.com:__xiaoyao__/assimp.git" "v5.2.5"  # 5.0.1
    download_source "openal-soft" "git@gitee.com:__xiaoyao__/openal-soft.git" "1.23.0"
    download_source "libsndfile" "git@gitee.com:__xiaoyao__/libsndfile.git" "1.2.0"
    download_source "zlib" "git@gitee.com:__xiaoyao__/zlib.git" "v1.2.12"
else
    download_source "lua" "git@github.com:lua/lua.git" "v5.4.4"
    download_source "LuaBridge" "git@github.com:vinniefalco/LuaBridge.git" "2.6"
    download_source "luasocket" "git@github.com:lunarmodules/luasocket.git" "v3.1.0"
    download_source "glm" "git@github.com:g-truc/glm.git" "0.9.9.8"
    download_source "json" "git@github.com:nlohmann/json.git" "v3.11.2"
    download_source "stb" "git@github.com:nothings/stb.git" ""
    download_source "tinyxml2" "git@github.com:leethomason/tinyxml2.git" "9.0.0"
    download_source "SDL" "git@github.com:libsdl-org/SDL.git" "release-2.26.5"
    download_source "SDL_net" "git@github.com:libsdl-org/SDL_net.git" "release-2.2.0"
    download_source "cpp-httplib" "git@github.com:yhirose/cpp-httplib.git" "v0.12.2"
    download_source "assimp" "git@github.com:assimp/assimp.git" "v5.2.5"
    download_source "openal-soft" "git@github.com:kcat/openal-soft.git" "1.23.0"
    download_source "libsndfile" "git@gitee.com:__xiaoyao__/libsndfile.git" "1.2.0"
    download_source "zlib" "git@github.com:madler/zlib.git.git" "v1.2.12"
fi 

# if [ $IS_GITHUB -eq 0 ]; then
#     git submodule add git@gitee.com:__xiaoyao__/lua.git ${SOURCE_DIRECTORY}/lua
# else
#     git submodule add git@github.com:lua/lua.git ${SOURCE_DIRECTORY}/lua
# fi 
# cd ${SOURCE_DIRECTORY}/lua
# # git tag -l
# git checkout -b v5.4.4 tags/v5.4.4
# cd ${CURRENT_DIRECTORY}

# if [ $IS_GITHUB -eq 0 ]; then
#     git submodule add git@gitee.com:__xiaoyao__/LuaBridge.git ${SOURCE_DIRECTORY}/LuaBridge
# else
#     git submodule add git@github.com:vinniefalco/LuaBridge.git ${SOURCE_DIRECTORY}/LuaBridge
# fi 
# cd ${SOURCE_DIRECTORY}/LuaBridge
# git checkout -b 2.8 tags/2.8
# cd ${CURRENT_DIRECTORY}

# git submodule add git@github.com:lunarmodules/luasocket.git luasocket
# # git submodule add git@gitee.com:__xiaoyao__/luasocket.git luasocket
# cd luasocket
# git checkout -b v3.1.0 tags/v3.1.0
# cd ${CURRENT_DIRECTORY}

# git submodule add git@github.com:g-truc/glm.git glm
# # git submodule add git@gitee.com:__xiaoyao__/glm.git  glm
# cd glm
# git checkout -b 0.9.9.8 tags/0.9.9.8
# cd ${CURRENT_DIRECTORY} 

# git submodule add git@github.com:nlohmann/json.git json
# # git submodule add git@gitee.com:__xiaoyao__/json.git json
# cd json
# git checkout -b v3.11.2 tags/v3.11.2
# cd ${CURRENT_DIRECTORY} 

# git submodule add git@github.com:nothings/stb.git stb
# # git submodule add git@gitee.com:__xiaoyao__/stb.git stb

# git submodule add git@github.com:leethomason/tinyxml2.git tinyxml2
# # git submodule add git@gitee.com:__xiaoyao__/tinyxml2.git tinyxml2
# cd tinyxml2
# git checkout -b 9.0.0 tags/9.0.0
# cd ${CURRENT_DIRECTORY} 

# git submodule add git@github.com:libsdl-org/SDL.git SDL
# # git submodule add git@gitee.com:__xiaoyao__/SDL.git SDL
# cd SDL
# git checkout -b release-2.26.5 tags/release-2.26.5
# cd ${CURRENT_DIRECTORY} 

# git submodule add git@github.com:libsdl-org/SDL_net.git SDL_net
# # git submodule add git@gitee.com:__xiaoyao__/SDL_net.git SDL_net
# cd SDL_net
# git checkout -b release-2.2.0 tags/release-2.2.0
# cd ${CURRENT_DIRECTORY} 

# git submodule add git@github.com:yhirose/cpp-httplib.git cpp-httplib
# # git submodule add git@gitee.com:__xiaoyao__/cpp-httplib.git  cpp-httplib
# cd  cpp-httplib
# git checkout -b v0.12.2 tags/v0.12.2
# cd ${CURRENT_DIRECTORY}

# git submodule add git@github.com:assimp/assimp.git assimp
# # git submodule add git@gitee.com:__xiaoyao__/assimp.git assimp
# cd  assimp
# # git checkout -b v5.2.5 tags/v5.2.5
# git checkout -b v5.0.1 tags/v5.0.1
# cd ${CURRENT_DIRECTORY}

# git submodule add git@github.com:kcat/openal-soft.git openal-soft
# # git submodule add git@gitee.com:__xiaoyao__/openal-soft.git openal-soft
# cd  openal-soft
# git checkout -b 1.23.0 tags/1.23.0
# cd ${CURRENT_DIRECTORY}

# git submodule add git@github.com:libsndfile/libsndfile.git libsndfile
# cd  libsndfile
# git checkout -b 1.2.0 tags/1.2.0
# cd ${CURRENT_DIRECTORY}

# git submodule add git@github.com:madler/zlib.git zlib
# cd  zlib
# git checkout -b v1.2.12 tags/v1.2.12
# cd ${CURRENT_DIRECTORY}


# git submodule update --init
# git submodule update --init path/to/submodule


# 删除子模块
# git rm --cached path/to/submodule
# 修改 .gitmodules 文件，将子模块的内容删除。
# rm -fr .git/moduels/path/to/submodule
