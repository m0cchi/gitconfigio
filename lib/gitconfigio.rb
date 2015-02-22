require_relative "gitconfigio/version"

module GitConfigIO

  def self.parse_value(source)
    key,value = source.split('=')
    return key.gsub(/\s/,''),value.sub(/^\s/,'') if key && value
  end

  def self.parse_node(line_source)
    config = {}
    head = nil
    line_source.each do |l|
      if /^\[(.+)\]$/ === l
        head = {}
        config[l.match(/^\[(.+)\]$/)[1]] = head
      elsif /^#/ === l
        next
      elsif !!head
        key,value = parse_value(l)
        head[key] = value if key
      end
    end
    config
  end

  def self.parse(source)
    ls = source.split("\n")
    config = parse_node(ls)
  end

  def self.load(path)
    parse(File.read(File.expand_path(path)))
  end

  def self.generate(hash)
    str = ''
    hash.keys.each do |key|
      str << "[#{key}]\n"
      hash[key].each do |k,v|
        str << "\t#{k} = #{v}\n"
      end
    end
    str
  end

  def self.dump(path,source = '')
    source = generate(source) if source.class == Hash
    File.write(File.expand_path(path),source)
  end

  def self.concat(hash,source = '')
    source = parse(source) if source.class == String
    hash.merge source
  end

  def self.merge(path,source = '')
    config = load(path)
    concat(config, source)
  end

  def self.merge!(path,source = '')
    dump(path,merge(path,source))
  end

  def self.delete(source,subject)
    source = source.class == String ? parse(source) : source.dup
    source.delete(subject)
    generate(source)
  end

  def self.delete!(path,subject)
    config = load(path)
    dump(path,delete(config,subject))
  end
end
