class Dictionary
  attr_reader(:word, :id, :definitions)

  @@dictionary = []
  def initialize(attributes)
    @word = attributes.fetch(:word).split(/\s+/)[0...1].join(' ')
    @definitions = []
    @id = @@dictionary.length + 1
  end

  def save
    @@dictionary << self
  end

  def add_definition(definition)
    self.definitions << Definition.new(definition: definition)
  end

  define_singleton_method(:get) do |id|
    @@dictionary.each do |word|
      return word if word.id == id
    end
  end

  define_singleton_method(:clear) do
    @@dictionary = []
  end

  define_singleton_method(:all) do
    @@dictionary
  end
end
