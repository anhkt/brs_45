User.create!(name: "ducbka",
  email: "ducbka@gmail.com",
  password: "123456",
  password_confirmation: "123456",
  is_admin: true)

Category.delete_all
Category.create! name: "HTML"
Category.create! name: "CSS"
Category.create! name: "Ruby on Rails"
