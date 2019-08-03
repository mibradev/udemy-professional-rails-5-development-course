User.create!(email: "admin@example.com", password: ENV["RAILS_USER_PASSWORD"], name: "Admin") do |user|
  user.roles << Role.create!(name: "admin")
end

User.create!(email: "user@example.com", password: ENV["RAILS_USER_PASSWORD"], name: "User")

puts "2 users created"

3.times do |i|
  Topic.create!(
    title: "Topic #{i}"
  )
end

puts "3 topics created"

10.times do |i|
  Blog.create!(
    title: "Post #{i}",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    topic_id: Topic.last.id
  )
end

puts "10 blog posts created"

5.times do |i|
  Skill.create!(
    title: "Skill #{i}",
    percent_utilized: 15
  )
end

puts "5 skills created"

9.times do |i|
  Portfolio.create!(
    title: "Portfolio Item #{i}",
    subtitle: "Ruby on Rails",
    body: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  ) do |portfolio|
    portfolio.main_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy', 'eagle-1972979_1280.png')), filename: 'dummy_file.png', content_type: 'image/png')
    portfolio.thumb_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'dummy', 'eagle-1972979_1280.png')), filename: 'dummy_file.png', content_type: 'image/png')
  end
end

puts "9 portfolio items created"

3.times do |i|
  Portfolio.last.technologies.create!(
    name: "Technology #{i}"
  )
end

puts "3 technologies created"
