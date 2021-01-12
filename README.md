# TimeClock
The project description was more clear compared to the other one. And the other project would take more time to complete. That is why I chose this project.

## Prerequisite
- Ruby 2.7.0
- Rails 6.1.1
- Bootstrap 4
- jQuery

## Installation
Follow these easy steps to run the project locally:
### Clone the repository
```
git clone git@github.com:shariful-alam/timeclock.git
```

### Create database.yml file
Copy the sample database.yml file and edit the database configuration as required:
```
cp config/database.yml.sample config/database.yml
```

### Install the app
Now run the following commands to run the project locally:
```
bundle install
rails db:create
rails db:migrate
yarn
rails s
```

And now you can visit the site with the URL http://localhost:3000