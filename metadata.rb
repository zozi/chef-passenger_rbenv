name "passenger_rbenv"
maintainer "Zozi"
maintainer_email "dev@zozi.com"
license "Apache 2.0"
description "Chef cookbook for installing passenger with rbenv"
long_description "Please refer to README.md."
version "0.0.11"

depends "ruby_rbenv"
depends "apache2", ">= 2.0.0"

supports "ubuntu"
supports "debian"
