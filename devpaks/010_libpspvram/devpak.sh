#!/bin/bash
set -e
. ../util/util.sh

LIBNAME=libpspvram
VERSION=2227

svnGet build http://psp.jim.sh/svn/psp/trunk $LIBNAME

cd build/$LIBNAME

make -s
mkdir -p ../target/psp/lib ../target/psp/include
cp -v libpspvram.a libpspvalloc.a ../target/psp/lib
cp -v *.h ../target/psp/include

cd ../..

makeInstaller $LIBNAME $VERSION

echo "Done!"

