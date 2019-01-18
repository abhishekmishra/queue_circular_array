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

.SUFFIXES: .pdf .tex .dvi .w

.w.pdf:
	make $*.tex
	make $*.pdf

.tex.pdf:
	pdftex $<

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

doc: $(WFILES:.w=.pdf)

clean:
	$(RM) *~ \#~ .\#* *.o *.log *.dvi *.toc *.pdf core queue_circular_array

clobber: clean
	$(RM) $(WFILES:.w=) $(WFILES:.w=.c) $(WFILES:.w=.tex)
