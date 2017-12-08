collect_jar(){
    mkdir -p $OUTPUT_JAR_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    JARPACKAGE1=$(grep -r -ie "Making jarfile" -ie  "Creating jarfile" -ie  "Updating jarfile" $NORM | cut -d ' ' -f 4)
    JARPACKAGE2=$(grep -ri  "../lib/.*.jar$" $NORM  | grep -v '=' | cut -d ':' -f 2 | sed  's/\t//')
    JARPACKAGE3=$(grep -ri  ".*installing .* java" $NORM  | cut -d ':' -f 2  | grep "="  | cut -d ' ' -f  5 | sed 's/)//' | sed 's/(//')
    JARPACKAGE4=$(grep -r -ie "building jar" $NORM | cut -d ':' -f 3 | sed 's/ //')

    JARPACKAGE=$(echo $JARPACKAGE1 $JARPACKAGE2 $JARPACKAGE3 $JARPACKAGE4)

    for j in $JARPACKAGE; do
        j=${j##*/}

        echo $j

        #find the file
        if [[ "$j" != *.jar ]]; then
            j="$j.jar"
        fi
        jar=$(find $JAR_PATH -type f -name $j)
        if [[ "$jar" != '' ]] ; then
            echo "cp $jar $OUTPUT_JAR_DIRECTORY/$p/"
            cp $jar $OUTPUT_JAR_DIRECTORY/$p/
        fi
    done

    for i in $(cat ../jar-hardcoding); do
        jarname=$(echo $i | cut -d ':' -f 1)
        package=$(echo $i | cut -d ':' -f 2)
        jar=$(find $JAR_PATH -type f -name $jarname)
        cp $jar $OUTPUT_JAR_DIRECTORY/$package/
    done
}

