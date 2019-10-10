# Application name
APP				 = a.out

# Compiler
FC 		    := gcc
FC_FLAGS  := -fopenmp -g -Og -march=native -pipe
# FC_FLAGS  += $(shell pkg-config --cflags)

# Linker
LD        := gcc
LD_FLAGS  :=
# LD_FLAGS  += $(shell pkg-config --libs)

# Install
INSTALL   := install
DIR				:= /usr/local/bin/

# Source and object files
SRC = $(wildcard *.c)
OBJ = $(SRC:.c=.o)

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
