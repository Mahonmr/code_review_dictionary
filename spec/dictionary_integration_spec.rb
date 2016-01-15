require('Capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)
describe("Dictionary") do
  before() do
    Dictionary.clear
  end
  describe("navigation of dictionary app", {:type => :feature}) do
    it('root path takes you to index page') do
      visit('/')
      expect(page).to have_content("Epicodus Dictionary")
    end

    it('will redirect you to the root after add a word') do
      visit('/')
      fill_in "word", with: "computer"
      click_button('Add Word')
      expect(page).to have_content("Epicodus Dictionary")
    end

    it('will direct you to the word definitions page if a word is clicked') do
      visit('/')
      fill_in "word", with: "computer"
      click_button('Add Word')
      click_link('computer')
      expect(page).to have_content("Definitions for the word \"computer\"")
    end

    it('will redirect you to the word definition page after adding a word definition') do
      word = Dictionary.new(word: "computer").save
      visit("/word_definitions/#{word.last.id}")
      fill_in "definition", with: "Are sexy"
      click_button('Add')
      expect(page).to have_content("Definitions for the word \"computer\"")
    end

    it('will redirect back to the root page from the definition page') do
      word = Dictionary.new(word: "computer").save
      word = Dictionary.find_word(word.last.id)
      word.add_definition("Test definition")
      visit("/word_definitions/#{word.id}")
      click_link('Home')
      expect(page).to have_content("Epicodus Dictionary")
    end
  end

  describe('behavior of empty strings', {:type => :feature}) do
    it('will redirect you to root when submitted word field is blank') do
      visit('/')
      fill_in "word", with: " "
      click_button('Add Word')
      expect(page).to have_content("Epicodus Dictionary")
    end

    it('will not add a new word to array if field left blank') do
      visit('/')
      expect(Dictionary.all.length).to eq(0)
      fill_in "word", with: " "
      click_button('Add Word')
      expect(Dictionary.all.length).to eq(0)
    end

    it('will not add a new word to array if field is nil') do
      visit('/')
      expect(Dictionary.all.length).to eq(0)
      fill_in "word", with: nil
      click_button('Add Word')
      expect(Dictionary.all.length).to eq(0)
    end

    it('will redirect you to the word definitions page when submitted definition field is blank') do
      word = Dictionary.new(word: "computer").save
      visit("/word_definitions/#{word.last.id}")
      fill_in "definition", with: " "
      click_button('Add')
      expect(page).to have_content("Definitions for the word")
    end

    it('will not add a new definition to a word if field left blank') do
      word = Dictionary.new(word: "computer").save
      visit("/word_definitions/#{word.last.id}")
      expect(word.last.definitions.length).to eq(0)
      fill_in "definition", with: " "
      click_button('Add')
      expect(word.last.definitions.length).to eq(0)
    end

    it('will not add a new definition to a word if field is nil') do
      word = Dictionary.new(word: "computer").save
      visit("/word_definitions/#{word.last.id}")
      expect(word.last.definitions.length).to eq(0)
      fill_in "definition", with: nil
      click_button('Add')
      expect(word.last.definitions.length).to eq(0)
    end
  end
end
