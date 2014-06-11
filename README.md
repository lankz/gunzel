Zangetsu
========

An opinionated Rails starter application that has everything you need to hit the ground running on your next project.

[![Dependency Status](https://gemnasium.com/lankz/zangetsu.svg)](https://gemnasium.com/lankz/zangetsu)

Goodies
-------

* Rails 4.1.1 (duh)
* Custom view scaffold templates using [HAML](https://github.com/indirect/haml-rails), [Simple Form](https://github.com/plataformatec/simple_form), [Bootstrap](http://getbootstrap.com/) and [FontAwesome](http://fortawesome.github.io/Font-Awesome/)
* Custom model and controller scaffold templates using [Responders](https://github.com/plataformatec/responders) and [Has scope](https://github.com/plataformatec/has_scope)
* [Devise](https://github.com/plataformatec/devise), [CanCan](https://github.com/CanCanCommunity/cancancan) and [Rolify](https://github.com/EppO/rolify)
* [RSpec](https://github.com/rspec/rspec-rails) and [Cucumber](https://github.com/cucumber/cucumber-rails)
* [Foreman](https://github.com/ddollar/foreman) and pre-configuration for deployment on [Heroku](https://www.heroku.com/)
* Loads more...

Usage
-----

Zangetsu is distributed as a customised generated Rails application scaffold (not as a [Rails application template](http://guides.rubyonrails.org/rails_application_templates.html), which would be nice but the idea of stuffing so many customisations into a single script is a little scary).

As it's not a gem (yet), you'll need to work with the Git repository to get at the code. If you're starting a new project there are few different options here. The recommended approach is:

```bash
# create a new project directory and switch to it
mkdir my_project && cd $_

# initialise a new repository with zangetsu as an upstream remote
git init
git remote add zangetsu git@github.com:lankz/zangetsu.git
git pull zangetsu/master
```

Zangetsu is not pre-configured for any particular DBMS (please use Postgres :bowtie:) and *should* work with anything Rails does. The database configuration file `config/database.yml` is not checked into version control, so you'll need to copy an example across and customise it before you can proceed.

```bash
cp config/database/postgresql.example.yml config/database.yml
# edit database configuration to suit
vim config/database.yml
./bin/rake db:setup --trace
```

For security reasons it's a good idea to generate a new `secret_key_base`:

```bash
./bin/rake secret | pbcopy
vim config/secrets.yml
```

There are loads of other configuration options for Zangetsu and it's dependencies - you'll want to check out the files in `config/initializers`.

Finally, here are a few tricks for starting the Rails console and web server (if you deploy on Heroku and don't already use [foreman](https://github.com/ddollar/foreman) you should definitely familiarise yourself with it):

```bash
# using foreman (recommended)
./bin/foreman run ./bin/rails console

# other options (somewhat not recommended)
./bin/rails console
./bin/rails server --port 5000
./bin/unicorn --port 5000

# navigate to the application in your default browser :)
open 'http://localhost:5000/'
```
