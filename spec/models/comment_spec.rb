require 'rails_helper'

RSpec.describe Comment, type: :model do
          before(:all) do
            @user = User.create(
              Name: 'Adewale',
              Photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
              Bio: 'I am a graphic designer',
              PostsCounter: 0
            )
            @post = Post.create(
              title: 'james Packer',
              text: 'the valley',
              user_id: @user.id,
              comments_counter: 0,
              likes_counter: 0
            )
          end
        
          it 'comments_counter should increase by one' do
            Comment.create(text: 'Hello world!', user_id: @user.id, post_id: @post.id)
            Comment.create(text: 'Thank God Its Friday!', user_id: @user.id, post_id: @post.id)
            post = Post.new(@post.id)
            expect(@post.comments_counter).to eq(nil)
          end
        end
        