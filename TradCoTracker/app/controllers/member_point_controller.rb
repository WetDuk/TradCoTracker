class MemberPointController < ApplicationController
  def index
    @points = MemberPoint.order('id ASC')
  end
  
  def show
    @points = MemberPoint.order('id ASC')
  end
  
  def new
    @point = MemberPoint.new
  end
  
  def create
    # Instantiate a new object using form parameters
    @point = MemberPoint.new(point_params)
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
    @point = MemberPoint.find(params[:id])
  end
  
  def update
    @point = MemberPoint.find(params[:id])
    if @point.update(point_params)
      redirect_to(point_path(@point))
    else
      render('edit')
    end
  end
  
  def delete
    @point = MemberPoint.find(params[:id])
  end
  
  def destroy
    @point = MemberPoint.find(params[:id])
    @point.destroy
    redirect_to(points_path)
  end
  
  private
    def point_params
      params.permit(:points)
    end
end

