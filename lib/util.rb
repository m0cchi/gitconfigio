module GitConfigIO

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
