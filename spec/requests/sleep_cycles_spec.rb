require 'rails_helper'

RSpec.describe "SleepCycles", type: :request do
  describe "GET /sleep_cycles" do
    it "works! (now write some real specs)" do
      get sleep_cycles_path
      expect(response).to have_http_status(200)
    end
  end
end
