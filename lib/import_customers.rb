module JSONImportUtility
  def file_name=(val)
    self.file_name = val
  end

  def load_file()
    this.data = File.read("app/assets/json/#{this.file_name}.json")
  end
end