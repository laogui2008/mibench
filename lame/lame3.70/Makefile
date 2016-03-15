# Makefile for LAME 3.xx
#

# defaults:
PGM = lame
#def externaly CC = gcc
CC_OPTS =  -O
GTK = 
GTKLIBS = 
SNDLIB = -DLAMESNDFILE
LIBSNDFILE =  
LIBS = -lm 
MAKEDEP = -M
BRHIST_SWITCH = 
LIBTERMCAP = 
RM = rm -f
CPP_OPTS = -DHAVEMPGLIB -DLAMEPARSE

##########################################################################
# LINUX   
##########################################################################
#  remove these lines if you dont have GTK, or dont want the GTK frame analyzer
#   GTK = -DHAVEGTK `gtk-config --cflags`
#   GTKLIBS = `gtk-config --libs` 
# Comment out next 2 lines if you want to remove VBR histogram capability
#BRHIST_SWITCH = -DBRHIST
#LIBTERMCAP = -lncurses
# suggested for gcc-2.7.x
CC_OPTS =  -O2




# 10/99 added -D__NO_MATH_INLINES to fix a bug in *all* versions of
# gcc 2.8+ as of 10/99.  

CC_SWITCHES = -DNDEBUG -D__NO_MATH_INLINES $(CC_OPTS) $(SNDLIB) $(GTK) $(BRHIST_SWITCH)
c_sources = \
        brhist.c \
	formatBitstream.c \
	fft.c \
	get_audio.c \
	l3bitstream.c \
        id3tag.c \
	ieeefloat.c \
        lame.c \
        newmdct.c \
        parse.c \
	portableio.c \
	psymodel.c \
	quantize.c \
	quantize-pvt.c \
	vbrquantize.c \
	reservoir.c \
	tables.c \
	takehiro.c \
	timestatus.c \
	util.c \
        VbrTag.c \
        version.c \
        gtkanal.c \
        gpkplotting.c \
        mpglib/common.c \
        mpglib/dct64_i386.c \
        mpglib/decode_i386.c \
        mpglib/layer3.c \
        mpglib/tabinit.c \
        mpglib/interface.c \
        mpglib/main.c 

OBJ = $(c_sources:.c=.o)
DEP = $(c_sources:.c=.d)



%.o: %.c 
	$(CC) $(CPP_OPTS) $(CC_SWITCHES) -c $< -o $@

%.d: %.c
	$(SHELL) -ec '$(CC) $(MAKEDEP)  $(CPP_OPTS) $(CC_SWITCHES)  $< | sed '\''s;$*.o;& $@;g'\'' > $@'

#$(PGM):	main.o $(OBJ) Makefile 
#	$(CC) -o $(PGM)  main.o $(OBJ) $(LIBS) $(CPP_OPTS) $(LIBSNDFILE) $(GTKLIBS) $(LIBTERMCAP)

$(PGM):	main.o libmp3lame.a 
	$(CC) -static -o $(PGM)  main.o -L. -lmp3lame $(LIBS) $(LIBSNDFILE) $(GTKLIBS) $(LIBTERMCAP)

mp3x:	mp3x.o libmp3lame.a
	$(CC) -static -o mp3x mp3x.o  $(OBJ) $(LIBS) $(LIBSNDFILE) $(GTKLIBS) $(LIBTERMCAP)

mp3rtp:	rtp.o mp3rtp.o libmp3lame.a
	$(CC) -static -o mp3rtp mp3rtp.o rtp.o   $(OBJ) $(LIBS) $(LIBSNDFILE) $(GTKLIBS) $(LIBTERMCAP)

libmp3lame.a:  $(OBJ) Makefile
#	cd libmp3lame
#	make libmp3lame
	ar cr libmp3lame.a  $(OBJ) 

clean:
	-$(RM) $(OBJ) $(DEP) $(PGM) main.o rtp.o mp3rtp mp3rtp.o \
         mp3x.o mp3x libmp3lame.a 


tags: TAGS

TAGS: ${c_sources}
	etags -T ${c_sources}

ifneq ($(MAKECMDGOALS),clean)
  -include $(DEP)
endif


#
#  testcase.mp3 is a 2926 byte file.  The first number output by
#  wc is the number of bytes which differ between new output
#  and 'official' results.  
#
#  Because of compilier options and effects of roundoff, the 
#  number of bytes which are different may not be zero, but
#  should be at most 30.
#
test: $(PGM)
	./lame  --nores -h testcase.wav testcase.new.mp3
	cmp -l testcase.new.mp3 testcase.mp3 | wc

testg: $(PGM)
	./lame -g -h ../test/castanets.wav
