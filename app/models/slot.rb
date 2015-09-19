class Slot < ActiveRecord::Base
  # Default scope

  # Constants

  # Attr macros

  # Associations
  belongs_to :product
  belongs_to :event
  belongs_to :order_line

  # Validations
  validates_presence_of :product, message: "must have a valid product."
  validates_presence_of :event, message: "must be associated to an event."

  # Callbacks
  before_save :compare_slot_and_event_category

  # Class methods

  # Instance methods

  ##
  # Returns true if the order is vacant.
  #
  # @return [Boolean]
  def is_vacant?
    self.order_line.nil?
  end

  private

    def compare_slot_and_event_category
      raise "#{self.product.category.to_s} == #{self.event.category.to_s}" unless self.product.category == self.event.category
    end
end
