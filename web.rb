require 'sinatra'
require 'sinatra/reloader' # reload server
require 'sinatra/flash'
require 'slim'
require_relative 'models/User'

get '/' do
  params[:preuser] = "false"
  if params[:name]
    new_user = { name: params[:name] }
    new_user[:birth_year], new_user[:birth_month], new_user[:birth_day] =
    params[:birthday].split('-')
    info_user = User.new(new_user)
    @name = info_user.name.capitalize
    @age = info_user.age
    @next_bday = info_user.next_birthday

    params[:preuser] = "true"
    @user = { name: params[:name], birth: params[:birthday] }
  end
  slim :index, { locals: params }
end

post '/' do
  redirect "/?name=#{params[:name]}&birthday=#{params[:birth]}"
end