require 'sinatra'

get '/' do
  "Something"
end

get '/hola' do
  "Hola :)"
end

get '/adios' do
  "Ciao :("
end

# =========== =========== =========== =========== =========== ===========
# Wildcard
get '/say/*/to/*' do
  # matches /say/hello/to/world
  # params['splat'] => ["hello", "world"]
  "#{params['splat'].join(" ")}!"
end

# =========== =========== =========== =========== =========== ===========
get '/download/*.*' do |path, ext|
  # [path, ext] => ["path/to/file", "ext"]
  "file: #{path} - extension: #{ext} - #{params['splat'].inspect}"
end

get '/hello/:name' do |n|
  # Matches "GET /hello/world"
  "Hello #{n}!"
end

get '/bye/:name' do
  "Ciao #{params[:name]}!"
end

get /\/lettuce\/([\w]+)/ do |c|
  # Matches "GET /letuce/world", "GET /letuce/12345" etc.
  "<h2>letuce is sooo goood!</h2> with: #{c}!!"
end

get '/json' do
  content_type :json
  { text: 'Mi response' }.to_json
end
