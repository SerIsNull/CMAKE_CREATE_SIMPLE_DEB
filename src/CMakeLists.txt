# set src files for build
set(SOURCES
    weight.cpp
)

# create weight 
add_executable(weight ${SOURCES})

# install it into the bin dir
install(TARGETS weight DESTINATION bin)

