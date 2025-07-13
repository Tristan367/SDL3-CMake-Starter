cmake_minimum_required(VERSION 3.20)
project(app LANGUAGES CXX)

# C++ Standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)

# SDL3
FetchContent_Declare(
  SDL3
  GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
  GIT_TAG origin/main
)
FetchContent_MakeAvailable(SDL3)

# GLM
FetchContent_Declare(
  glm
  GIT_REPOSITORY https://github.com/g-truc/glm.git
  GIT_TAG master
)
FetchContent_MakeAvailable(glm)

# stb_image
FetchContent_Declare(
  stb
  GIT_REPOSITORY https://github.com/nothings/stb.git
  GIT_TAG master
)
FetchContent_MakeAvailable(stb)

# Executable
add_executable(app
  src/main.cpp
)

# stb implementation definition
target_compile_definitions(app PRIVATE STB_IMAGE_IMPLEMENTATION)

# Include directories (GLM and stb are header-only)
target_include_directories(app PRIVATE
  ${glm_SOURCE_DIR}
  ${stb_SOURCE_DIR}
)

# Link SDL3 (includes headers, compile flags, and libraries)
target_link_libraries(app PRIVATE SDL3::SDL3)

# Automatically copy assets after build
add_custom_command(TARGET app POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E rm -rf "$<TARGET_FILE_DIR:app>/assets"
  COMMAND ${CMAKE_COMMAND} -E copy_directory
          "${CMAKE_SOURCE_DIR}/assets"
          "$<TARGET_FILE_DIR:app>/assets"
  COMMENT "Refreshing assets into output directory"
)