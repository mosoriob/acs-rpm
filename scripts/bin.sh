collect_bin(){
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
}
