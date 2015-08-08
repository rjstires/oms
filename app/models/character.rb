class Character < ActiveRecord::Base
  belongs_to :armor_type
  belongs_to :classification
  belongs_to :primary_stat
  belongs_to :tier_token
 
  
  validates :armor_type, :classification, :primary_stat, :tier_token, :spec, presence: true
  
  def display_name
    "#{self.classification.display_name} (#{self.spec.titleize})"
  end
  
  def to_label
    "#{self.classification.display_name} (#{self.spec.titleize})"
  end
end
