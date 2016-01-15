require('rspec')
require('dictionary')

describe(Dictionary) do
  before() do
    Dictionary.clear
    @word = Dictionary.new(word: "word")
  end

  describe('#word') do
    it('returns the word from the dictionary') do
      expect(@word.word).to eq("word")
    end
  end

  describe('#id') do
    it('returns the id of the word') do
      expect(@word.id).to eq(1)
    end
  end

  describe('#save') do
    it('pushes the new word into the class varible array') do
      expect(Dictionary.all.length).to eq(0)
      @word.save()
      expect(Dictionary.all.length).to eq(1)
    end
  end

  describe('.clear') do
    it('clears the class varible array') do
      @word.save
      @word = Dictionary.new(word: "word2")
      @word.save
      expect(Dictionary.all.length).to eq(2)
      Dictionary.clear
      expect(Dictionary.all.length).to eq(0)
    end
  end
end
