require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
	    pending 'Not yet implemented'
      get :show
      expect(response).to have_http_status(:success)
    end
  end

end
