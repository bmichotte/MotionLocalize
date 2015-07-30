class YAML
  def self.load(content)
    hash = {}
    content.split("\n").each do |line|
      split = line.split(':')
      key = split[0].strip
      split[0] = nil
      value = split.compact.join(':').strip

      hash[key] = value
    end

    hash
  end
end
