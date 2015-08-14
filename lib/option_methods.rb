module OptionMethods
  def display_name
    self.name.titleize
  end

  def to_label
    self.name.titleize
  end
end