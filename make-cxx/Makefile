# Application name
APP				 = a.out

# Compiler
FC 		    := cxx
FC_FLAGS  := -fopenmp -g -Og -march=native -pipe
# FC_FLAGS  += $(shell pkg-config xxx --cflags)

# Linker
LD        := cxx
LD_FLAGS  :=
# LD_FLAGS  += $(shell pkg-config xxx --libs)

# Install
INSTALL   := install
DIR				:= /usr/local/bin/

# Source and object files
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)

# ------------------------

$(APP): $(OBJ)
	$(LD) $(LD_FLAGS) $< -o $(APP)

%.o: %.c
	$(FC) $(FC_FLAGS) -c $^

.PHONY: test install clean

test: $(APP)
	@./$(APP)

install: $(APP)
	$(INSTALL) $(APP) $(DIR)

clean:
	@rm -f $(APP) *.o
