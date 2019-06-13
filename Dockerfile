from clojure
env jar app-standalone.jar
env appdir /usr/src/app
env t target
copy . $appdir
workdir $appdir
run ls $t | grep standalone | xargs -i mv $t/{} "$jar"
cmd ["sh", "-c", "java -jar $jar"]
