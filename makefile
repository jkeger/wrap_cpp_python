
# Compiler
CXX := g++
CXXFLAGS := -std=c++11 -O3

# Executable
TARGET := cpp_main

# Directories
DIR_SRC := src/
DIR_OBJ := build/
DIR_INC := include/
INCLUDE := -I $(DIR_INC) -I /usr/include/python3.6/
$(shell mkdir -p $(DIR_OBJ))

# Source and object files, and dependency files to detect header file changes
SOURCES := $(shell find $(DIR_SRC) -type f -name *.cpp)
OBJECTS := $(patsubst $(DIR_SRC)%, $(DIR_OBJ)%, $(SOURCES:.cpp=.o))
DEPENDS := $(patsubst %.o, %.d, $(OBJECTS))

# Main program
$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) $^ -o $@

-include $(DEPENDS)

$(DIR_OBJ)%.o: $(DIR_SRC)%.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDE) -MMD -MP -c $< -o $@

clean:
	@rm -fv $(OBJECTS) $(DEPENDS)
	@rm -fv $(TARGET)
