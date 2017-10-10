{:user
 {:jvm-opts ["-Xmx1024m", "-XX:PermSize=512m", "-XX:MaxPermSize=1024m"]
  :signing {:gpg-key "16D15B5A"}
  :plugins [[lein-exec "0.3.1"]
            [lein-pprint "1.1.1"]
            [codox "0.8.10"]
            [lein-set-version "0.4.1"]
            [lein-environ "1.0.0"]
            [lein-midje "3.2.1"]]}
 :repl
 {:dependencies [[org.clojure/tools.nrepl "0.2.12"]
                 [alembic "0.3.2"]]
  :plugins [[refactor-nrepl "2.3.0-SNAPSHOT"]
            [cider/cider-nrepl "0.14.0"]]}}
