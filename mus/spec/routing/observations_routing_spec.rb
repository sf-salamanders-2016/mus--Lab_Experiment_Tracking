require 'rails_helper'

RSpec.describe "Routing to observations", :type => :routing do
  it "routes GET /observations to observations#index" do
    expect(:get => "/observations").to route_to("observations#index")
  end

  it "routes GET /observations/new to observations#new" do
    expect(:get => "/observations/new").to route_to("observations#new")
  end

  it "routes GET /observations/1 to observations#show" do
    expect(:get => "/observations/1").to route_to("observations#show", :id => "1")
  end

  it "routes POST /observations to observations#create" do
    expect(:post => "/observations").to route_to("observations#create")
  end

  it "routs DELETE /observations/1 to observations#destroy"do
    expect(:delete => "/observations/1").to route_to("observations#destroy", :id => "1")
  end
end
