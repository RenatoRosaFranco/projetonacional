 #!/bin/bash

# set your own routine here
prepare(){
 bundle install
 if [ $1 != 'production' ]; then
  rails db:drop RAILS_ENV=$1
 fi
 rails db:create RAILS_ENV=$1 && rails db:migrate RAILS_ENV=$1
 rails ydb:seed RAILS_ENV=$1
 rspec; rubocop;  rails_best_practices; brakeman
 echo "environment prepapred as $1"
}

# here is rails default environments
# development, test, production
if [ $1 = 'development' ]; then
  prepare
elif [ $1 = 'test' ]; then
  prepare
elif [ $1 = 'production' ]; then
  prepare
else
  echo "Unknow environment"
fi