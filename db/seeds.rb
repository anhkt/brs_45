2.times do |n|
   name = Faker::Name.name
   Category.create!(name: name)  
end

categories = Category.take(2)

2.times do 
  title = Faker::Book.title
  author = Faker::Book.author
  description = Faker::Lorem.characters(200)
  date = Faker::Date.between(1.days.ago, Date.today)
  number_page = Faker::Number.between(1, 100)
  categories.each{ |category|
    category.books.create!(title: title, author: author,
    publish_date: date, page: number_page, description: description)
  }
end
