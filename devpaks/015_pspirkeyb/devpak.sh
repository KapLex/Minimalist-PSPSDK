#!/bin/bash
set -e
. ../util/util.sh

LIBNAME=pspirkeyb
VERSION=0.0.4

svnGet build http://psp.jim.sh/svn/psp/trunk $LIBNAME

cd build/$LIBNAME

make -s
make install
rm -fR ../target/psp/sdk/samples/irkeyb/keymap/.svn

cd ../..

makeInstaller $LIBNAME $VERSION

echo "Done!"
