#!/usr/bin/env bash


## script to build automatically (UV-)CDAT

INSTALL_PATH=$1
GIT_BRANCH=$2
GIT_PATH=$3
QMAKE_EXE=$4
XTRA_ARGS=$5

here=`pwd`

: ${INSTALL_PATH:="/lgm/uvcdat/nightly"}
: ${GIT_BRANCH:="next"}
: ${GIT_PATH:="/git/uv-cdat"}
: ${QMAKE_EXE:="/usr/bin/qmake"}
#: ${XTRA_ARGS:="-DCDAT_USE_LIBXML2=ON -DCDAT_USE_SYSTEM_PNG=ON"}

echo "XTRA_ARGS:"${XTRA_ARGS}

cd ${GIT_PATH} ; \
git checkout ${GIT_BRANCH} ; \
git pull ; \
/bin/rm -rf ${INSTALL_PATH} ; \
cd ${here} ; \
rm -rf build_nightly ;\ 
mkdir build_nightly ;\
cd build_nightly ;\
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} -DQT_QMAKE_EXECUTABLE=${QMAKE_EXE} ${XTRA_ARGS} ${GIT_PATH} ; \
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_PATH} -DQT_QMAKE_EXECUTABLE=${QMAKE_EXE} ${XTRA_ARGS} ${GIT_PATH} ; \
pwd ; \
make -j16 ; \


