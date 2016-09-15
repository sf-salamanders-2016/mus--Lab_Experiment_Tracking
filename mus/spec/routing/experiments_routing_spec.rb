require 'rails_helper'

RSpec.describe "Routing to experiments", :type => :routing do
  it "routes GET /experiments to experiments#index" do
    expect(:get => "/experiments").to route_to("experiments#index")
  end

  it "routes GET /experiments/new to experiments#new" do
    expect(:get => "/experiments/new").to route_to("experiments#new")
  end

  it "routes GET /experiments/1 to experiments#show" do
    expect(:get => "/experiments/1").to route_to("experiments#show", :id => "1")
  end

  it "routes POST /experiments to experiments#create" do
    expect(:post => "/experiments").to route_to("experiments#create")
  end

  it "routs DELETE /experiments/1 to experiments#destroy"do
    expect(:delete => "/experiments/1").to route_to("experiments#destroy", :id => "1")
  end
end
