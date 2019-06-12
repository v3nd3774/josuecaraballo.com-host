from clojure
env jar app-standalone.jar
copy . /usr/src/app
workdir /usr/src/app
run lein deps && \
  $(lein uberjar | perl -ne 'print \$1 if /^Created \(.*standalone\.jar\)/' -) | xargs -i mv {} "$jar"
cmd ["java", "-jar", "$jar"]
