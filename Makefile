# change application name here (executable output name)
TARGET=template_app

# compiler
CC=clang
# debug
DEBUG=-g
# optimisation
OPT=-O0
# warnings
WARN=-Wall

PTHREAD=-pthread

CCFLAGS=$(DEBUG) $(OPT) $(WARN) $(PTHREAD) -pipe

GTKLIB=`pkg-config --libs gtk+-3.0`
GTKCFLAGS=`pkg-config --cflags gtk+-3.0`

# linker
LD=clang
LDFLAGS=$(PTHREAD) $(GTKLIB)

OBJS=    main.o

all: $(OBJS)
	$(LD) -o $(TARGET) $(OBJS) $(LDFLAGS)
    
main.o: src/main.c
	$(CC) -c $(CCFLAGS) $(GTKCFLAGS) src/main.c -o main.o
    
clean:
	rm -f *.o $(TARGET)