#! /bin/cat

# http://stackoverflow.com/a/5726599
# set version
VER="0.3.0-SNAPSHOT"
mvn versions:set -DnewVersion=$VER
# revert or commit
# mvn versions:revert
# mvn versions:commit
