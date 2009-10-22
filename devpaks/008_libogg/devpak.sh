#!/bin/bash
. ../util/util.sh

LIBNAME=libogg
VERSION=1.1.2

svnGetPS2DEV $LIBNAME

cd $LIBNAME

LDFLAGS="-L$(psp-config --pspsdk-path)/lib" LIBS="-lc -lpspuser" ./autogen.sh --host psp --prefix=$(pwd)/../target/psp

make || { echo "Error building $LIBNAME"; exit 1; }

make install || { echo "Error installing $LIBNAME"; exit 1; }
mkdir -p $(pwd)/../target/doc
mv $(pwd)/../target/psp/share/doc/libogg-1.1.2 $(pwd)/../target/doc
rm -fR $(pwd)/../target/psp/share

cd ..

makeInstaller $LIBNAME $VERSION

echo "Done!"

