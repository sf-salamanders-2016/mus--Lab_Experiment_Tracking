require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let (:experiment) { Experiment.create()}
  let (:user) { User.create()}
  let (:observation) { Observation.create()}
  let!(:comment) { Comment.create!(user_id: user.id) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "responds with status code 200" do
       expect(:get => '/comments').to route_to(
         :controller => 'comments',
         :action => 'index')
    end

    it "assigns all comments as @comments" do
      get :index
      expect(assigns(:comments)).to eq(Comment.all)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: comment.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct comment as @comment" do
      get :show, { id: comment.id }
      expect(assigns(:comment)).to eq(comment)
    end


    it "renders the :show template" do
      get :show, { id: comment.id }
      expect(response).to render_template(:show)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post(:create, { comment: { text: "great observation" }})
        expect(response).to have_http_status(302)
      end

      it "creates a new game in the database" do
        expect(Comment.last).to eq(comment)
      end

      it "assigns the newly created comment as @comment" do
        post(:create, { comment: { text: "great observation" }})
        get :show, { id: comment.id }
        expect(assigns(:comment)).to eq(comment)
      end
    end
  end


end
