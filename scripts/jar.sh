collect_jar(){
    mkdir -p $OUTPUT_JAR_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    JARPACKAGE=$(grep -r -e  "Creating jarfile" -e  "Updating jarfile" $NORM | cut -d ' ' -f 4)
    for j in $JARPACKAGE; do
        #find the file
        jar=$(find $JAR_PATH -type f -name $j.jar)
        if [[ "$jar" != '' ]] ; then
            cp $jar $OUTPUT_JAR_DIRECTORY/$p/
        fi
    done
}
