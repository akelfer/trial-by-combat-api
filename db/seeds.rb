10.times do |i|
  User.create(email: Faker::SiliconValley.email)
end

10.times do 
  Avatar.create(name: Faker::GameOfThrones.character, user_id: rand(1..10))
end

10.times do 
  Post.create(title: Faker::GameOfThrones.quote, body: Faker::HarryPotter.quote, avatar_id: rand(1..10))
end

20.times do 
  Comment.create(body: Faker::NewGirl.quote, avatar_id: rand(1..10), post_id: rand(1..10))
end

20.times do 
  Comment.create(body: Faker::MichaelScott.quote, avatar_id: rand(1..10), post_id: rand(1..10))
end

20.times do 
  Comment.create(body: Faker::Community.quotes, avatar_id: rand(1..10), post_id: rand(1..10))
end

200.times do 
  Vote.create(direction: [1, -1].sample, content_type: 'Post', content_id: rand(1..10), avatar_id: rand(1..10))
end

500.times do
  Vote.create(direction: [1, -1].sample, content_type: 'Comment', content_id: rand(1..60), avatar_id: rand(1..10))
end