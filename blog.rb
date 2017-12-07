require 'sinatra'
require 'securerandom'

require_relative 'model/post'

set :static_cache_control, [:public, max_age: 60 * 60 * 24 * 365]

get '/' do
  @posts = read_files
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
    file.print(post.to_text)
  end
end

def read_files
  blogs = []
  Dir["blogs/*.txt"].each do |filename|
    begin
      blogs << Post::from_text(File.read(filename))
    rescue StandardError => ex
      p ex
    end
  end
  blogs
end
