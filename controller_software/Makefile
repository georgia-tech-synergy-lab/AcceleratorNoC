
CXX = g++
SRC = BENES_controller.cpp 
INCLUDE = BENES_controller.hpp
CXXFLAGS := -Wall -Wextra -Wconversion -std=c++11 # -Werror
DEBUG := -g -O0
#RELEASE := -O3

build:
	$(CXX) $(RELEASE) $(CXXFLAGS) $(SRC) $(INCLUDE) -o BENES_controller

debug:
	$(CXX) $(DEBUG) $(CXXFLAGS) $(SRC) $(INCLUDE) -o BENES_controller

clean:
	rm -f BENES_controller *.o

# This looks for a report pdf in the top level directory of the project
.PHONY: submit

submit:
	tar -cvzf code.tar.gz BENES_controller.cpp BENES_controller.hpp
