
user = User.create(
               email: 'barbara.jenkins@methods.co.uk', password: 'password', password_confirmation: 'password',
               first_name: 'Bee',
               last_name: 'Jenkins',
               username: 'BeeJenkins'
)

user2 = User.create(
    email: 'barbarajenkins_edale@hotmail.com', password: 'password', password_confirmation: 'password',
    first_name: 'B2',
    last_name: 'Jenkins',
    username: 'Bee2',
    admin: true
)

50.times do
post = Post.create(
               title:Faker::Coffee.blend_name,
               body: Faker::Coffee.notes,
               user_id: rand(1..2)
)
end

250.times do
comment = Comment.create(
                     body:Faker::Lorem.paragraph,
                     post_id: rand(1..50),
                     user_id: rand(1..2)
)
  end