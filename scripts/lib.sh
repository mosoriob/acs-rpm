set -e 

DATA_PATH=/jenkins_data/merges/alma/ACS-2017OCT/ACSSW
PACKAGES=$(ls $DATA_PATH/Sources)
LIB_PATH=$DATA_PATH/lib/
SOURCE_PATH=$DATA_PATH/Sources

OUTPUT_LIB_DIRECTORY=../files/libs


rm -rf $OUTPUT_LIB_DIRECTORY
for p in $PACKAGES; do
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
done


#find /jenkins_data/centos7/alma/ACS-OCT2016/ACSSW/lib -maxdepth 1  -name *.jar | wc -l  
#find  jars -name *.jar | wc -l  

