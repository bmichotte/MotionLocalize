class NSString

  def translate(opts={})
    str = NSBundle.mainBundle.localizedStringForKey(self, value: nil, table: nil)
    unless str
      mp missing_translation: self, force_color: :red
      return self
    end

    str = str.dup
    opts.each do |key, value|
      str.gsub!("%{#{key}}", value.respond_to?(:to_s) ? value.to_s : value)
    end
    str
  end
  alias _ translate

end
