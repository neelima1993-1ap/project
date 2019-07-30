# project

Steps to run the project
-
run 'git clone git@github.com:neelima1993-1ap/project.git'

run 'cd project'

run 'bundle install'

make changes to database.yml if required (adding database password)

run 'rake db:create'

run 'rake db:migrate'

run 'rake db:seed'

run 'rails s'

Navigate to localhost:3000 in your choice of browser and enter credentials: email: admin@yopmail.com, password: admin123

Other requirements
-
install redis server and run it

install sidekiq and run by using command 'sidekiq -q default'





