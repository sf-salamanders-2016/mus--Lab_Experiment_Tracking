require 'rails_helper'

describe ExperimentsController do

  describe 'GET #index' do
    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the :show template" do
      get :show
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "renders the :edit template" do
      get :edit
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    it "saves new experiment in the database" do
      expect { post :create, experiment: Experiment.new()}.to change(Experiment, :count).by(1)
    end
    it "redirects to experiments#show" do
      post :create, experiment: Experiment.new()
      expect(response).to redirect_to experiment_path(assigns[:experiment])
    end
  end

end
