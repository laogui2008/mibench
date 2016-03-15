FILE1 = qsort_small.c
FILE2 = qsort_large.c
FILE2 = qsort_verylarge.c

all: qsort_small qsort_large qsort_verylarge

qsort_small: qsort_small.c Makefile
	$(CC) -static qsort_small.c -O3 -o qsort_small -lm
qsort_large: qsort_large.c Makefile
	$(CC) -static qsort_large.c -O3 -o qsort_large -lm
qsort_verylarge: qsort_verylarge.c Makefile
	$(CC) -static qsort_verylarge.c -O3 -o qsort_verylarge -lm

clean:
	rm -rf qsort_small qsort_large qsort_verylarge output*
