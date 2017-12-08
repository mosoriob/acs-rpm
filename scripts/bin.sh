set -e 

DATA_PATH=/jenkins_data/merges/alma/ACS-2017OCT/ACSSW
PACKAGES=$(ls $DATA_PATH/Sources)
BIN_PATH=$DATA_PATH/bin/
SOURCE_PATH=$DATA_PATH/Sources

OUTPUT_BIN_DIRECTORY=../files/bins
OUTPUT_LIB_DIRECTORY=../files/libs
OUTPUT_PYTHON_DIRECTORY=../files/pythons
OUTPUT_JAR_DIRECTORY=../files/jars

rm -rf $OUTPUT_BIN_DIRECTORY


for p in $PACKAGES; do
    mkdir -p $OUTPUT_BIN_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
	BINPACKAGE1=$(grep -re "==.*../bin" $NORM |  cut -d ':' -f 2)
	BINPACKAGE2=$(grep -r "  ../bin.*" $NORM |  cut -d ':' -f 2)
	BINPACKAGE=$(echo $BINPACKAGE1 $BINPACKAGE2)
	for l in $BINPACKAGE; do
        lnew=${l##*/}
		bin=$(find $BIN_PATH -type f -name $lnew)
        if [[ "$bin" != '' ]] ; then
            cp $bin $OUTPUT_BIN_DIRECTORY/$p/
        fi
	done
done




