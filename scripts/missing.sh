ORIGINAL="/tmp/original"
NEW="/tmp/new"

find /jenkins_data/centos7/alma/ACS-OCT2016/ACSSW/lib  -name *.so -printf "%f\n" | sort | uniq > $ORIGINAL-so
find ../files/  -name *.so -printf "%f\n" | sort | uniq > $NEW-so
diff /tmp/original-so /tmp/new-so > ../so-missing.txt

find /jenkins_data/centos7/alma/ACS-OCT2016/ACSSW/lib  -name *.jar -printf "%f\n" | sort | uniq > $ORIGINAL-jar
find ../files/  -name *.jar -printf "%f\n" | sort | uniq > $NEW-jar
diff /tmp/original-jar /tmp/new-jar > ../jar-missing.txt



#find /jenkins_data/centos7/alma/ACS-OCT2016/ACSSW/lib -maxdepth 1  -name *.jar -printf "%f\n" | sort | uniq > $ORIGINAL

find /jenkins_data/merges/alma/ACS-2017OCT/ACSSW/lib/python/site-packages/  -maxdepth 1  -type d -printf "%f\n" | sort | uniq > $ORIGINAL-python

find ../files/python -mindepth 2 -maxdepth 2 -type d -printf "%f\n" | sort | uniq > $NEW-python

diff /tmp/original-python /tmp/new-python > ../python-missing.txt



#find /jenkins_data/centos7/alma/ACS-OCT2016/ACSSW/lib   -name *.py -printf "%f\n" | sort | uniq > $ORIGINAL
#find ../files/  -name *.py -printf "%f\n" | sort | uniq > $NEW

