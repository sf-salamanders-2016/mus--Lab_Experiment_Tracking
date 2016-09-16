class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.all
  end

  def new
    @experiment = Experiment.new()
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def create
    p experiment_params
    @experiment = Experiment.new(experiment_params)
    p '***************'
    p @experiment

    if @experiment.save
      redirect_to @experiment
    else
      render 'experiments/new'
    end
  end


  private


  def experiment_params
    params.require(:experiment).permit(:project_admin_id, :title, :hypothesis, :summary, :body)
  end

end
