collect_python(){
    mkdir -p $OUTPUT_PYTHON_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    PYTHONPACKAGE=$(grep -r "lib/python/" $NORM | cut -d ' ' -f 5 | sed "s/..\/lib\/python\/site-packages\///g")
    for l in $PYTHONPACKAGE; do
        #find the file
        lnew=${l##*/}
        py=$(find $LIB_PATH -type f -name $lnew)



        if [[ "$py" != '' ]] ; then
            if [ "$(echo $py | wc -w )" != 1 ]; then
                py=$(find $LIB_PATH -type f -path \*$l)
                cp $py $OUTPUT_PYTHON_DIRECTORY/$p
            else
                cp $py $OUTPUT_PYTHON_DIRECTORY/$p
            fi

        fi
    done
}