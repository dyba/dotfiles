{:user
 {:signing {:gpg-key "16D15B5A"}
  :plugins [[lein-exec "0.3.1"]
            [lein-pprint "1.1.1"]
            [codox "0.8.10"]
            [lein-set-version "0.4.1"]
            [lein-environ "1.0.0"]
            [lein-cljfmt "0.5.7"]
            [lein-midje "3.2.1"]]}
 :repl
 {:dependencies [[org.clojure/tools.nrepl "0.2.12"]
                 [alembic "0.3.2"]]
  :plugins [[refactor-nrepl "2.4.0"]
            [cider/cider-nrepl "0.18.0"]]}}
