#
# generic Makefile to use when you've got CWEB
# (add it to, or add to it, whatever you like)
#
#======================================================================

CFLAGS = -g -DTEST_CODE
MLIB = -lm
RM = /bin/rm -f
WFILES = queue_circular_array.w
PROGRAM = queue_circular_array

#======================================================================

.SUFFIXES: .tex .dvi .w

.w.tex:
	cweave $*

.tex.dvi:
	tex $<

.w.dvi:
	make $*.tex
	make $*.dvi

.w.c:
	ctangle $*

.w.o:
	make $*.c
	make $*.o

.c.o:
	cc $(CFLAGS) -c $*.c

.w:
	make $*.c
	cc $(CFLAGS) $*.c -o $*

#======================================================================

all: $(WFILES:.w=)

doc: $(WFILES:.w=.dvi)

clean:
	$(RM) *~ \#~ .\#* *.o *.log *.dvi *.toc core queue_circular_array

clobber: clean
	$(RM) $(WFILES:.w=) $(WFILES:.w=.c) $(WFILES:.w=.tex)
