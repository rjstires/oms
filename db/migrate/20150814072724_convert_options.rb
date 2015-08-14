## ArmorType.pluck(:id, :name)
## Category.pluck(:id, :name)
## Classification.pluck(:id, :name)
## Difficulty.pluck(:id, :name)
## Faction.pluck(:id, :name)
## LootOption.pluck(:id, :name)
## Mount.pluck(:id, :name)
## OrderLineStatus.pluck(:id, :name)
## PaymentStatus.pluck(:id, :name)
## PaymentType.pluck(:id, :name)
## PlayStyle.pluck(:id, :name)
## PrimaryStat.pluck(:id, :name)
## Region.pluck(:id, :name)
## TeamStatus.pluck(:id, :name)
## TierToken.pluck(:id, :name)
## Zone.pluck(:id, :name)

existing_armor_types = [[7, "undefined"], [6, "plate"], [5, "mail"], [4, "leather"], [3, "cloth"]]
existing_categories = [[13, "raiding"], [12, "proving grounds"], [11, "other services"], [63, "mythic dungeons"], [10, "dungeons"], [9, "character services"], [8, "challenge mode"], [78, "brawler's guild"]]
existing_classifications = [[25, "warrior"], [24, "warlock"], [26, "undefined"], [23, "shaman"], [22, "rogue"], [20, "priest"], [21, "paladin"], [19, "monk"], [18, "mage"], [17, "hunter"], [15, "druid"], [16, "demon hunter"], [14, "death knight"]]
existing_difficulty = [[27, "normal"], [29, "mythic"], [28, "heroic"]]
existing_factions = [[1, "horde"], [61, "any"], [30, "alliance"]]
existing_loot_options = [[68, "yes (personal)"], [65, "yes (master loot)"], [31, "none"]]
existing_mounts = [[74, "yes (achievement)"], [73, "yes"], [66, "no"]]
existing_order_line_statuses = [[37, "scheduled"], [35, "paid"], [36, "lead"], [38, "completed"]]
existing_payment_statuses = [[40, "unpaid"], [39, "paid"]]
existing_payment_types = [[43, "skrill"], [42, "paypal"], [41, "gold"]]
existing_play_styles = [[44, "self-play"], [70, "piloted"]]
existing_primary_stats = [[49, "undefined"], [48, "strength"], [47, "intellect"], [46, "agility"]]
existing_regions = [[2, "us"], [50, "eu"], [62, "any"]]
existing_team_statuses = [[51, "pending"], [53, "inactive"], [52, "active"]]
existing_tier_token = [[56, "vanquisher"], [57, "undefined"], [55, "protector"], [54, "conqueror"]]
existing_zones = [[80, "throne of thunder"], [67, "skyreach"], [77, "siege of orgrimmar"], [71, "proving grounds"], [64, "package"], [69, "leveling"], [58, "highmaul"], [60, "hellfire citadel"],[75, "dungeons"], [79, "brawler's arena"], [76, "bloodmaul slag mines"], [59, "blackrock foundry"]]

class ConvertOptions < ActiveRecord::Migration
  def change

    ## Armor Types
    existing_armor_types.each do |e|
      @new_value = ArmorType.find_or_create_by!(name: e[1])
      Character
      .where(:aromr_type_id => e[0])
      .update_all(:aromr_type_id => @new_value)
    end

    ## Categories
    existing_categories.each do |e|
      @new_value = Category.find_or_create_by!(name: e[1])
      Product
      .where(:category_id => e[0])
      .update_all(:category_id => @new_value)
    end

    ## Classifications
    existing_classifications.each do |e|
      @new_value = Classification.find_or_create_by!(name: e[1])
      Character
      .where(:classification_id => e[0])
      .update_all(:classification_id => @new_value)
    end

    ## Difficulties
    existing_difficulty.each do |e|
      @new_value = Difficulty.find_or_create_by!(name: e[1])
      Product
      .where(:difficulty_id => e[0])
      .update_all(:difficulty_id => @new_value)
    end

    ##Factions
    existing_factions.each do |e|
      @new_value = Faction.find_or_create_by!(name: e[1])
      OrderLine
      .where(:faction_id => e[0])
      .update_all(:faction_id => @new_value)
      Team
      .where(:faction_id => e[0])
      .update_all(:faction_id => @new_value)
    end

    # Loot Options
    existing_loot_options.each do |e|
      @new_value = LootOption.find_or_create_by!(name: e[1])
      Product
      .where(:loot_option_id => e[0])
      .update_all(:loot_option_id => @new_value)
    end

    ## Mounts
    existing_mounts.each do |e|
      @new_value = Mount.find_or_create_by!(name: e[1])
      Product
      .where(:mount_id => e[0])
      .update_all(:mount_id => @new_value)
    end

    ## Order Line Statuses
    existing_order_line_statuses.each do |e|
      @new_value = OrderLineStatus.find_or_create_by!(name: e[1])
      OrderLine
      .where(:order_line_status_id => e[0])
      .update_all(:order_line_status_id => @new_value)
    end

    ##Payment Statuses
    existing_payment_statuses.each do |e|
      @new_value = PaymentStatus.find_or_create_by!(name: e[1])
      OrderLine
      .where(:payment_status_id => e[0])
      .update_all(:payment_status_id => @new_value)
    end

    ## Payment Types
    existing_payment_types.each do |e|
      @new_value = PaymentType.find_or_create_by!(name: e[1])
      Team
      .where(:payment_type_id => e[0])
      .update_all(:payment_type_id => @new_value)
    end

    ## Play Styles
    existing_play_styles.each do |e|
      @new_value = PlayStyle.find_or_create_by!(name: e[1])
      Product
      .where(:play_style_id => e[0])
      .update_all(:play_style_id => @new_value)
    end

    ## Primary Stats
    existing_primary_stats.each do |e|
      @new_value = PrimaryStat.find_or_create_by!(name: e[1])
      Character
      .where(:primary_stat_id => e[0])
      .update_all(:primary_stat_id => @new_value)
    end

    ## Regions
    existing_regions.each do |e|
      @new_value = Region.find_or_create_by!(name: e[1])
      OrderLine
      .where(:region_id => e[0])
      .update_all(:region_id => @new_value)
      Team
      .where(:region_id => e[0])
      .update_all(:region_id => @new_value)
    end

    ## Team Statuses
    existing_team_statuses.each do |e|
      @new_value = TeamStatus.find_or_create_by!(name: e[1])
      Team
      .where(:team_status_id => e[0])
      .update_all(:team_status_id => @new_value)
    end

    ## Tier Tokens
    existing_tier_token.each do |e|
      @new_value = TierToken.find_or_create_by!(name: e[1])
      Character
      .where(:tier_token_id => e[0])
      .update_all(:tier_token_id => @new_value)
    end

    ## Zones
    existing_zones.each do |e|
      @new_value = Zone.find_or_create_by!(name: e[1])
      Product
      .where(:zone_id => e[0])
      .update_all(:zone_id => @new_value)
    end
  end
end
