class ObservationsController < ApplicationController
  def index
    @observations = Observation.all
  end

  def show
    @observation = Observation.find(params[:id])
  end

  def new
    @observation = Observation.new
  end

  def create
    @observation = Observation.new(params[:observation])

    if @observation.save
      redirect_to observation_path
    else
      render :new
    end
  end

  def destroy
    observation = Observation.find(params[:id])
    observation.destroy
    redirect_to observation_url, notice: 'Observation was successfully destroyed'
  end


end
