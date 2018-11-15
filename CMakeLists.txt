cmake_minimum_required(VERSION 3.12)
project(QuantExt CXX)

include(cmake/environment.cmake)

include(subdir)

SUBDIRLISTR(_modules "${CMAKE_CURRENT_LIST_DIR}/qle")
SET(_modules ${_modules} ".")
set(source_list)
foreach(_module ${_modules})
    file(GLOB_RECURSE _local_source
            "qle/${_module}/*.hpp"
            "qle/${_module}/*.cpp"
            )
    set(source_list ${source_list} ${_local_source})
endforeach(_module)

Find_Package(Boost REQUIRED)
Find_Package(QuantLib REQUIRED)

add_library(QuantExt ${source_list})
include_directories(${CMAKE_CURRENT_LIST_DIR} ${QuantLib_INCLUDE_DIR} ${Boost_INCLUDE_DIR})

#target_link_libraries(QuantExt
#        ${QuantLib_LIBRARY}
#        )
