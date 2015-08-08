# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
num_teams = 20
num_users = 20
num_memberships = 20
num_order_lines = 100
num_products = 10
num_characters = 15
num_customers = 25

Category.create!(name: 'raiding')

Difficulty.create!(name: 'normal')
Difficulty.create!(name: 'heroic')
Difficulty.create!(name: 'mythic')

LootOption.create!(name: 'none')
LootOption.create!(name: 'personal')
LootOption.create!(name: 'master')

Mount.create!(name: 'none')

PlayStyle.create!(name: 'self-play')
PlayStyle.create!(name: 'pilotted')

Zone.create!(name: 'highmaul')
Zone.create!(name: 'blackrock foundry')
Zone.create!(name: 'hellfire citadel')

Faction.create!(name: 'horde')
Faction.create!(name: 'alliance')

Region.create!(name: 'us')
Region.create!(name: 'eu')

ArmorType.create!(name: 'cloth')

Classification.create!(name: 'priest')

PrimaryStat.create!(name: 'intellect')

TierToken.create!(name: 'conqueror')

OrderLineStatus.create!(name: 'pending scheduling')
OrderLineStatus.create!(name: 'lead')
OrderLineStatus.create!(name: 'scheduled')
OrderLineStatus.create!(name: 'completed')


PaymentStatus.create!(name: 'paid')
PaymentStatus.create!(name: 'unpaid')

num_customers.times do
  Customer.create!(
    email: Faker::Internet.email,
    battle_tag: 'battle#1234',
    skype: Faker::Internet.user_name
    )
end
num_customers = Customer.count

num_characters.times do
  Character.create!(
    spec: Faker::Lorem.word,
    armor_type: ArmorType.order("RANDOM()").first,
    classification: Classification.order("RANDOM()").first,
    primary_stat: PrimaryStat.order("RANDOM()").first,
    tier_token: TierToken.order("RANDOM()").first,
    )  
end
num_characters = Character.count

num_users.times do
  name = Faker::Name.name
  User.create!(
    name: name,
    email: Faker::Internet.email,
    password: 'password',
    confirmed_at: DateTime.now
    )
  puts "Created user: #{name}"
end
num_users = User.count

num_teams.times do
  name = Faker::Team.name.titleize
  user = User.order("RANDOM()").first
  Team.create!(
    name: name,
    user: user,
    )
  puts "Created team: #{name}"
end
num_teams = Team.count

num_memberships.times do
  user = User.order("RANDOM()").first
  team = Team.order("RANDOM()").first
  Membership.create!(
    user: user,
    team: team,
    confirmed: true,
    )
  puts "Membership created #{user.name}@#{team.name}"
end
num_memberships = Membership.count

num_products.times do
  Product.create!(
    description: Faker::Lorem.word,
    category: Category.order("RANDOM()").first,
    difficulty: Difficulty.order("RANDOM()").first,
    loot_option: LootOption.order("RANDOM()").first,
    mount: Mount.order("RANDOM()").first,
    play_style: PlayStyle.order("RANDOM()").first,
    zone: Zone.order("RANDOM()").first,
    )
end
num_products = Product.count

num_order_lines.times do
  OrderLine.create!(
    order: Faker::Number.number(4),
    product: Product.order("RANDOM()").first,
    customer: Customer.order("RANDOM()").first,
    team: Team.order("RANDOM()").first,
    character: Character.order("RANDOM()").first,
    order_line_status: OrderLineStatus.order("RANDOM()").first,    
    payment_status: PaymentStatus.order("RANDOM()").first,
    sale: 9999.99,
    merchant_fee: 999.99,
    site_fee: 99.99,
    contractor_payment: 9.99
  )
  puts 'Created order line.'
end
num_order_lines = OrderLine.count