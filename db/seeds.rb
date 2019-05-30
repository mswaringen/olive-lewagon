# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning the seeds on the floor'
Transaction.destroy_all
Portfolio.destroy_all
User.destroy_all
Ngo.destroy_all


puts 'Creating NGOS...'
unicef = Ngo.create!(
  name: 'UNICEF',
  description: 'UNICEF works day-in day-out in the world’s toughest places to reach the most vulnerable and disadvantaged children. Delivering results for children and young people is our driving force.',
  impact: '10 euro for 1 month tution fee per kids',
  photo: 'https://images.unsplash.com/photo-1528502668750-88ba58015b2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
wateraid = Ngo.create!(
  name: 'Wateraid',
  description: 'We are the leading clean water non-profit. Since 1981, we have equipped people with clean water and decent toilets empowering them to unlock their potential.',
  impact: '5 euro for maintain clean water on 1 village',
  photo: 'https://images.unsplash.com/photo-1437914983566-976d85602771?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
save = Ngo.create!(
  name: 'Save The Elephants',
  description: 'Our mission is to secure a future for elephants and to sustain the beauty and ecological integrity of the places they live; to promote man’s delight in their intelligence and the diversity of their world, and to develop a tolerant relationship between the two species.',
  impact: '15 euro for help dismiss elephant poachers in 2 weeks',
  photo: 'https://images.unsplash.com/photo-1521651201144-634f700b36ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
against = Ngo.create!(
  name: 'Against Malaria',
  description: 'We protect people from malaria. We fund nets and ensure they are distributed and used. We show you where the nets go. We monitor and report their use and impact.',
  impact: '1 euro for 5 malaria net',
  photo: 'http://mediablackberry.com/wp-content/uploads/2017/07/Sierra-Leone-begins-bed-net.jpg')
ingo = Ngo.create!(
  name: 'INGO Forum Myanmar',
  description: 'INGO Forum members share common values and principles based on the commitment to promote social equity, economic progress, access to services, safety and security and a better standard of living for people across the country. Our aim is to influence and increase the effectiveness and coherence of humanitarian assistance, peace building and development efforts in Myanmar.',
  impact: '10 euro wil provide education for 2 people per month',
  photo: 'https://images.unsplash.com/photo-1469082993720-0b12bbd9e68b?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')

puts 'Creating users...'
mark = User.new(email: 'mark@olive.com', first_name: 'Mark', password: 'topsecret', password_confirmation: 'topsecret')
mark.save(validate: false)
marisa = User.new(email: 'marisa@olive.com', first_name: 'Marisa', password: 'topsecret', password_confirmation: 'topsecret')
marisa.save(validate: false)
antoinette = User.new(email: 'antoinette@olive.com', first_name: 'Antoinette', password: 'topsecret', password_confirmation: 'topsecret')
antoinette.save(validate: false)
testing = User.new(email: 'test@olive.com', first_name: 'Test', password: 'topsecret', password_confirmation: 'topsecret')
testing.save(validate: false)
fakename = User.new(email: 'fakename@olive.com', first_name: 'Fakename', password: 'topsecret', password_confirmation: 'topsecret')
fakename.save(validate: false)


puts 'Creating Portfolio..'
one =Portfolio.create!(ngo: unicef, user: mark)
two = Portfolio.create!(ngo: wateraid, user: marisa)
three = Portfolio.create!(ngo: save, user: antoinette)
four = Portfolio.create!(ngo: against, user: testing)
five = Portfolio.create!(ngo: ingo, user: fakename)

puts 'Creating Transactions..'
Transaction.create!(
  portfolio: two,
  amount_cents: 1000,
  transaction_date: Date.new(2019, 01, 20))
Transaction.create!(
  portfolio: two,
  amount_cents: 950,
  transaction_date: Date.new(2019, 02, 20))
Transaction.create!(
  portfolio: two,
  amount_cents: 1100,
  transaction_date: Date.new(2019, 03, 20))
Transaction.create!(
  portfolio: two,
  amount_cents: 1200,
  transaction_date: Date.new(2019, 04, 20))
Transaction.create!(
  portfolio: two,
  amount_cents: 1250,
  transaction_date: Date.new(2019, 05, 20))
Transaction.create!(
  portfolio: one,
  amount_cents: 2200,
  transaction_date: Date.new(2019, 04, 20))
Transaction.create!(
  portfolio: one,
  amount_cents: 1250,
  transaction_date: Date.new(2019, 05, 20))

puts 'Seeding done..'
