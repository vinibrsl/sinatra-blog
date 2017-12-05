require 'sinatra'
require 'securerandom'

require_relative 'model/post'

get '/' do
  @posts = read_files()
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
    file.print post.to_html
  end
end

def read_files()
  blogs = []
  Dir.foreach("blogs").each do |filename|
    begin
      blogs << File.read("blogs/#{filename}")
    rescue StandardError => ex
      p ex
    end
  end
  blogs
end
