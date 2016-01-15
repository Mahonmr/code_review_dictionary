class Dictionary
  require('pry')
  attr_reader(:word, :id)

  @@dictionary = []
  def initialize(attributes)
    @word = attributes.fetch(:word)
    @definition = []
    @id = @@dictionary.length + 1
  end

  def save
    @@dictionary << self
  end

  define_singleton_method(:clear) do
    @@dictionary = []
  end

  define_singleton_method(:all) do
    @@dictionary
  end
end
