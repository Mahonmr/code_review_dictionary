require('Capybara/rspec')
require('./app')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("navigation of dictionary app", {:type => :feature}) do
  it('root path takes you to index page') do
    visit('/')
    expect(page).to have_content("Epicodus Dictionary")
  end
end
