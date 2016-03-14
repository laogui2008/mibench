
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

cd CRC32/
make CC=$GCC
cd ..

cd dijkstra/
make CC=$GCC
cd ..

cd gsm/
make PREFIX=$GCCPREFIX
cd ..

cd patricia/
make CC=$GCC
cd ..

cd typeset/lout-3.24
make PREFIX=$GCCPREFIX
cd ../..

