# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#  comment = Comment.create(title)

#  rails generate migration CreateUser name:string photo:string bio:string posts_counter:integer
# rails generate migration CreatePost title:string text:text comments_counter:integer likes_counter:integer
# rails generate migration CreateComments text:text
# rails generate migration CreateLike

# rails generate migration AddUserRefToPosts author:references:index
# rails generate migration AddUserRefToComments author:references:index
# rails generate migration AddUserRefToLikes author:references:index
# rails generate migration AddPostRefToComments post:references:index
# rails generate migration AddPostRefToLikes post:references:index

first_user = User.create(Name: 'Tom', Photo: 'https://unsplash.com/photos/F_-0BxGuVvo', Bio: 'Teacher from Mexico.')

first_post = Post.create(user: 1, title: 'Hello', text: 'This is my first post')
second_post = Post.create(user_id:2, title: 'Hello', text: 'This is my first post')
third_post = Post.create(user_id: 2, title: 'Hello', text: 'This is my first post')