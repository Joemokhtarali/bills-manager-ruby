# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(user_name: 'Mocha', password: '123')
Bill.create(name: 'Rent', date: '12/01/2020', amount: 1000, category: 'Monthly Expenses', user_id: 1 )
Income.create(name: 'W2', date: '12/01/2020', amount: 1000, category: 'Weekly Income', user_id: 1 )
