cmake_minimum_required(VERSION 3.20)
project(app LANGUAGES CXX)

# C++ Standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)

# ─── SDL3 ─────────────────────────────
FetchContent_Declare(
  SDL3
  GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
  GIT_TAG origin/main
)
FetchContent_MakeAvailable(SDL3)

# ─── GLM ─────────────────────────────
FetchContent_Declare(
  glm
  GIT_REPOSITORY https://github.com/g-truc/glm.git
  GIT_TAG master
)
FetchContent_MakeAvailable(glm)

# ─── stb_image ──────────────────────
FetchContent_Declare(
  stb
  GIT_REPOSITORY https://github.com/nothings/stb.git
  GIT_TAG master
)
FetchContent_MakeAvailable(stb)

# ─── Output Directory Rules ─────────────
if(CMAKE_BUILD_TYPE STREQUAL "Release")
  set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/${PROJECT_NAME}")
endif()

# ─── Executable ─────────────────────
add_executable(${PROJECT_NAME}
  src/main.cpp
)

# Define stb implementation in a single translation unit
target_compile_definitions(${PROJECT_NAME} PRIVATE STB_IMAGE_IMPLEMENTATION)

# Header-only includes for GLM and stb
target_include_directories(${PROJECT_NAME} PRIVATE
  ${glm_SOURCE_DIR}
  ${stb_SOURCE_DIR}
)

# Link SDL3 (includes headers, compile flags, and libraries)
target_link_libraries(${PROJECT_NAME} PRIVATE SDL3::SDL3)

# ─── Assets Refresh ──────────────────
add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E rm -rf "$<TARGET_FILE_DIR:${PROJECT_NAME}>/assets"
  COMMAND ${CMAKE_COMMAND} -E copy_directory
          "${CMAKE_SOURCE_DIR}/assets"
          "$<TARGET_FILE_DIR:${PROJECT_NAME}>/assets"
  COMMENT "Refreshing assets into output directory"
)
