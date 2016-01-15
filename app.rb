require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/dictionary')
require('./lib/definition')
require('pry')

get('/') do
  @words = Dictionary.all.sort_by {|obj| obj.word}
  erb(:index)
end

post('/add_word') do
  Dictionary.new(word: params.fetch("word")).save unless params.fetch("word").strip.empty?
  redirect('/')
end

get('/word_definitions/:id') do
  @word = Dictionary.find_word(params.fetch("id").to_i)
  erb(:word_definitions)
end

post('/add_definition/:id') do
  unless params.fetch("definition").strip.empty?
    word = Dictionary.find_word(params.fetch("id").to_i)
    word.add_definition(params.fetch("definition"))
  end
  redirect("/word_definitions/#{params.fetch("id").to_i}")
end
