{:user
 {:jvm-opts ["-Xmx1024m", "-XX:PermSize=512m", "-XX:MaxPermSize=1024m"]
  :dependencies [[org.clojure/tools.nrepl "0.2.10"]]
  :plugins [[lein-exec "0.3.1"]
            [lein-pprint "1.1.1"]
            [codox "0.8.10"]
            [lein-set-version "0.4.1"]
            [lein-environ "1.0.0"]
            [lein-midje "3.1.3"]
            [refactor-nrepl "1.2.0-SNAPSHOT"]
            [cider/cider-nrepl "0.10.0-SNAPSHOT"]]}}
