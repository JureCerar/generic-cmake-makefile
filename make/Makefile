# General
FC			:= gfortran
LD    	:= gfortran
INSTALL	:= install

# Compiler and Linker flags
FC_FLAGS 	:= -cpp -fopenmp -O3 -march=native -pipe
# LD_FLAGS 	:=

# Compiler debug flags
FC_FLAGS_DEBUG = -O1 -g3 -fbounds-check -fbacktrace -ffpe-trap=invalid,zero,overflow,underflow
ifeq ($(BUILD_TYPE), DEBUG)
	FC_FLAGS += $(FC_FLAGS_DEBUG)
endif

# Includes and libraries
# INCLUDE := $(shell pkg-config xslib --cflags)
# LIBS    := $(shell pkg-config xslib --libs)

# Macros
# MACROS = -D_VERSION=\"v$(shell cat .VERSION)\" -D_DEBUG=.false.
FC_FLAGS += $(MACROS)

# Traget properties
TARGET			= a.out
INSTALL_DIR	= /usr/local/bin
SRCDIR			= src
OBJDIR			= build
# BINDIR		= bin

SRC			:= $(wildcard $(SRCDIR)/*.f90)
OBJ			:= $(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SRC:.f90=.o))
BIN			:= $(TARGET) #$(BINDIR)/$(TARGET)

# ============================================================

default: dir $(BIN)

dir:
	@mkdir -p $(OBJDIR)
#	@mkdir -p $(BINDIR)

$(BIN): $(OBJ)
	$(LD) $(LD_FLAGS) $^ -o $@ $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.f90
	$(FC) $(FC_FLAGS) -c -o $@ $< $(INCLUDE)

install: $(BIN)
	$(INSTALL) -d $(INSTALL_DIR)
	$(INSTALL) $(BIN) $(INSTALL_DIR)

test: $(BIN)
	./$(BIN)

.PHONY: clean

clean:
	rm -rf $(OBJDIR) $(BINDIR)
