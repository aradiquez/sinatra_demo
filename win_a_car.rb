require 'sinatra'

set(:probability) { |value| condition { rand <= value } }

get '/', :probability => 0.5 do
  "You won!"
end

get '/' do
  "Sorry, you lost."
end
