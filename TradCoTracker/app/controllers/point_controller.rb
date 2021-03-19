# frozen_string_literal: true

class PointController < ApplicationController
  def index
    @points = Point.order('id ASC')
  end

  def show
    @points = Point.order('id ASC')
  end

  def new
    @point = Point.new
  end

  def create
    # Instantiate a new object using form parameters
    @point = Point.new(point_params)
    # Save the object
    if @point.save
      # If save succeeds, redirect to the index action
      redirect_to(points_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @point = Point.find(params[:id])
  end

  def update
    @point = Point.find(params[:id])
    if @point.update(point_params)
      redirect_to(point_path(@point))
    else
      render('edit')
    end
  end

  def delete
    @point = Point.find(params[:id])
  end

  def destroy
    @point = Point.find(params[:id])
    @point.destroy
    redirect_to(points_path)
  end

  private

  def point_params
    params.require(:point).permit(:events, :eventType, :points)
  end
end
