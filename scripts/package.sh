set -e

VERSION=2017.08
BIN_DIRECTORY=../files/bins
LIB_DIRECTORY=../files/libs
PYTHON_DIRECTORY=../files/python
JAR_DIRECTORY=../files/jars

bin_folder=0
jar_folder=0
lib_folder=0
py_folder=0

for p in $(ls $BIN_DIRECTORY); do
    PACKAGE_PATH="$p-$VERSION"
    SPEC_PATH="../SPECS/acs-cb-$p.spec"

    mkdir -p ../packages/$PACKAGE_PATH/{bin,lib,java,site-packages}
    cp ../template.spec $SPEC_PATH
    sed -i "s/ACS-acsstartup/$p/g" $SPEC_PATH

    rpmdev-bumpspec --comment="Automatic Packaging" \
        --userstring="Maximiliano Osorio-Bañados+mosorio@inf.utfsm.cl" $SPEC_PATH

    if [ "$(ls -A $BIN_DIRECTORY/$p/)" ]; then
        cp $BIN_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/bin/
        bin_folder=1
    fi

    if [ "$(ls -A $LIB_DIRECTORY/$p/)" ]; then
        cp $LIB_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/lib/
        lib_folder=1
    fi
    
    if [ "$(ls -A $JAR_DIRECTORY/$p/)" ]; then
        cp $JAR_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/java/
        jar_folder=1
    fi

    if [ "$(ls -A $PYTHON_DIRECTORY/$p/)" ]; then
        cp -r $PYTHON_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/site-packages/
        py_folder=1
    fi

    tar -zcvf ../packages/$PACKAGE_PATH.tar.gz  -C ../packages/ $PACKAGE_PATH
    rsync -av ../packages/$PACKAGE_PATH.tar.gz acs.maxi@builder.csrg.cl:~/rpmbuild/SOURCES/

    # If there is no bin_folder, it get's commentend out from every macro
    if [ "$bin_folder" -lt 1 ]; then
        sed -i '/%{_usr}\/local\/bin\/*/s/^/#/' $SPEC_PATH
    fi
    # Same for the rest
    if [ "$lib_folder" -lt 1 ]; then
        sed -i '/%{_usr}\/local\/%{_lib}\/*/s/^/#/' $SPEC_PATH
    fi
    if [ "$java_folder" -lt 1 ]; then
        sed -i '/%{_usr}\/local\/share\/java\/*/s/^/#/' $SPEC_PATH
    fi
    if [ "$py_folder" -lt 1 ]; then
        sed -i '/%{_usr}\/local\/lib\/python\/site-packages\/*/s/^/#/' $SPEC_PATH
    fi

    rsync -av $SPEC_PATH acs.maxi@builder.csrg.cl:~/rpmbuild/SPECS/acs-cb-$p.spec
done

