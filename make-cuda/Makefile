# General
FC			:= gfortran
CUDA    := pgf90
LD    	:= gfortran
INSTALL	:= install

# Traget properties
TARGET			= a.out
INSTALL_DIR	= /usr/local/bin
SRCDIR			= src
OBJDIR			= build
# BINDIR		= bin

SRC			:= $(wildcard $(SRCDIR)/*.f90)
OBJ			:= $(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SRC:.f90=.o))
CUF_SRC	:= $(wildcard $(SRCDIR)/*.cuf)
CUF_OBJ	:= $(patsubst $(SRCDIR)/%, $(OBJDIR)/%, $(CUF_SRC:.cuf=.o))
BIN			:= $(TARGET) #$(BINDIR)/$(TARGET)

# Path to PGI and CUDA libraries
CUDA_LIB := /opt/pgi/linux86-64/2018/cuda/10.0/lib64 -Wl,-rpath=/opt/pgi/linux86-64/2018/cuda/10.0/lib64
PGI_LIB  := /opt/pgi/linux86-64/2018/lib -Wl,-rpath=/opt/pgi/linux86-64/2018/lib

# Compiler and Linker flags (link both CUDA and PGI libraries)
FC_FLAGS 		= -cpp -O3 -march=native -pipe -fopenmp -funroll-loops -finline-functions -flto
CUDA_FLAGS	= -Mcuda=nordc -ta=tesla:ccall,fastmath -O3 -Munroll -Mipa -Minline -Mvect -mp -module $(OBJDIR)
LD_FLAGS 		= -fopenmp -L$(PGI_LIB) -lpgf90rtl -lpgf90 -lpgf90_rpm1 -lpgf902 -lpgf90rtl -lpgftnrtl -lpgmp -lnuma -lpthread -lpgmath -lnspgc -lpgc -lrt -lpthread -lm -lgcc -lc -lgcc -lgcc_s \
-L$(CUDA_LIB) -lcudafor91 -lcudafor -lcudaforblas -laccapimp -laccgmp -laccncmp -laccnmp -laccg2mp -lcudart -ldl -lcudadevice -lcudafor2

# Compiler debug flags
FC_FLAGS_DEBUG 		= -O1 -g3 -fbounds-check -fbacktrace -ffpe-trap=invalid,zero,overflow,underflow
CUDA_FLAGS_DEBUG	= -O1 -g -C -Mbounds -Mchkptr -Mchkstk -traceback -Ktrap=fp –Minform=inform
ifeq ($(BUILD_TYPE), DEBUG)
	FC_FLAGS += $(FC_FLAGS_DEBUG)
	CUDA_FLAGS += $(CUDA_FLAGS_DEBUG)
endif

# Includes and libraries
# INCLUDE := $(shell pkg-config xslib --cflags)
# LIBS    := $(shell pkg-config xslib --libs)

# Macros
# MACROS = -D_VERSION=\"v$(shell cat .VERSION)\" -D_DEBUG=.false.
FC_FLAGS += $(MACROS)

# ============================================================

default: dir $(BIN)

dir:
	@mkdir -p $(OBJDIR)
#	@mkdir -p $(BINDIR)

$(BIN): $(OBJ) $(CUF_OBJ)
	$(LD) $^ -o $@ $(LD_FLAGS) $(LIBS)

$(OBJDIR)/%.o: $(SRCDIR)/%.f90
	$(FC) $(FC_FLAGS) -c -o $@ $< $(INCLUDE)

$(OBJDIR)/%.o: $(SRCDIR)/%.cuf
	$(CUDA) $(CUDA_FLAGS) -fPIC -c -o $@ $< $(INCLUDES)

install: $(BIN)
	$(INSTALL) -d $(INSTALL_DIR)
	$(INSTALL) $(BIN) $(INSTALL_DIR)

test: $(BIN)
	./$(BIN)

.PHONY: clean

clean:
	rm -rf $(OBJDIR) $(BINDIR)
