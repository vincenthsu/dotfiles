TARGET=~/bin
OUTOBJ=git-proxy-connect

UNAME := $(shell uname -s)
ifeq ($(UNAME),Darwin)
	LIBS += -lresolv
endif

all: install clean

build:
	gcc $(OUTOBJ).c -o $(OUTOBJ) $(LIBS)
clean:
	rm $(OUTOBJ)
install: build
	cp $(OUTOBJ) $(TARGET)
