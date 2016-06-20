require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'GET #show' do
	  let(:order_items) { [] }
	  let(:order) { double('Order') }

	  before do
		  allow(controller).to receive(:current_order).and_return(order)
      session[:order_id] = 1
	  end

    it 'returns list of orders items' do
	    allow(order).to receive(:order_items).and_return(order_items)
      get :show
      expect(assigns[:order_items]).to eq(order_items)
    end

	  it 'finds orders' do
      expect(order).to receive(:order_items).and_return(order_items)
		  get :show
	  end
  end
end
