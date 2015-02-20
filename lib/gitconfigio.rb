require_relative "gitconfigio/version"

module GitConfigIO

  def self.parse_value(source)
    key,value = source.split('=')
    return key.gsub(/\s/,''),value.sub(/^\s/,'') if key && value
  end

end
