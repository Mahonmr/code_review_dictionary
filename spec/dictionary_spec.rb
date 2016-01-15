require('rspec')

describe(Dictionary) do
  before() do
    Dictionary.clear()
    @word = Dictionary.new("word")
  end

  describe('#word') do
    it('returns the word from the dictionary') do
      expect(@word.word()).to(eq("word"))
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      expect(@word.id()).to(eq(1))
    end
  end
end
