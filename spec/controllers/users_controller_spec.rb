require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #index" do
    it "redirects to the index page" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      get :edit
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    it "creates new user" do
      expect(post: user = User.create(username, email, password))
      expect(response).to redirect_to user_path(assigns[:user])
    end
  end

  describe "GET #show" do
    it "renders the show template" do
      get :edit
      expect(response).to render_template :show
    end
  end
end
