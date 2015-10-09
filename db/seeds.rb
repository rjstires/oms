admin = User.create!(
  name: "Jarvis Dresden",
  email: "jarvis.dresden@gmail.com",
  battle_tag: "uninspired#1955",
  skype: "jarvis.dresden",
  confirmed_at: Time.zone.now,
  role: "admin",
  password: "password"
  )

@armor_type_cloth = ArmorType.find_or_create_by!(name: 'cloth')
@armor_type_leather = ArmorType.find_or_create_by!(name: 'leather')
@armor_type_mail = ArmorType.find_or_create_by!(name: 'mail')
@armor_type_plate = ArmorType.find_or_create_by!(name: 'plate')
@armor_type_undefined = ArmorType.find_or_create_by!(name: 'undefined')

Category.find_or_create_by!(name: 'challenge mode')
Category.find_or_create_by!(name: 'character services')
Category.find_or_create_by!(name: 'dungeons')
Category.find_or_create_by!(name: 'other services')
Category.find_or_create_by!(name: 'proving grounds')
Category.find_or_create_by!(name: 'raiding')

@classification_death_knight = Classification.find_or_create_by!(name: 'death knight')
@classification_druid = Classification.find_or_create_by!(name: 'druid')
@classification_demon_hunter = Classification.find_or_create_by!(name: 'demon hunter')
@classification_hunter = Classification.find_or_create_by!(name: 'hunter')
@classification_mage = Classification.find_or_create_by!(name: 'mage')
@classification_monk = Classification.find_or_create_by!(name: 'monk')
@classification_priest = Classification.find_or_create_by!(name: 'priest')
@classification_paladin = Classification.find_or_create_by!(name: 'paladin')
@classification_rogue = Classification.find_or_create_by!(name: 'rogue')
@classification_shaman = Classification.find_or_create_by!(name: 'shaman')
@classification_warlock = Classification.find_or_create_by!(name: 'warlock')
@classification_warrior = Classification.find_or_create_by!(name: 'warrior')
@classification_undefined = Classification.find_or_create_by!(name: 'undefined')

Difficulty.find_or_create_by!(name: 'normal')
Difficulty.find_or_create_by!(name: 'heroic')
Difficulty.find_or_create_by!(name: 'mythic')

Faction.find_or_create_by!(name: 'horde')
Faction.find_or_create_by!(name: 'alliance')

LootOption.find_or_create_by!(name: 'no loot')
LootOption.find_or_create_by!(name: 'tier only')
LootOption.find_or_create_by!(name: 'yes (personal)')
LootOption.find_or_create_by!(name: 'yes (master loot)')

Mount.find_or_create_by!(name: 'none')
Mount.find_or_create_by!(name: 'ironhoof destoryer')
Mount.find_or_create_by!(name: 'kor\'kron juggernaut')
Mount.find_or_create_by!(name: 'kor\'kron war wolf')
Mount.find_or_create_by!(name: 'none')

PaymentType.find_or_create_by!(name: 'gold')
PaymentType.find_or_create_by!(name: 'paypal')
PaymentType.find_or_create_by!(name: 'skrill')

PlayStyle.find_or_create_by!(name: 'self-play')
PlayStyle.find_or_create_by!(name: 'piloted')

@primary_stat_agility = PrimaryStat.find_or_create_by!(name: 'agility')
@primary_stat_intellect = PrimaryStat.find_or_create_by!(name: 'intellect')
@primary_stat_strength = PrimaryStat.find_or_create_by!(name: 'strength')
@primary_stat_undefined = PrimaryStat.find_or_create_by!(name: 'undefined')

Region.find_or_create_by!(name: 'us')
Region.find_or_create_by!(name: 'eu')

team_status_pending = TeamStatus.find_or_create_by!(name: 'pending')
team_status_active = TeamStatus.find_or_create_by!(name: 'active')
team_status_inactive = TeamStatus.find_or_create_by!(name: 'inactive')

@tier_token_conqueror = TierToken.find_or_create_by!(name: 'conqueror')
@tier_token_protector = TierToken.find_or_create_by!(name: 'protector')
@tier_token_vanquisher = TierToken.find_or_create_by!(name: 'vanquisher')
@tier_token_undefined = TierToken.find_or_create_by!(name: 'undefined')

Zone.find_or_create_by!(name: 'highmaul')
Zone.find_or_create_by!(name: 'blackrock foundry')
Zone.find_or_create_by!(name: 'hellfire citadel')

Character.find_or_create_by!(spec: 'undefined',
  armor_type: @armor_type_undefined,
  classification: @classification_undefined,
  primary_stat: @primary_stat_undefined,
  tier_token: @tier_token_undefined)

Character.find_or_create_by!(spec: 'balance',
  armor_type: @armor_type_leather,
  classification: @classification_druid,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'feral',
  armor_type: @armor_type_leather,
  classification: @classification_druid,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'guardian',
  armor_type: @armor_type_leather,
  classification: @classification_druid,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'restoration',
  armor_type: @armor_type_leather,
  classification: @classification_druid,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'blood',
  armor_type: @armor_type_plate,
  classification: @classification_death_knight,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'frost',
  armor_type: @armor_type_plate,
  classification: @classification_death_knight,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'unholy',
  armor_type: @armor_type_plate,
  classification: @classification_death_knight,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'beast mastery',
  armor_type: @armor_type_mail,
  classification: @classification_hunter,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'marksmanship',
  armor_type: @armor_type_mail,
  classification: @classification_hunter,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'survival',
  armor_type: @armor_type_mail,
  classification: @classification_hunter,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'arcane',
  armor_type: @armor_type_cloth,
  classification: @classification_mage,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'fire',
  armor_type: @armor_type_cloth,
  classification: @classification_mage,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'frost',
  armor_type: @armor_type_cloth,
  classification: @classification_mage,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'brewmaster',
  armor_type: @armor_type_leather,
  classification: @classification_monk,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'mistweaver',
  armor_type: @armor_type_leather,
  classification: @classification_monk,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'windwalker',
  armor_type: @armor_type_leather,
  classification: @classification_monk,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'holy',
  armor_type: @armor_type_plate,
  classification: @classification_paladin,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'protection',
  armor_type: @armor_type_plate,
  classification: @classification_paladin,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'retribution',
  armor_type: @armor_type_plate,
  classification: @classification_paladin,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'discipline',
  armor_type: @armor_type_cloth,
  classification: @classification_priest,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'holy',
  armor_type: @armor_type_cloth,
  classification: @classification_priest,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'shadow',
  armor_type: @armor_type_cloth,
  classification: @classification_priest,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'assassination',
  armor_type: @armor_type_leather,
  classification: @classification_rogue,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'combat',
  armor_type: @armor_type_leather,
  classification: @classification_rogue,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'subtlety',
  armor_type: @armor_type_leather,
  classification: @classification_rogue,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_vanquisher)

Character.find_or_create_by!(spec: 'enhancement',
  armor_type: @armor_type_mail,
  classification: @classification_shaman,
  primary_stat: @primary_stat_agility,
  tier_token: @tier_token_protector)
Character.find_or_create_by!(spec: 'elemental',
  armor_type: @armor_type_mail,
  classification: @classification_shaman,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_protector)
Character.find_or_create_by!(spec: 'restoration',
  armor_type: @armor_type_mail,
  classification: @classification_shaman,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'affliction',
  armor_type: @armor_type_cloth,
  classification: @classification_warlock,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'demonology',
  armor_type: @armor_type_cloth,
  classification: @classification_warlock,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'destruction',
  armor_type: @armor_type_cloth,
  classification: @classification_warlock,
  primary_stat: @primary_stat_intellect,
  tier_token: @tier_token_conqueror)

Character.find_or_create_by!(spec: 'arms',
  armor_type: @armor_type_plate,
  classification: @classification_warrior,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'fury',
  armor_type: @armor_type_plate,
  classification: @classification_warrior,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_protector)

Character.find_or_create_by!(spec: 'protection',
  armor_type: @armor_type_plate,
  classification: @classification_warrior,
  primary_stat: @primary_stat_strength,
  tier_token: @tier_token_protector)

100.times do |n|
  customer_name = Faker::Name.name
  customer_username = Faker::Internet.user_name(customer_name, %w(. _ -))
  customer_email = "#{customer_username}@example.com"
  customer_battletag = "#{customer_username}##{rand(9999)}"
  customer_skype = "skype:#{customer_username}"

  customer = Customer.create!(
    email: customer_email,
    battle_tag: customer_battletag,
    skype: customer_skype,
    )
  p "Created customer #{customer.id}."
end

10.times do |n|
  team_name = "team #{n}"
  team = Team.create!(
    name: team_name,
    name_alias: "#{team_name} alias",
    realm: Faker::Lorem.word,
    region: Region.find(rand(1..Region.count)),
    faction: Faction.find(rand(1..Faction.count)),
    payment_type: PaymentType.find(rand(1..PaymentType.count)),
    payment_address: Faker::Internet.email,
    team_status: team_status_active
    )

  user_name = Faker::Name.name
  user_username = Faker::Internet.user_name(user_name, %w(. _ -))
  user_email = "#{user_username}@example.com"
  user_battletag = "#{user_username}##{rand(9999)}"
  user_skype = "skype:#{user_username}"

  user = User.create!(
    name: user_name,
    skype: user_username,
    email: user_email,
    battle_tag: user_battletag,
    skype: user_skype,
    confirmed_at: Time.zone.now,
    role: "approved",
    password: "password"
    )

  Membership.create!(
    team: team,
    user: user,
    confirmed: true,
    owner: true,
    )
end


50.times do
  product = Product.create!(
    description: Faker::Lorem.word,
    category: Category.find(rand(1..Category.count)),
    zone: Zone.find(rand(1..Zone.count)),
    difficulty: Difficulty.find(rand(1..Difficulty.count)),
    loot_option: LootOption.find(rand(1..LootOption.count)),
    mount: Mount.find(rand(1..Mount.count)),
    play_style: PlayStyle.find(rand(1..PlayStyle.count))
    )
  p "Created product #{product.id}."
end



def generate_sale_figures()
  hsh = {}
  hsh[:sale] = rand(1999)
  hsh[:merchant_fee] = hsh[:sale] * 0.07
  hsh[:site_fee] = hsh[:sale] * 0.194
  hsh[:contractor_payment] = hsh[:sale] * 0.776

  hsh
end



# # lead
# !order_paid, !team_paid, !scheduled_at, !completed_at
5.times { |n|
  figures = generate_sale_figures

  OrderLine.create!(
    order: Faker::Number.number(4),
    customer: Customer.find(rand(1..Customer.count)),
    product: Product.find(rand(1..Product.count)),
    team: Team.find(rand(1..Team.count)),
    character: Character.find(rand(1..Character.count)),
    region: Region.find(rand(1..Region.count)),
    faction: Faction.find(rand(1..Faction.count)),

    sale: figures[:sale],
    merchant_fee: figures[:merchant_fee],
    site_fee: figures[:site_fee],
    contractor_payment: figures[:contractor_payment],

    order_paid: false,
    team_paid: false
    )
  p "Created lead #{n}"
}

# # ready_to_schedule
# order_paid, !team_paid, !scheduled_at, !completed_at
5.times { |n|
  figures = generate_sale_figures

  OrderLine.create!(
    order: Faker::Number.number(4),
    customer: Customer.find(rand(1..Customer.count)),
    product: Product.find(rand(1..Product.count)),
    team: Team.find(rand(1..Team.count)),
    character: Character.find(rand(1..Character.count)),
    region: Region.find(rand(1..Region.count)),
    faction: Faction.find(rand(1..Faction.count)),

    sale: figures[:sale],
    merchant_fee: figures[:merchant_fee],
    site_fee: figures[:site_fee],
    contractor_payment: figures[:contractor_payment],

    order_paid: true,
    team_paid: false,
    )
  p "Created ready to schedule order #{n}"
}

# # scheduled
# order_paid, !team_paid, scheduled_at, !completed_at
5.times { |n|
  scheduled_at = Faker::Time.forward(rand(1..30), :evening)
  figures = generate_sale_figures

  OrderLine.create!(
    order: Faker::Number.number(4),
    customer: Customer.find(rand(1..Customer.count)),
    product: Product.find(rand(1..Product.count)),
    team: Team.find(rand(1..Team.count)),
    character: Character.find(rand(1..Character.count)),
    region: Region.find(rand(1..Region.count)),
    faction: Faction.find(rand(1..Faction.count)),

    sale: figures[:sale],
    merchant_fee: figures[:merchant_fee],
    site_fee: figures[:site_fee],
    contractor_payment: figures[:contractor_payment],

    order_paid: true,
    team_paid: false,
    scheduled_at: scheduled_at,
    )
  p "Created scheduled order #{n}"
}

# # completed_pending_team_payment
# order_paid, !team_paid, scheduled_at, completed_at
5.times{ |n|
  scheduled_at = Faker::Time.forward(rand(1..30), :evening)
  completed_at = scheduled_at + rand(1..14).days
  figures = generate_sale_figures

  OrderLine.create!(
    order: Faker::Number.number(4),
    customer: Customer.find(rand(1..Customer.count)),
    product: Product.find(rand(1..Product.count)),
    team: Team.find(rand(1..Team.count)),
    character: Character.find(rand(1..Character.count)),
    region: Region.find(rand(1..Region.count)),
    faction: Faction.find(rand(1..Faction.count)),

    sale: figures[:sale],
    merchant_fee: figures[:merchant_fee],
    site_fee: figures[:site_fee],
    contractor_payment: figures[:contractor_payment],

    order_paid: true,
    team_paid: false,
    scheduled_at: scheduled_at,
    completed_at: completed_at,
    )
  p "Created completed order, pending team payment #{n}"
}

# # completed_order
# order_paid, team_paid, scheduled_at, completed_at
50.times{ |n|
  scheduled_at = Faker::Time.backward(rand(1..3), :evening)
  completed_at = scheduled_at + rand(3.7).days
  figures = generate_sale_figures()

  OrderLine.create!(
    order: Faker::Number.number(4),
    customer: Customer.find(rand(1..Customer.count)),
    product: Product.find(rand(1..Product.count)),
    team: Team.find(rand(1..Team.count)),
    character: Character.find(rand(1..Character.count)),
    region: Region.find(rand(1..Region.count)),
    faction: Faction.find(rand(1..Faction.count)),

    sale: figures[:sale],
    merchant_fee: figures[:merchant_fee],
    site_fee: figures[:site_fee],
    contractor_payment: figures[:contractor_payment],

    order_paid: true,
    team_paid: true,
    scheduled_at: scheduled_at,
    completed_at: completed_at,
    )
  p "Created completed order #{n}"
}

20.times {|n|
  category = Category.find_by(name: 'raiding')
  difficulty = Difficulty.find(rand(1..Difficulty.count))
  zone = Zone.find(rand(1..Zone.count))
  team = Team.find(rand(1..Team.count))
  start_datetime = Faker::Time.forward(rand(1..30), :evening)
  cutoff_datetime = start_datetime - 1.day

  event = Event.create!(
    category:category,
    difficulty: difficulty,
    zone: zone,
    team: team,
    start_datetime: start_datetime,
    cutoff_datetime: cutoff_datetime
    )

  "Created event #{event.id}"

    rand(1..3).times { |c|

    "Slot #{c}"

      order_line = team.order_lines.order('RANDOM()').first unless c%2==0

      product = Product.where(
        category: category,
        difficulty: difficulty,
        zone: zone
        ).order('RANDOM()').first

      event.slots.create(
        order_line: order_line,
        product: product
      )
    }
}
