from clojure
env jar app-standalone.jar
env appdir /usr/src/app
copy . $appdir
workdir $appdir
run ls target | grep standalone | xargs -i mv $appdir/{} "$jar"
cmd ["java", "-jar", "$jar"]
