require "rails_helper"

RSpec.describe SleepCyclesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/sleep_cycles").to route_to("sleep_cycles#index")
    end

    it "routes to #show" do
      expect(:get => "/sleep_cycles/1").to route_to("sleep_cycles#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/sleep_cycles").to route_to("sleep_cycles#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sleep_cycles/1").to route_to("sleep_cycles#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sleep_cycles/1").to route_to("sleep_cycles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sleep_cycles/1").to route_to("sleep_cycles#destroy", :id => "1")
    end
  end
end
