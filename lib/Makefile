ROOT_DIR := $(shell dirname $(shell pwd))
SBCL_SRC := /usr/local/src/sbcl-2.4.0

.PHONY: all clean

all: libsbcl.so libhello.dylib

libsbcl.so: $(SBCL_SRC)
	test ! -e $(SBCL_SRC)/src/runtime/libsbcl.so && cd $(SBCL_SRC) && ./make-shared-library.sh || true
	cp $(SBCL_SRC)/src/runtime/libsbcl.so ./

libhello.core libhello.c libhello.h libhello.py:
	$(SBCL_SRC)/run-sbcl.sh \
	--load $(HOME)/.rc.lisp \
	--script "script.lisp"

libhello.dylib: libhello.core libhello.c
	$(CC) -dynamiclib -o $@ libhello.c -L$(SBCL_SRC)/src/runtime -lsbcl
clean:
	rm -f libsbcl.so libhello.c libhello.h libhello.core libhello.py libhello.dylib test test.o

test: test.c libhello.dylib
	$(CC) -o $@ $< -L. -lhello -pagezero_size 0x100000

.PHONY:
check:
	./test | grep 'From hello: Hello!'

