from clojure
env jar app-standalone.jar
copy . /usr/src/app
workdir /usr/src/app
run ls target | grep standalone | xargs -i mv {} "$jar"
cmd ["java", "-jar", "$jar"]
