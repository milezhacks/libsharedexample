CC           ?= gcc
LD           ?= ld
PREFIX       ?= /usr/local
INSTALL      ?= install

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
	$(INSTALL) -d $(PREFIX)/include
	$(INSTALL) -d $(PREFIX)/lib
	$(INSTALL) $(TARGET) $(PREFIX)/lib
	$(INSTALL) $(HEADERS) $(PREFIX)/include

