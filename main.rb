require 'pry'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'active_support/all'
require 'pg'

get '/' do
  erb :home
end


get '/add' do
  @first = params[:first]
  @last = params[:last]
  @gender = params[:gender]
  @image = params[:image]
  @twitter = params[:twitter]
  @github = params[:github]

  sql = "insert into friends (first, last, gender, image, twitter, github) values ('#{@first}','#{@last}','#{@gender}','#{@image}','#{@twitter}','#{@github}');"

  conn = PG.connect(:dbname =>'friends', :host => 'localhost')
  conn.exec(sql)
  conn.close

  erb :add

end


get '/view' do
  sql = "select * from friends;"
  conn = PG.connect(:dbname =>'friends', :host => 'localhost')
  @rows = conn.exec(sql)
  conn.close

  erb: view

end

