class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :difficulty
  belongs_to :loot_option
  belongs_to :mount
  belongs_to :play_style
  belongs_to :zone
  
  validates :description, :category, :difficulty, :loot_option, :mount, :play_style, :zone, presence: true
  
  before_save :downcase_fields
  
  
  scope :with_category, -> (v) { where(category: Category.name_is(v)) }
  scope :with_difficulty, -> (v) { where(difficulty: Difficulty.name_is(v)) }
  scope :with_loot_option, -> (v) { where(loot_option: LootOption.name_is(v)) }
  scope :with_mount, -> (v) { where(mount: Mount.name_is(v)) }
  scope :with_play_style, -> (v) { where(play_style: PlayStyle.name_is(v)) }
  scope :with_zone, -> (v) { where(zone: Zone.name_is(v)) }


  
  def downcase_fields
    self.description.downcase!
  end
  
  def display_name
     self.description.titleize
  end
  
  def to_label
    "#{self.category.display_name} / #{self.difficulty.display_name} / #{self.loot_option.display_name} / #{self.mount.display_name} / #{self.play_style.display_name} / #{self.zone.display_name}"
   
  end
end
