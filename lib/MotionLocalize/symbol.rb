class Symbol

  def translate(opts={})
    self.to_s.translate(opts)
  end
  alias _ translate

end
