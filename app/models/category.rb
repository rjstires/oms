class Category < Option
  def self.raiding
    find_by(name: 'raiding')
  end
end
