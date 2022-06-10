CC           ?= gcc
LD           ?= ld
PREFIX       ?= /usr/local

CFLAGS       = -fPIC -Wall -Werror -std=gnu99 -Iinclude
LDFLAGS      = -shared

TARGET       = libexample.so
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

install:
	-mkdir -p $(PREFIX)/bin
	-mkdir -p $(PREFIX)/include
	-mkdir -p $(PREFIX)/lib
	cp $(TARGET) $(PREFIX)/lib
	cp $(HEADERS) $(PREFIX)/include


