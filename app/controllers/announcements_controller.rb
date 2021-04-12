# frozen_string_literal: true

class AnnouncementsController < ApplicationController
  def new
    @current_user = User.find_by(id: session[:user_id])
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announce_params)
    if @announcement.save
      redirect_to(portal_home_path)
    else
      render('new')
    end
  end

  def delete
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to(portal_home_path)
  end

  def destroy
    @announcement = Announcement.find(params[:id])
    @announcement.destroy
    redirect_to(portal_home_path)
  end

  private

  def announce_params
    params.require(:announcement).permit(:header, :announceDate, :content)
  end
end
