class Definition
  attr_reader(:definition)

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end
end
