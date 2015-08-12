class Option < ActiveRecord::Base
  validates :name, presence: true, uniqueness: {scope: :type}
  before_save :downcase_fields
  default_scope{ order(name: :desc) }

  scope :name_is, -> (name) { where :name => name }

  def downcase_fields
    self.name.downcase!
  end

  def self.types
    %w(ArmorType Category Classification Difficulty Faction LootOption Mount OrderLineStatus PaymentStatus PaymentType PlayStyle PrimaryStat Region TeamStatus TierToken Zone)
  end

 def display_name
   self.name.titleize
 end

  def to_label
    self.name.titleize
  end

  private
    def to_lowercase
        self.name.downcase!
    end
end
