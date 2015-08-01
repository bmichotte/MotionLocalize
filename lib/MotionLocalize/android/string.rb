class String

  def translate(opts={})
    context = MotionLocalize.context
    raise ArgumentError.new 'MotionLocalize on android require that you init MotionLocalize.context' unless context

    package_name = context.getPackageName
    resource_id = context.getResources.getIdentifier(self, 'string', package_name)

    str = context.getString(resource_id)
    unless str
      mp missing_translation: self, force_color: :red
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
