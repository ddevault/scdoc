VERSION=1.3.4
CFLAGS+=-g -DVERSION='"$(VERSION)"' -Wall -Wextra -Werror -Wno-unused-parameter
LDFLAGS+=-static
INCLUDE+=-Iinclude
PREFIX?=/usr/local
_INSTDIR=$(DESTDIR)$(PREFIX)
BINDIR?=$(_INSTDIR)/bin
MANDIR?=$(_INSTDIR)/share/man
OUTDIR=.build
HOST_SCDOC=./scdoc
.DEFAULT_GOAL=all

OBJECTS=\
	$(OUTDIR)/main.o \
	$(OUTDIR)/string.o \
	$(OUTDIR)/utf8_chsize.o \
	$(OUTDIR)/utf8_decode.o \
	$(OUTDIR)/utf8_encode.o \
	$(OUTDIR)/utf8_fgetch.o \
	$(OUTDIR)/utf8_fputch.o \
	$(OUTDIR)/utf8_size.o \
	$(OUTDIR)/util.o

$(OUTDIR)/%.o: src/%.c
	@mkdir -p $(OUTDIR)
	$(CC) -std=c99 -pedantic -c -o $@ $(CFLAGS) $(INCLUDE) $<

scdoc: $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

scdoc.1: scdoc.1.scd $(HOST_SCDOC)
	$(HOST_SCDOC) < $< > $@

all: scdoc scdoc.1

clean:
	rm -rf $(OUTDIR) scdoc scdoc.1

install: all
	install -Dm755 scdoc $(BINDIR)/scdoc
	install -Dm644 scdoc.1 $(MANDIR)/man1/scdoc.1

check: scdoc scdoc.1
	@find test -perm -111 -exec '{}' \;

.PHONY: all clean install check
