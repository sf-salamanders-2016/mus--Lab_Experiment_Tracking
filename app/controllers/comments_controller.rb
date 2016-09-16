class CommentsController < ApplicationController
  before_action :find_experiment, :find_observation

  def index
  end

  def new
    @comment = Comment.new
  end

  def create
    @experiment = current_user.experiments.find(params[:experiment_id])
    @observation = @experiment.observations.find(params[:observation_id])
    @comment = @observation.comments.new(comment_params)

    if @comment.save
      @observation.comments << @comment
      current_user.comments << @comment
      redirect_to user_experiment_observation_path(current_user, @experiment, @observation)
    else
      render ':comments/new'
    end
  end

  private

  def find_experiment
    @experiment = Experiment.find(params[:experiment_id])
  end

  def find_observation
    @observation = Observation.find(params[:observation_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :observation_id)
  end

end
