set -e 

DATA_PATH=/jenkins_data/merges/alma/ACS-2017OCT/ACSSW
PACKAGES=$(ls $DATA_PATH/Sources)
LIB_PATH=$DATA_PATH/lib/
SOURCE_PATH=$DATA_PATH/Sources

OUTPUT_PYTHON_DIRECTORY=../files/python


rm -rf $OUTPUT_PYTHON_DIRECTORY
for p in $PACKAGES; do
    mkdir -p $OUTPUT_PYTHON_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    PYTHONPACKAGE=$(grep -r "lib/python/" $NORM | cut -d ' ' -f 5 | sed "s/..\/lib\/python\/site-packages\///g")
    for l in $PYTHONPACKAGE; do
        #find the file
        lnew=${l##*/}
        py=$(find $LIB_PATH -type f -name $lnew)
        if [[ "$py" != '' ]] ; then
            cp $py $OUTPUT_PYTHON_DIRECTORY/$p
        fi
    done
done

