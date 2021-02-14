class SpeakingPointController < ApplicationController
  def index
    @speakingEvents = SpeakingEvent.order('id ASC')
  end

  def show
    @speakingEvent = SpeakingEvent.find(params[:id])
  end

  def new
    @speakingEvent = SpeakingEvent.new
  end

  def create
    @speakingEvent = SpeakingEvent.new(speakingEvent_params)
    if @speakingEvent.save
      redirect_to(speakingEvents_path)
    else
      render('new')
    end
  end

  def edit
    @speakingEvent = SpeakingEvent.find(params[:id])
  end

  def update
    @speakingEvent = SpeakingEvent.find(params[:id])
    if @speakingEvent.update(speakingEvent_params)
      redirect_to(speakingEvent_path(@speakingEvent))
    else
      render('edit')
    end
  end

  def delete
    @speakingEvent = SpeakingEvent.find(params[:id])
  end

  def destroy
    @speakingEvent = SpeakingEvent.find(params[:id])
    @speakingEvent.destroy
    redirect_to(speakingEvents_path)
  end

  private

    def speakingEvent_params
      params.permit()
    end

end
