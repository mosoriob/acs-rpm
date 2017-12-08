set -e 

DATA_PATH=/jenkins_data/merges/alma/ACS-2017OCT/ACSSW
PACKAGES=$(ls $DATA_PATH/Sources)
BIN_PATH=$DATA_PATH/bin/
LIB_PATH=$DATA_PATH/lib/
JAR_PATH=$DATA_PATH/lib/

SOURCE_PATH=$DATA_PATH/Sources

OUTPUT_BIN_DIRECTORY=../files/bins
OUTPUT_LIB_DIRECTORY=../files/libs
OUTPUT_PYTHON_DIRECTORY=../files/python
OUTPUT_JAR_DIRECTORY=../files/jars


. bin.sh
. jar.sh
. lib.sh
. py.sh

for p in $PACKAGES; do
    collect_bin
    collect_jar
    collect_lib
    collect_python
done

