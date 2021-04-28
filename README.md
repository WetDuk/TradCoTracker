# How to execute code:

Make sure ruby is installed: https://rubyinstaller.org/
Open command prompt from folder holder project
$ bundle install
$ Rails s
Open localhost:3000 on a browser like Chrome

# How to deploy to the app to Heroku:

A more detailed tutorial is: https://devcenter.heroku.com/articles/getting-started-with-rails6
Deploy the rails demo app to Heroku:
prerequisites: install Rails, Git and the Heroku CLI.
Open the command prompt from github desktop (ignore the $)
$ heroku login (or $ heroku login -i if you want to stay in the terminal)
$ heroku git:clone -a “heroku name”
$ git add . (the dot is necessary)
$ git commit -m “write your message here”
$ git push heroku master {master is default unless changed in heroku}
$ heroku run rake db:migrate (since you will be using database)

# How to do the CI/CD process

These processes are maintained by Github through their actions tab in the repo

# The CI/CD process is contained in, “.github/workflows”, located inside the current directory

Inside the folder you will find the master.yml which contains all the jobs that will be run upon a push or pull request in the repo.

# A more detailed tutorial that helped when making this app:

https://developer.servicenow.com/blog.do?p=/post/cicd-pipeline-github-actions/

#Any other details we need to know to maintain the code
-To run rubocop on the code just run the command rubocop in the root directory
-To run rspec tests just run the command rspec in the root directory. Also all the test code can be found under the “spec” folder
-All style sheets are in the under “app/assets/stylesheets”
-All images used are under “app/assets/images”
