class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    GithubService.authenticate!(ENV['client_id'], ENV['client_secret'], params[:code])
    
    GithubService.get_username
    session[:username] = user_json["login"]

    redirect_to '/'
  end
end