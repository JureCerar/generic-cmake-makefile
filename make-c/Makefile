# Application name
APP				 = a.out

# Compiler
CC 		    := gcc
CC_FLAGS  := -fopenmp -g -Og -march=native -pipe
# FC_FLAGS  += $(shell pkg-config xxx --cflags)

# Linker
LD        := gcc
LD_FLAGS  :=
# LD_FLAGS  += $(shell pkg-config xxx --libs)

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
	$(CC) $(CC_FLAGS) -c $^

.PHONY: test install clean

test: $(APP)
	@./$(APP)

install: $(APP)
	$(INSTALL) $(APP) $(DIR)

clean:
	@rm -f $(APP) *.o
