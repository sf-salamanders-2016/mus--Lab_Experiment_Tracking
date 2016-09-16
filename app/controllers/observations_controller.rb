class ObservationsController < ApplicationController
  before_action :find_experiment

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
    @experiment = current_user.experiments.find(params[:experiment_id])
    @observation = @experiment.observations.new(observation_params)

    if @observation.save
      current_user.observations << @observation
      redirect_to user_experiment_path(current_user, @experiment)
    else
      render :'observations/new'
    end
  end

  def destroy
    observation = Observation.find(params[:id])
    observation.destroy
    redirect_to observation_url, notice: 'Observation was successfully destroyed'
  end

  private

  def find_experiment
    @experiment = Experiment.find(params[:experiment_id])
  end

  def observation_params
    params.require(:observation).permit(:user_id, :title, :text)
  end


end
