VERSION=1.2.2
CFLAGS=-DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
LDFLAGS=-static
INCLUDE=-Iinclude
PREFIX=/usr/local
DESTDIR=
_INSTDIR=$(DESTDIR)$(PREFIX)
BINDIR=$(_INSTDIR)/bin
MANDIR=$(_INSTDIR)/share/man
.DEFAULT_GOAL=all

OBJECTS=\
	.build/main.o \
	.build/string.o \
	.build/utf8_chsize.o \
	.build/utf8_decode.o \
	.build/utf8_encode.o \
	.build/utf8_fgetch.o \
	.build/utf8_fputch.o \
	.build/utf8_size.o \
	.build/util.o

.build/%.o: src/%.c
	@mkdir -p .build
	$(CC) -std=c99 -pedantic -c -o $@ $(CFLAGS) $(INCLUDE) $<

scdoc: $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

scdoc.1: scdoc.1.scd scdoc
	./scdoc < $< > $@

all: scdoc scdoc.1

clean:
	rm -rf .build scdoc

install: all
	install -Dm755 scdoc $(BINDIR)/scdoc
	install -Dm644 scdoc.1 $(MANDIR)/man1/scdoc.1

.PHONY: all clean install
