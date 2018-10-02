#! /bin/cat

# use maven-dependency-plugin
## https://stackoverflow.com/a/7110499
mvn dependency:get -Dartifact=junit:junit:4.8.2 -Ddest=. -Dtransitive=false

# may need to specify the plugin version
## https://stackoverflow.com/a/2872795
mvn org.apache.maven.plugins:maven-dependency-plugin:2.8:get \
                   -Dartifact=junit:junit:4.8.2 -Ddest=. -Dtransitive=false

# download `LATEST`(or latest `RELEASE`) version and save to specific name
mvn dependency:get -Dartifact=junit:junit:LATEST -Ddest=./junit.jar -Dtransitive=false

# point to a specific remote-repo
mvn dependency:get -DremoteRepositories=http://repo1.maven.org/maven2/ \
                   -Dartifact=junit:junit:LATEST -Ddest=./junit.jar -Dtransitive=false
