class String
  # Checks if string is an integer
  #
  # @return [String]
  def is_integer?
    true if Integer(self) rescue false
  end unless method_defined?(:is_integer?)
end
