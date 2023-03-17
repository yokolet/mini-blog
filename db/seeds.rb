# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(
  email: "john.doe@example.com",
  first_name: "John",
  last_name: "Doe"
)

user2 = User.create(
  email: "jane.smith@example.com",
  first_name: "Jane",
  last_name: "Smith"
)

Post.create(
  [{
     user: user1,
     title: "Accidentally, I created a Rails app!",
     content: "My days are this, that and blah. Wait! I accidentally created a Rails app!!"
   },
   {
     user: user2,
     title: "Blogging",
     content: "I like blogging. It's fun. One day, I started writing a blog post..."
   },
   {
     user: user2,
     title: "Spring!",
     content: "It's not about a web framework here. I'm talking about a season. Yes, Spring!"
   }
  ]
)
