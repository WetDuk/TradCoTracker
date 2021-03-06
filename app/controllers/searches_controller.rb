# frozen_string_literal: true

class SearchesController < ApplicationController
  def new
    @user = User.find(session[:user_id])
    redirect_to(point_path(session[:user_id])) unless @user.isOfficer
    @points = Point.order('id ASC')
    @current_user = User.find_by(id: session[:user_id])
    @search = Search.new
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @current_user = User.find_by(id: session[:user_id])

    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:firstName, :lastName, :email, :min_points, :max_points)
  end
end
