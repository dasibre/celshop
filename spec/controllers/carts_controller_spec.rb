require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
	  let(:order_items) { [] }

	  before do
		  allow(controller).to receive(:find_order).with(1).and_return(order_items)
      session[:order_id] = 1
	  end
	  
    it 'returns list of order items' do
      get :show
      expect(assigns[:order_items]).to eq(order_items)
    end

	  it 'finds order' do
      expect(controller).to receive(:find_order).with(1).and_return(order_items)
		  get :show
	  end
  end
end
