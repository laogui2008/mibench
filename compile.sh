
if [ -z ${GCCPREFIX+x} ]; then
    echo "GCCPREFIX is unset" 
    exit
else 
    echo "GCCPREFIX is set to '$GCCPREFIX'"
fi

GCC="$GCCPREFIX""gcc"


set -e

cd adpcm/src/
make CC=$GCC
cd ../..

cd bitcount/
make CC=$GCC
cd ..

cd basicmath/
make CC=$GCC
cd ..

cd blowfish/
make CC=$GCC
cd ..

cd CRC32/
make CC=$GCC
cd ..

cd dijkstra/
make CC=$GCC
cd ..

cd FFT/
make CC=$GCC
cd ..

cd gsm/
make PREFIX=$GCCPREFIX
cd ..

cd jpeg/jpeg-6a/
make CC=$GCC
cd ../..

cd lame/lame3.70/
make CC=$GCC
cd ../..

cd patricia/
make CC=$GCC
cd ..

cd qsort/
make CC=$GCC
cd ..

cd sha/
make PREFIX=$GCCPREFIX
cd ..

cd susan/
make CC=$GCC
cd ..

cd typeset/lout-3.24
make PREFIX=$GCCPREFIX
cd ../..

