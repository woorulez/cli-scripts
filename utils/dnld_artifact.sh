#! /bin/bash

### http://stackoverflow.com/a/19804002
### http://stackoverflow.com/a/1221844

repourl="https://repo1.maven.org/maven2"

groupid=com.github.woorulez
artifactid=test-app
version=0.0.1-SNAPSHOT
classifier=uber

artifact="$groupid:$artifactid:$version:jar${classifier:+:$classifier}"
filename="$artifactid-$version${classifier:+-$classifier}.jar"
linkname="$artifactid${classifier:+-$classifier}.jar"

echo "downloading $artifact to $filename..."
(set -o pipefail; mvn org.apache.maven.plugins:maven-dependency-plugin:2.4:get -Dartifact=$artifact -Ddest=./$filename -DremoteRepositories="$repourl" -Dtransitive=false 2>&1 | tee upgrade.log)
if [ $? -eq 0 ]; then
    echo "linking $linkname to $filename..."
    ln -sf $filename $linkname
else
    echo "maven download failed" >&2
    exit 1
fi
