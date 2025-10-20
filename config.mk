# st version
VERSION = 0.9.3

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/X11R6/include
X11LIB = /usr/X11R6/lib

PKG_CONFIG = pkg-config

# HarfBuzz (ligatures)
HARFBUZZINC  = $(shell $(PKG_CONFIG) --cflags harfbuzz)
HARFBUZZLIBS = $(shell $(PKG_CONFIG) --libs harfbuzz)

# includes and libs
INCS = -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2` \
       $(HARFBUZZINC)

LIBS = -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft -lXrender \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2` \
       $(HARFBUZZLIBS)

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS   = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS  = $(LIBS) $(LDFLAGS)

# compiler and linker
# CC = c99

# OpenBSD example (not used here):
# CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
# LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
#        `$(PKG_CONFIG) --libs fontconfig` \
#        `$(PKG_CONFIG) --libs freetype2` \
#        `$(PKG_CONFIG) --libs harfbuzz`
# MANPREFIX = ${PREFIX}/man

