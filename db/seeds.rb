# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Entry.destroy_all
Category.destroy_all
User.destroy_all

category_data = [
  {
    name: "rent"
  },
  {
    name: "transportation"
  },
  {
    name: "groceries"
  },
  {
    name: "food"
  },
  {
    name: "salary"
  },
  {
    name:"beverages"
  }
]

Category.create(category_data)

user_data = [
  {
    email: "admin@admin",
    username: "admin",
    password:"123",
  },
  {
    email: "admin2@admin2",
    username: "admin2",
    password:"123",
  }
]
User.create(user_data)

day = Date.new(2017,2,23)
user_id = User.first.id
category_id = Category.last.id
entry_data = [
  {
    amount: "12.60",
    entry_type: "expense",
    day: day,
    payment_type: "cash",
    notes: "snacks",
    vendor: "Walgreens",
    recurring: false,
    category_id:category_id ,
    user_id: user_id
  },
  {
    amount: "45.00",
    entry_type: "expense",
    day: day,
    payment_type: "debit card",
    notes: "transportation",
    vendor: "Bart",
    recurring: true,
    category_id: category_id,
    user_id: user_id

  },
  {
    amount: "4.30",
    entry_type: "expense",
    day: day,
    payment_type: "cash",
    notes: "delicious coffee",
    vendor: "Starbucks",
    recurring: false,
    category_id: category_id,
    user_id: user_id
  },
  {
    amount: "500",
    entry_type: "income",
    day: day,
    payment_type: "check",
    notes: "salary",
    vendor: "My Job",
    recurring: true,
    category_id:category_id,
    user_id: user_id
  }
]
  Entry.create(entry_data)
