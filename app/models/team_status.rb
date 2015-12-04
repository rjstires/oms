class TeamStatus < ActiveRecord::Base
	before_save :downcase_fields
	include OptionMethods

	validates_presence_of  :name, message: "must not be blank."
	validates_uniqueness_of :name, message: "%{value} already exists."

  # Scopes
  scope :by_name,->(v) { find_by name: v }

  scope :pending, -> { where :name => 'pending'}
  scope :active, -> { where :name => 'active'}
  scope :inactive, -> { where :name => 'inactive'}

	def downcase_fields
		self.name.downcase
	end

	default_scope { order(name: :asc) }

	def display_name
		self.name.titleize
	end
end
