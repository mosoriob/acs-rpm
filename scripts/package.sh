set -e

VERSION=2017.08
BIN_DIRECTORY=../files/bins
LIB_DIRECTORY=../files/libs
PYTHON_DIRECTORY=../files/python
JAR_DIRECTORY=../files/jars


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
    fi

    if [ "$(ls -A $LIB_DIRECTORY/$p/)" ]; then
        cp $LIB_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/lib/
    fi
    
    if [ "$(ls -A $JAR_DIRECTORY/$p/)" ]; then
        cp $JAR_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/java/
    fi

    if [ "$(ls -A $PYTHON_DIRECTORY/$p/)" ]; then
        cp $PYTHON_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/site-packages/
    fi

    tar -zcvf ../packages/$PACKAGE_PATH.tar.gz  -C ../packages/ $PACKAGE_PATH
    rsync -av ../packages/$PACKAGE_PATH.tar.gz acs.maxi@builder.csrg.cl:~/rpmbuild/SOURCES/


    rsync -av $SPEC_PATH acs.maxi@builder.csrg.cl:~/rpmbuild/SPECS/acs-cb-$p.spec

done

