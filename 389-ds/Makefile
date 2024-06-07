#
# BEGIN COPYRIGHT BLOCK
# Copyright (C) 2001 Sun Microsystems, Inc. Used by permission.
# Copyright (C) 2005 Red Hat, Inc.
# All rights reserved.
#
# License: GPL (version 3 or any later version).
# See LICENSE for details. 
# END COPYRIGHT BLOCK
#
# Linux Makefile for Directory Server plug-in examples
#

CC = gcc
LD = ld 

INCLUDE_FLAGS = -I/opt/dirsrv/include -I/opt/dirsrv/include/dirsrv -I/usr/include/nspr4/
CFLAGS = $(INCLUDE_FLAGS) -g -D_REENTRANT -fPIC
LDFLAGS = -G -g

# OBJS = testsaslbind.o testextendedop.o testpreop.o testpostop.o testentry.o testbind.o testgetip.o testdatainterop.o testdbinterop.o

OBJS = testpreop.o

all: libtest-plugin.so


libtest-plugin.so: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

.c.o:
	$(CC) $(CFLAGS) -c $<

clean:
	-rm -f $(OBJS) libtest-plugin.so

