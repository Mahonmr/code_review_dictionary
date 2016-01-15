class Definition
  attr_reader(:definition)

  def initialize(attributes)
    @definition = attributes.fetch(:definition)
  end
end
