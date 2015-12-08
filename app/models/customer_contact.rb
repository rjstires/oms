class CustomerContact < ActiveRecord::Base
  enum ctype: {
    skype: 0,
    battle_tag: 1,
    aim: 2,
    icq: 3,
    yahoo: 4,
  }

  belongs_to :customer

  validates :customer, :value, :ctype, presence: true
  validates :value, uniqueness: { scope: :ctype }

  def display_type
    self.ctype.humanize.titleize
  end
end
