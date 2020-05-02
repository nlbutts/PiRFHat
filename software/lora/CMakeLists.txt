cmake_minimum_required(VERSION 3.10)

# set the project name
set(PROJ_NAME lora)
project(${PROJ_NAME})

# add the executable
#add_executable(${PROJ_NAME} src/gpiotest.cxx)
add_executable(${PROJ_NAME} src/sx1276.cxx src/sx1276-fsk.cxx)
#add_executable(${PROJ_NAME} src/sx1276.cxx src/sx1276-lora.cxx)
target_include_directories(${PROJ_NAME} PUBLIC src src/tclap-1.2.2/include)

target_link_libraries(${PROJ_NAME} pthread gpiod)