# Application name
APP				 = a.out

# Compiler
FC 		    := gfortran
FC_FLAGS  := -cpp -fopenmp -g -Og -march=native -pipe
# FC_FLAGS  += $(shell pkg-config xxx --cflags)

# Linker
LD        := gfortran
LD_FLAGS  :=
# LD_FLAGS  += $(shell pkg-config xxx --libs)

# Install
INSTALL   := install
DIR				:= /usr/local/bin/

# Source and object files
SRC = $(wildcard *.f90)
OBJ = $(SRC:.f90=.o)

# ------------------------

$(APP): $(OBJ)
	$(LD) $(LD_FLAGS) $< -o $(APP)

%.o: %.f90
	$(FC) $(FC_FLAGS) -c $^

.PHONY: test install clean

test: $(APP)
	@./$(APP)

install: $(APP)
	$(INSTALL) $(APP) $(DIR)

clean:
	@rm -f $(APP) *.mod *.o
