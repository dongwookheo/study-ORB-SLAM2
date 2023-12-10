message(STATUS "Finding spdlog...")

find_package(spdlog CONFIG REQUIRED HINTS ${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/spdlog/install/lib/cmake/spdlog)

if(spdlog_FOUND)
    message(STATUS "Found Spdlog - ${spdlog_INCLUDE_DIRS}")

    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/spdlog/install/include)

    include_directories(${CMAKE_CURRENT_SOURCE_DIR}/Thirdparty/spdlog/install/include)
    set(SPDLOG_LIBS spdlog::spdlog)

endif(spdlog_FOUND)