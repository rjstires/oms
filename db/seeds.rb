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

LootOption.find_or_create_by!(name: 'none')
LootOption.find_or_create_by!(name: 'personal')
LootOption.find_or_create_by!(name: 'master')

Mount.find_or_create_by!(name: 'none')
Mount.find_or_create_by!(name: 'ironhoof destoryer')
Mount.find_or_create_by!(name: 'kor\'kron juggernaut')
Mount.find_or_create_by!(name: 'kor\'kron war wolf')
Mount.find_or_create_by!(name: 'none')

PaymentType.find_or_create_by!(name: 'gold')
PaymentType.find_or_create_by!(name: 'paypal')
PaymentType.find_or_create_by!(name: 'skrill')

PlayStyle.find_or_create_by!(name: 'self-play')
PlayStyle.find_or_create_by!(name: 'pilotted')

@primary_stat_agility = PrimaryStat.find_or_create_by!(name: 'agility')
@primary_stat_intellect = PrimaryStat.find_or_create_by!(name: 'intellect')
@primary_stat_strength = PrimaryStat.find_or_create_by!(name: 'strength')
@primary_stat_undefined = PrimaryStat.find_or_create_by!(name: 'undefined')

Region.find_or_create_by!(name: 'us')
Region.find_or_create_by!(name: 'eu')

TeamStatus.find_or_create_by!(name: 'pending')
TeamStatus.find_or_create_by!(name: 'active')
TeamStatus.find_or_create_by!(name: 'inactive')

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

15.times do 
  Customer.create!(
    email: Faker::Internet.safe_email,
    battle_tag: 'battle#1234',
    skype: 'skype.address'
    )

  100.times do
    OrderLine.create!(
      order: Faker::Number.number(4),

      )

=begin
    t.integer  "order"
    
    t.integer  "product_id",                         null: false
    
    t.integer  "team_id"
    
    t.intseger  "character_id",                       null: false
    
    t.decimal  "sale",                               null: false
    t.decimal  "merchant_fee",                       null: false
    t.decimal  "site_fee",                           null: false
    t.decimal  "contractor_payment",                 null: false
    
    
    t.integer  "customer_id"
    t.datetime "completed_at"
    t.datetime "scheduled_at"
    t.integer  "faction_id",                         null: false
    t.integer  "region_id",                          null: false
    t.boolean  "team_paid",          default: false, null: false
    t.boolean  "order_paid",         default: false, null: false
=end
  end
end