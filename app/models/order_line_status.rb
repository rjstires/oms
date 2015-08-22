class OrderLineStatus < ActiveRecord::Base
	before_save :downcase_fields
	include OptionMethods

	validates :name, presence: true

  # Scopes
  scope :by_name,->(v) { find_by name: v }

	def downcase_fields
		self.name.downcase
	end

	default_scope { order(name: :asc) }
end
