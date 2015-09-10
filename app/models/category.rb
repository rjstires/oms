 class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
	before_save :downcase_fields
	include OptionMethods

	validates_presence_of  :name, message: "#{self.class.to_s} name must not be blank."
	validates_uniqueness_of :name, message: "%{value} already exists."

  # Scopes
  scope :by_name,->(v) { find_by name: v }

	def downcase_fields
		self.name.downcase
	end

	default_scope { order(name: :asc) }
end
