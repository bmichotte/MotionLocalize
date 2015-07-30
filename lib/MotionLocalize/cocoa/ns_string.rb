class NSString

  def translate(opts={})
    str = NSBundle.mainBundle.localizedStringForKey(self, value: nil, table: nil)
    unless str
      return self
    end

    str = str.dup
    opts.each do |key, value|
      puts "replace #{key} with #{value}"
      str.gsub!("%{#{key}}", value.respond_to?(:to_s) ? value.to_s : value)
    end
    str
  end
  alias _ translate

end
