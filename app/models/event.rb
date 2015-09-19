class Event < ActiveRecord::Base
  # Default scope.
  default_scope {order(start_datetime: :asc)}

  # Constants

  # Attr macros.

  # Associations
  belongs_to :team
  belongs_to :category
  belongs_to :difficulty
  belongs_to :zone

  has_many :slots, dependent: :destroy

  # Validation
  validates_presence_of :team,
    :category,
    :difficulty,
    :zone,
    :start_datetime,
    :cutoff_datetime,
    on: :create, message: "can't be blank"

  validates_with EventValidator

  # Callbacks

  # Other macros

  # Class methods.

  # Instance methods.

  def start_time
    self.start_datetime
  end

  def cutoff_time
    self.cutoff_datetime
  end

  ##
  # Returns true if the event start DateTime has passed.
  #
  # @return [Boolean]
  def past_cutoff?
    DateTime.now > self.cutoff_datetime
  end

  ##
  # Returns true if the event cutoff DateTime has passed.
  #
  # @return [Boolean]
  def past_event?
    DateTime.now > self.start_datetime
  end

  ##
  # Returns the number of vacancies for this event.
  #
  # @param none.
  # @return [Integer]
  def has_vacancies?
    self.number_vacancies > 0 ? true : false
  end

  ##
  # Returns true if event has vacancies.
  #
  # @param none.
  # @return [Boolean]
  def number_vacancies
    slots.where(order_line: nil).count
  end

  private

    def start_after_cutoff
      self.start_datetime > self.cutoff_datetime
    end

    def start_in_the_past
      self.start_datetime < DateTime.now
    end

  protected
end
