require 'sinatra'
require 'securerandom'

require_relative 'model/post'

get '/' do
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  title = params[:title]
  create_file Post.new(title, params[:content])
  redirect '/'
end

def create_file(post)
  File.open("blogs/#{SecureRandom.uuid}.txt", 'w') do |file|
    file.print post.to_s
  end
end

def read_file(title)
  File.read "blogs/#{title}.txt"
rescue Errno::ENOENT
  nil
end
