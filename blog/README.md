# README

## Installation

Make sure you have Ruby >= 2.7.0 installed (try `ruby --version`), SQLite3 database installed (try `sqlite3 --version`), and Rails installed (`gem install rails` and try `rails --version`).

## Starting up

To start the server, you will need to do

```bash
bin/rails server
```

To launch the interactive Rails console, you can do

```bash
bin/rails console

# Can do create an article like
article = Article.new(title: "Article", body: "Some article body")
article.save

Article.find(1)
Article.all
```

### Scaffolding/Migrating

To generate a controller you can scaffold things out like

```bash
bin/rails generate controller Articles index --skip-routes
```

To generate a model you can scaffold things out like

```bash
bin/rails generate model Article title:string body:text
```

To carry out a database migration, you can do this

```bash
bin/rails db:migrate
```

To inspect what routes are mapped, you can do

```bash
bin/rails routes
```
