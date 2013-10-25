# blog

* http://github.com/mnasevic/blog


## DESCRIPTION:

Rails 4 blog application deployed at: [http://milan.nasevic.com](http://milan.nasevic.com)


## INSTALL:

- Clone repository

```
git clone git://github.com/mnasevic/blog.git
cd blog
```

- Install gems

```
bundle install
```

- Setup database

```
rake db:create
rake db:migrate
```

- Seed admin user

```
vi db/seeds.rb
rake db:seed
```

- Start the server

```
rails server
```
