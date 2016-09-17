class ExperimentsController < ApplicationController


  def index
    @experiments = Experiment.all
  end

  def new
    @experiment = current_user.experiments.new()
  end

  def create
    @experiment = current_user.experiments.new(experiment_params)

    if @experiment.save
      Team.create(user_id: current_user.id, experiment_id: @experiment.id, approved?: true)
      redirect_to user_experiments_path(current_user)
    else
      render 'experiments/new'
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
    @user = User.find(params[:user_id])
    @teams = Team.where(experiment_id: @experiment.id, approved?: true)
    @application = Team.where(experiment_id: @experiment.id, approved?: false)
  end

  def approval
    @user = User.find(params[:user_id])
    @experiment = Experiment.find(params[:experiment_id])
    @team = Team.create(user_id: @user.id, experiment_id: @experiment.id)
    @team.update_attributes(approved?: true)
    redirect_to user_experiment_path(current_user, @experiment)
  end

  def application
    experiment = Experiment.find(params[:experiment_id])
    user = User.find(params[:user_id])
    Team.create(user_id: user.id, experiment_id: experiment.id)
    redirect_to user_experiment_path(current_user, experiment)
  end


  private


  def experiment_params
    params.require(:experiment).permit(:approved?, :project_admin_id, :title, :hypothesis, :summary, :body)
  end

end
