from clojure
env jar app-standalone.jar
copy . /usr/src/app
workdir /usr/src/app
run lein deps && \
  mv $(lein uberjar | perl -ne 'print \$1 if /^Created \(.*standalone\.jar\)/' -) "$jar"
cmd ["java", "-jar", "$jar"]
