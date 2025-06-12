# The Gossip Project – First Views

Welcome to my first Rails app with a touch of front-end! 🎉

## Objective

Build the first version of *The Gossip Project*, featuring basic pages and a clean layout using Bootstrap.

## Features

- Home page displaying all gossips
- Team page (`/team`)
- Contact page (`/contact`)
- Personalized welcome page (`/welcome/:first_name`)
- Individual gossip show page (`/gossips/:id`)
- User profile page (`/users/:id`)
- Layout with Bootstrap (cards, header, etc.)
- Header with navigation links

## Installation

```bash
git clone https://github.com/flosteno/the-gossip-project.git
cd the-gossip-project
bundle install
rails db:create db:migrate db:seed
rails server
```

## Technologies Used

- Ruby on Rails
- Bootstrap 5 (via CDN)
- Sqlite