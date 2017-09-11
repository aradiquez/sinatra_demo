ENV['RACK_ENV'] = 'test'

require 'spec_helper'

describe 'The Example App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'says Something' do
    get '/'
    expect(last_response).to be_ok # status: 200
    expect(last_response.body).to eq('Something')
  end

  it 'says hola' do
    get '/hola'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hola :)')
  end

  it 'says adios' do
    get '/adios'
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Ciao :(')
  end
end
