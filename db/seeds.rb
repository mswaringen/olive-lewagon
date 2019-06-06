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
  name: 'Sightsavers',
  description: "You can’t choose where you’re born, and you can’t choose how long you’ll live – but you can choose to leave something behind to make the world better. By including Sightsavers in your will, you could change the future for generations to come.",
  impact: '0.4',
  impact_description: "You just paid for a cataract consumables kit for five operations",
photo: 'https://www.sightsavers.org/wp-content/uploads/2017/08/A-girl-holds-her-baby-brother-in-Tanzania-660x370.jpg')
wateraid = Ngo.create!(
  name: 'Wateraid',
  description: 'WaterAid started in 1981 because no non-profit like us existed. We are determined to make clean water, reliable toilets and good hygiene normal for everyone, everywhere within a generation. Only by tackling these 3 essentials, in ways that last, can people change their lives for good.',
  impact_description: 'builds a household rainwater collection system',
  impact: '0.1',
photo: 'https://images.unsplash.com/photo-1437914983566-976d85602771?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80')
save = Ngo.create!(
  name: 'Sheldrick WildLife Trust',
  description: 'Best known for our work to protect elephants, the Sheldrick Wildlife Trust (SWT) operates the most successful orphan elephant rescue and rehabilitation program in the world. We embrace all measures that complement the conservation, preservation and protection of wildlife including anti-poaching, safe guarding the natural environment, enhancing community awareness and providing veterinary assistance to animals in need.',
  impact_description: 'Foster an elephant and you can follow the progress of your orphan elephant in his/her interactive diary.',
  impact: '2.2',
photo: 'https://images.unsplash.com/photo-1521651201144-634f700b36ef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80')
against = Ngo.create!(
  name: 'Against Malaria',
  description: 'We protect people from malaria. We fund nets and ensure they are distributed and used. We show you where the nets go. We monitor and report their use and impact.',
  impact: '4.2',
  impact_description: 'We estimate that on average the total cost to purchase, distribute, and follow up on the distribution of an AMF-funded LLIN (Malaria nets)',
photo: 'https://mediablackberry.com/wp-content/uploads/2017/07/Sierra-Leone-begins-bed-net.jpg')
ingo = Ngo.create!(
  name: 'Kitabisa',
  description: 'Palu, the city devastated by the quake and tsunami on 2018, is the capital of Central Sulawesi Province. More than 200,000 refugees tried to survive after a devastated natural disaster',
  impact: '20',
  impact_description: 'Whole meals have been donated',
photo: 'https://www.aljazeera.com/mritems/imagecache/mbdxxlarge/mritems/Images/2018/12/25/0bb73d18436348deac7f5a385a671a4f_18.jpg')

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
one =Portfolio.create!(ngo: unicef, user: mark, status: :active)
two = Portfolio.create!(ngo: wateraid, user: marisa, status: :active)
three = Portfolio.create!(ngo: save, user: antoinette, status: :active)
four = Portfolio.create!(ngo: against, user: testing, status: :active)
five = Portfolio.create!(ngo: ingo, user: fakename, status: :active)

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
