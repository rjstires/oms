class LootOption < ActiveRecord::Base
	before_save :downcase_fields
	include OptionMethods

	validates_presence_of  :name, message: "of loot option must not be blank."
	validates_uniqueness_of :name, message: "%{value} already exists."

  # Scopes
  scope :by_name,->(v) { where name: v }

	def downcase_fields
		self.name.downcase
	end

	default_scope { order(name: :asc) }
end
