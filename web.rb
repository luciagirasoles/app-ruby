require 'sinatra'
require 'sinatra/reloader' # reload server
require 'sinatra/flash'
require 'slim'


get '/' do
  slim :index
end
