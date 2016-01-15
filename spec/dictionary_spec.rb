require('rspec')
require('dictionary')
require('definition')
require('pry')

describe(Dictionary) do
  before() do
    Dictionary.clear
    @word = Dictionary.new(word: "word")
  end

  describe('#word') do
    it('returns the word from the dictionary') do
      expect(@word.word).to eq("word")
    end

    it('will only except first word in string')do
      @word2 = Dictionary.new(word: "word to your mother")
      expect(@word2.word).to eq("word")
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

  describe('.find_word') do
    it('returns a word based on its id number') do
      @word.save()
      expect(Dictionary.find_word(1).word).to eq("word")
    end
  end

  describe('#add_definition') do
    it('adds definition to word') do
      @word.save()
      word = Dictionary.find_word(1)
      word.add_definition("This is a definition")
      expect(word.definitions.last.definition).to eq("This is a definition")
    end

    it('can add multiple definitions to word') do
      @word.save()
      word = Dictionary.find_word(1)
      word.add_definition("This is a definition")
      word.add_definition("This is a definition2")
      word.add_definition("This is a definition3")
      expect(word.definitions.length).to eq(3)
    end
  end
end

describe(Definition) do
  before() do
    Definition.clear
    @word = Definition.new(definition: "This is a test definition")
  end

  describe('#definition') do
    it('returns the definition') do
      expect(@word.definition).to eq("This is a test definition")
    end
  end
end
