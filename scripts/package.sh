set -e

VERSION=2017.06
BIN_DIRECTORY=../files/bins
LIB_DIRECTORY=../files/libs
PYTHON_DIRECTORY=../files/python
JAR_DIRECTORY=../files/jars


for p in $(ls $BIN_DIRECTORY); do
    PACKAGE_PATH="$p-$VERSION"
	mkdir -p packages/$PACKAGE_PATH/{bin,lib,java,site-packages}

	#move bins
    find $BIN_DIRECTORY/$p/ -type f -exec cp $BIN_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/bin/ {} \;
    find $LIB_DIRECTORY/$p/ -type f -exec cp $LIB_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/lib/ {}\;
    find $JAR_DIRECTORY/$p/ -type f -exec cp $JAR_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/java/ {} \;
    find $PYTHON_DIRECTORY/$p/ -type f -exec cp $PYTHON_DIRECTORY/$p/* ../packages/$PACKAGE_PATH/site-packages/\;


    tar -zcvf  packages/$PACKAGE_PATH.tar.gz  -C packages/ $PACKAGE_PATH
	rsync -av packages/$PACKAGE_PATH.tar.gz acs.maxi@builder.csrg.cl:~/rpmbuild/SOURCES/


    cp template.spec tmp.spec
    sed -i "s/ACS-acsstartup/$p/g" tmp.spec
	rsync -av tmp.spec acs.maxi@builder.csrg.cl:~/rpmbuild/SPECS/acs-cb-$p.spec
    rm tmp.spec
    exit
done

