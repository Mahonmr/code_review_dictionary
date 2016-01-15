class Definition
  attr_reader(:definition, :id)

  @@definitions = []
  def initialize(attributes)
    @definition = attributes.fetch(:definition)
    @id = @@definitions.length + 1
  end

  def save
    @@definitions << self
  end

  define_singleton_method(:get) do |id|
    @@definitions.each do |definition|
      return definition if definition.id == id
    end
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:all) do
    @@definitions
  end
end
