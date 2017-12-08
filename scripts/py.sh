collect_python(){
    mkdir -p $OUTPUT_PYTHON_DIRECTORY/$p
    NORM=$(find $SOURCE_PATH/$p -name NORM-BUILD-OUTPUT)
    set +e
    PYTHONPACKAGE1=$(grep -r "Making python package" $NORM | cut -d ' ' -f 5)
    PYTHONPACKAGE2=$(grep -ri "IDL Compiling for OmniOrb" $NORM | cut -d ' ' -f 7 )
    PYTHONPACKAGE3=$(grep -ri "XSD Compiling with" $NORM | cut -d ' ' -f 7 )
    set -e
    PYTHONPACKAGE=$(echo $PYTHONPACKAGE1 $PYTHONPACKAGE2 $PYTHONPACKAGE3)


    #matching using NORM-BUILD-OUTPUT
    for l in $PYTHONPACKAGE; do
        lnew=${l##*/}
        py=$(find $LIB_PATH -type d -iname $lnew)
        echo "$lnew - $py - find $LIB_PATH -type d -iname $lnew"
        if [[ "$py" != '' ]] ; then

            cp -r $py $OUTPUT_PYTHON_DIRECTORY/$p/

            if [ -d $py"__POA" ]; then
                cp -r $py"__POA" $OUTPUT_PYTHON_DIRECTORY/$p/
            fi

            if [ -f $py"_idl.py" ]; then
                cp -r $py"_idl.py" $OUTPUT_PYTHON_DIRECTORY/$p/
            fi            

            if [ -f $py"Impl.py" ]; then
                cp -r $py"_idl.py" $OUTPUT_PYTHON_DIRECTORY/$p/
            fi            

        fi

    done


    #matching with package's name
    py=$(find $LIB_PATH/python/site-packages -mindepth 1 -maxdepth 1  -type d -iname $p)
    if [[ "$py" != '' ]] ; then
        cp -r $py $OUTPUT_PYTHON_DIRECTORY/$p/

        if [ -d $py"__POA" ]; then
            cp -r $py"__POA" $OUTPUT_PYTHON_DIRECTORY/$p/
        fi

        if [ -f $py"_idl.py" ]; then
            cp -r $py"_idl.py" $OUTPUT_PYTHON_DIRECTORY/$p/
        fi            

        if [ -f $py"Impl.py" ]; then
            cp -r $py"Impl.py" $OUTPUT_PYTHON_DIRECTORY/$p/
        fi            

    fi
}