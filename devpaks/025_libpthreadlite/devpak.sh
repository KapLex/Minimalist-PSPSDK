#!/bin/bash
set -e
. ../util/util.sh

LIBNAME=libpthreadlite
VERSION=2336

svnGet build http://psp.jim.sh/svn/psp/trunk $LIBNAME
cd build/$LIBNAME
make -s
mkdir -p ../target/psp/include ../target/psp/lib ../target/doc
cp pthreadlite.h ../target/psp/include
cp libpthreadlite.a ../target/psp/lib
cp README ../target/doc/pthreadlite.txt
	
cd ../..

makeInstaller $LIBNAME $VERSION

echo "Done!"

