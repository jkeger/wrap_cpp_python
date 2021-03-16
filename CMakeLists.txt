cmake_minimum_required(VERSION 3.13)

project(WRAPPER)

#  -DDEBUG_INTERACTIONS_SPH
add_definitions(-Wall -fopenmp)

find_package(PythonInterp 3 REQUIRED)
find_package(PythonLibs 3 REQUIRED)

find_package(Boost REQUIRED COMPONENTS python38 system filesystem)

message("Boost library = ${Boost_LIBRARIES}" )
message("Boost python library = ${Boost_PYTHON_LIBRARY}" )


# Get executable files
file(GLOB src src/*.cpp)
get_filename_component(full_path ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp ABSOLUTE)
list(REMOVE_ITEM src ${full_path})

add_library(wrapper SHARED ${src})
target_link_libraries(wrapper ${Boost_LIBRARIES} ${PYTHON_LIBRARIES} gomp Boost::filesystem)

set_target_properties(wrapper PROPERTIES COMPILE_FLAGS "-I${PYTHON_INCLUDE_DIRS} -DWITH_PYTHON")
