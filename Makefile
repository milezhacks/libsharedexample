CC           ?= gcc
LD           ?= ld
PREFIX       ?= /usr/local
INSTALL      ?= install

CFLAGS       = -fPIC -Wall -Werror -std=gnu99 -Iinclude
LDFLAGS      = -shared

VERSION      = 0.1
LIBNAME      = libexample.so
TARGET       = $(LIBNAME).$(VERSION)
SOURCES      = example.c
HEADERS      = example.h
OBJECTS      = $(SOURCES:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $^ -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

clean:
	-rm -f $(TARGET)
	-rm -f $(OBJECTS)
	-rm -f $(LIBNAME)

install:
	$(INSTALL) -d $(PREFIX)/lib
	$(INSTALL) $(TARGET) $(PREFIX)/lib

stage:
	$(INSTALL) -d $(PREFIX)/include
	$(INSTALL) $(HEADERS) $(PREFIX)/include
