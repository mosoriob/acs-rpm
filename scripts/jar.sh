DATA_PATH=/jenkins_data/merges/alma/ACS-2017OCT/ACSSW
PACKAGES=$(ls $DATA_PATH/Sources)
JAR_PATH=$DATA_PATH/lib/
SOURCE_PATH=$DATA_PATH/Sources

OUTPUT_BIN_DIRECTORY=../files/bins
OUTPUT_LIB_DIRECTORY=../files/libs
OUTPUT_PYTHON_DIRECTORY=../files/pythons
OUTPUT_JAR_DIRECTORY=../files/jars


rm -rf $OUTPUT_LIB_DIRECTORY
for p in $PACKAGES; do
    mkdir -p $OUTPUT_LIB_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    JARPACKAGE=$(grep -r -e  "Creating jarfile" -e  "Updating jarfile" $NORM | cut -d ' ' -f 4)
    for j in $JARPACKAGE; do
        #find the file
        jar=$(find $JAR_PATH -type f -name $j.jar)
        if [[ "$jar" != '' ]] ; then
            cp $jar $OUTPUT_JAR_DIRECTORY/$p/
        fi
    done
done


#find /jenkins_data/centos7/alma/ACS-OCT2016/ACSSW/lib -maxdepth 1  -name *.jar | wc -l  
#find  jars -name *.jar | wc -l  

