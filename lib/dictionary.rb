class Dictionary
  attr_reader(:word, :id)

  @@dictionary = []
  def initialize(attributes)
    @word = attributes.fetch(:word).split(/\s+/)[0...1].join(' ')
    @definition = []
    @id = @@dictionary.length + 1
  end

  def save
    @@dictionary << self
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
