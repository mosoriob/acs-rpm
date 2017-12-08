DATA=/jenkins_data/merges/alma/ACS-2017OCT/ACSSW/Sources/
PACKAGES=$(ls /jenkins_data/merges/alma/ACS-2017OCT/ACSSW/Sources/)

rm -rf pys
for p in $PACKAGES; do
        mkdir -p pys/$p
        NORM=$(find $DATA$p -name NORM-BUILD-OUTPUT)
	PYTHONPACKAGE=$(grep -r "lib/python/" $NORM | cut -d ' ' -f 5 | sed "s/..\/lib\/python\/site-packages\///g")
	for l in $PYTHONPACKAGE; do
		#get only filename
                lnew=${l##*/}
		py=$(find /jenkins_data/merges/alma/ACS-2017OCT/ACSSW/lib/ -type f -name $lnew)
                if [[ "$py" != '' ]] ; then
                        cp $py pys/$p/
			echo $py
                fi
	done
done	
