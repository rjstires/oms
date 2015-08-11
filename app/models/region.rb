class Region < Option
  def to_label
    self.name.upcase
  end
  def display_name
    self.name.upcase
  end
end
