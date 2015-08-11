user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

ArmorType.find_or_create_by!(name: 'cloth')
ArmorType.find_or_create_by!(name: 'leather')
ArmorType.find_or_create_by!(name: 'mail')
ArmorType.find_or_create_by!(name: 'plate')

Category.find_or_create_by!(name: 'challenge mode')
Category.find_or_create_by!(name: 'character services')
Category.find_or_create_by!(name: 'dungeons')
Category.find_or_create_by!(name: 'other services')
Category.find_or_create_by!(name: 'proving grounds')
Category.find_or_create_by!(name: 'raiding')

Classification.find_or_create_by!(name: 'druid')
Classification.find_or_create_by!(name: 'death knight')
Classification.find_or_create_by!(name: 'demon hunter')
Classification.find_or_create_by!(name: 'hunter')
Classification.find_or_create_by!(name: 'mage')
Classification.find_or_create_by!(name: 'monk')
Classification.find_or_create_by!(name: 'priest')
Classification.find_or_create_by!(name: 'paladin')
Classification.find_or_create_by!(name: 'rogue')
Classification.find_or_create_by!(name: 'shaman')
Classification.find_or_create_by!(name: 'warlock')
Classification.find_or_create_by!(name: 'warrior')

Difficulty.find_or_create_by!(name: 'normal')
Difficulty.find_or_create_by!(name: 'heroic')
Difficulty.find_or_create_by!(name: 'mythic')

Faction.find_or_create_by!(name: 'horde')
Faction.find_or_create_by!(name: 'alliance')

LootOption.find_or_create_by!(name: 'none')
LootOption.find_or_create_by!(name: 'personal')
LootOption.find_or_create_by!(name: 'master')

Mount.find_or_create_by!(name: 'none')

OrderLineStatus.find_or_create_by!(name: 'paid')
OrderLineStatus.find_or_create_by!(name: 'lead')
OrderLineStatus.find_or_create_by!(name: 'scheduled')
OrderLineStatus.find_or_create_by!(name: 'completed')

PaymentStatus.find_or_create_by!(name: 'paid')
PaymentStatus.find_or_create_by!(name: 'unpaid')

PaymentType.find_or_create_by!(name: 'gold')
PaymentType.find_or_create_by!(name: 'paypal')
PaymentType.find_or_create_by!(name: 'skrill')

PlayStyle.find_or_create_by!(name: 'self-play')
PlayStyle.find_or_create_by!(name: 'pilotted')

PrimaryStat.find_or_create_by!(name: 'agility')
PrimaryStat.find_or_create_by!(name: 'intellect')
PrimaryStat.find_or_create_by!(name: 'strength')

Region.find_or_create_by!(name: 'us')
Region.find_or_create_by!(name: 'eu')

TeamStatus.find_or_create_by!(name: 'pending')
TeamStatus.find_or_create_by!(name: 'active')
TeamStatus.find_or_create_by!(name: 'inactive')

TierToken.find_or_create_by!(name: 'conqueror')
TierToken.find_or_create_by!(name: 'protector')
TierToken.find_or_create_by!(name: 'vanquisher')

Zone.find_or_create_by!(name: 'highmaul')
Zone.find_or_create_by!(name: 'blackrock foundry')
Zone.find_or_create_by!(name: 'hellfire citadel')