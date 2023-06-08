class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    data  = Message.all.order(:created_at)
    msg = data.map{|u| u[:body]}
    msg.to_json
  end

  post '/messages' do
    new1 =Message.create(body: params[:body], username: params[:username])
    new1.to_json
  end

  patch '/messages/:id' do
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end
  delete '/messages/:id' do
    message = Message.find(params[:id])
    message.destroy
  end
end
