module OrderLinesHelper

  def status_link_text(o)
    "#{o.name.titleize} <span class=\"badge\"></span>".html_safe
  end

  def icon_factory(list, option)

    formatted_name = option.name.strip.parameterize

    option_css_name = list.fetch(formatted_name, "default")

    string = ""
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{option.display_name}\""
    string += " class=\"options-sprite options-sprite-#{option_css_name}\">"
    string += " </i>"
    string.html_safe
  end

  def faction_sprite(faction)

    list = {
      "alliance" => "alliance",
      "horde" => "horde",
      "any" => "any",
    }

    icon_factory(list, faction)
  end

  def character_sprite(character)
    string = ""
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{character.classification.display_name}\""
    string += " class=\"characters-sprite characters-sprite-#{character.classification.css_name}\">"
    string += " </i>"
    string += " <i"
    string += " data-toggle=\"tooltip\""
    string += " data-placement=\"top\""
    string += " title=\"#{character.spec.titleize}\""
    string += " class=\"characters-sprite characters-sprite-#{character.css_name_with_spec}\">"
    string += " </i>"
    string.html_safe
  end

  def loot_option_sprite(loot_option)
    list = {
      "yes-master-loot" => "master-loot",
      "yes-personal" => "personal-loot",
      "none" => "none",
      "no" => "none",
    }

    icon_factory(list, loot_option)
  end

  def zone_sprite(zone)
    list = {}
    # Raiding

    list["hellfire-citadel"] = "hellfire-citadel"
    list["bastion-of-shadows"] = "bastion-of-shadows"
    list["blackrock-foundry"] = "blackhand"
    list["highmaul"] = "highmaul"
    list["siege-of-orgrimmar"] = "siege-of-orgrimmar"
    list["throne-of-thunder"] = "throne-of-thunder"

    # Dungeons
    list["skyreach"] = "skyreach"
    list["bloodmaul-slag-mines"] = "bloodmaul-slag-mines"

    list["leveling"] = "leveling"

    list["package"] = "package"

    icon_factory(list, zone)
  end

  def play_style_sprite(play_style)
    list = {
      "self-play" => "self-play",
      "piloted" => "piloted",
    }
    
    icon_factory(list, play_style)
  end

  def difficulty_sprite(difficulty)
    list = {
      "normal" => "normal",
      "heroic" => "heroic",
      "mythic" => "mythic",
    }

    icon_factory(list, difficulty)
  end

  def category_sprite(category)
    list = {
      "raiding" => "raiding",
      "other-services" => "other-services",
      "character-services" => "character-services",
      "challenge-mode" => "challenge-mode",
      "brawler-s-guild" => "brawler-s-guild",
      "dungeons" => "dungeons",
      "proving-grounds" => "proving-grounds",
    }

    icon_factory(list, category)
  end

  def mount_sprite(mount)
    list = {
      "no-mount" => "none",
      "ancestral-phoenix-egg" => "ancestral-phoenix-egg",
      "armored-skyscreamer" => "armored-skyscreamer",
      "corrupted-dreadwing" => "corrupted-dreadwing",
      "felsteel-annihilator" => "felsteel-annihilator",
      "frostplains-battleboar" => "frostplains-battleboar",
      "gorestrider-gronnling" => "gorestrider-gronnling",
      "infernal-direwolf" => "infernal-direwolf",
      "ironhoof-destroyer" => "ironhoof-destroyer",
      "korkron-juggernaut" => "korkron-juggernaut",
      "korkron-war-wolf" => "korkron-war-wolf",
      "spawn-of-galakras" => "spawn-of-galakras",
    }

    icon_factory(list, mount)
  end
end