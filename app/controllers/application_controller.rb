require_relative '../../config/environment'
require 'pry'
require 'sinatra/flash'
enable :sessions

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 

  	erb :index
    
  end

  get '/posts/new' do

  erb :new
  end

  post '/posts' do
    @post = Post.new(params[:post])
    @post.save
    erb :show

  end

  get '/posts' do

  	@posts = Post.all
    
    erb :index
  end

  get '/posts/:id' do

  	@post = Post.find(params[:id])
    
    erb :show
  end
  
  get '/posts/:id/edit' do
  	 @post = Post.find(params[:id])
     
     erb :edit
  end

  patch '/posts/:id' do
     @post = Post.find(params[:id])

     @post = @post.update!(params[:post])

     erb :show
  end

  delete '/posts/:id/delete' do
    @post = Post.destroy(params[:id])
     # if @post.destroy
      # flash[:notice] = "#{@post.name} was deleted"
    erb :delete
  end 
  
end