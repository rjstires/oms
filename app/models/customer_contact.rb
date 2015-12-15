class CustomerContact < ActiveRecord::Base
  enum ctype: {
    skype: 0,
    battle_tag: 1,
    mobile: 2,
    aim: 3,
    icq: 4,
    yahoo: 5,
  }

  belongs_to :customer

  validates :customer, :value, :ctype, presence: true
  validates :value, uniqueness: { scope: :ctype }

  def display_type
    self.ctype.humanize.titleize
  end
end
