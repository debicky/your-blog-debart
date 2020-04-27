# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.create!(email: "artur@artur.pl", password: "password", password_confirmation: "password", admin: true, username: "Artur")

User.create!(username: "Artur",
    email: "admin@admin.pl",
    password: 'password',
    password_confirmation: 'password',
    admin: true)

10.times do |_i|
  User.create!(username: Faker::Name.unique.first_name,
               email: Faker::Internet.unique.email,
               password: 'password',
               password_confirmation: 'password',
               admin: false)
end

pseudo_rng = Random.new

10.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence(word_count: 3, random_words_to_add: 7)
  post.body = Faker::Lorem.paragraph_by_chars(number: 1500)
  post.user = User.find(Faker::Number.within(range: 1..10))
  post.thumbnail.attach(io: open('https://picsum.photos//1080'), filename: "#{i}_thumbnail.jpg")
  post.views = Faker::Number.between(from: 1, to: 5000)
  post.save

  (2 + pseudo_rng.rand(8)).times do |_j|
    comment = post.comments.build(body: Faker::Lorem.paragraph_by_chars(number: 500),
                                  user: User.find(2 + pseudo_rng.rand(10)))
    comment.save
    pseudo_rng.rand(5).times do |_k|
      nested_comment = comment.comments.build(body: Faker::Lorem.paragraph_by_chars(number: 500),
                                              user: User.find(2 + pseudo_rng.rand(1)),
                                              reply: true)
      nested_comment.save
    end
  end

end