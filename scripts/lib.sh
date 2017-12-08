collect_lib(){
    mkdir -p $OUTPUT_LIB_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    LIBSPACKAGE=$(grep -r "Making library" $NORM | cut -d ' ' -f 4 | sed 's/..\/lib\///g')
    for l in $LIBSPACKAGE; do
        #find the file
        lib=$(find $LIB_PATH -type f -name $l)
        if [[ "$lib" != '' ]] ; then
            cp $lib $OUTPUT_LIB_DIRECTORY/$p/
        fi
    done
}