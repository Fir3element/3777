cmake_minimum_required(VERSION 3.10)

set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)

project(theforgottenserver CXX)

add_subdirectory(src)
add_executable(theforgottenserver ${theforgottenserver_SRC})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

add_definitions(-D__USE_MYSQL__ -D__ROOT_PERMISSION__ -D__ENABLE_SERVER_DIAGNOSTIC__)

set(CMAKE_CXX_FLAGS "-Ofast -DNDEBUG")

include(FindCXX11)

find_package(GMP REQUIRED)
find_package(MySQL REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(LibXml2 REQUIRED)
find_package(ZLIB REQUIRED)
find_package(Boost REQUIRED COMPONENTS filesystem regex thread)

# Selects LuaJIT if user defines or auto-detected
if (DEFINED USE_LUAJIT AND NOT USE_LUAJIT)
  set(FORCE_LUAJIT ${USE_LUAJIT})
else ()
  find_package(LuaJIT)
  set(FORCE_LUAJIT ${LuaJIT_FOUND})
endif ()
option(USE_LUAJIT "Use LuaJIT" ${FORCE_LUAJIT})

if (FORCE_LUAJIT)
  if (APPLE)
    set(CMAKE_EXE_LINKER_FLAGS "-pagezero_size 10000 -image_base 100000000")
  endif ()
else ()
  find_package(Lua REQUIRED)
endif ()

include_directories(
  ${Boost_INCLUDE_DIRS}
  ${LUA_INCLUDE_DIR}
  ${MYSQL_INCLUDE_DIR}
  ${GMP_INCLUDE_DIR}
)
target_link_libraries(theforgottenserver PRIVATE
  Boost::filesystem
  Boost::regex
  Boost::thread
  OpenSSL::SSL
  LibXml2::LibXml2
  ZLIB::ZLIB
  ${LUA_LIBRARIES}
  ${MYSQL_CLIENT_LIBS}
  ${GMP_LIBRARY}
)
