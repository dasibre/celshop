require 'rails_helper'

RSpec.describe OrdersController, type: :controller do

  describe '#create' do
	  let(:order) { double('Order') }

	  before do
		  allow(controller).to receive(:current_order).and_return(order)
		  allow(order).to receive(:add_item)
		  allow(order).to receive(:save)
		  allow(order).to receive(:id)
	  end

    it 'fetches the current order' do
      expect(controller).to receive(:current_order).and_return(order)
      post :create, id: '1'
    end

	  it 'adds item to order items list' do
		  item_id = '1'
		  expect(order).to receive(:add_item).with(item_id)
		  post :create, id: '1'
	  end

	  it 'saves the order' do
		  expect(order).to receive(:save).and_return(true)
		  post :create, id: '1'
	  end
  end

  describe '#update' do
    it 'returns http success' do
      put :update, id: '1'
      expect(response).to have_http_status(:success)
    end
  end

  describe '#destroy' do
    it 'returns http success' do
      post :destroy, id: '1'
      expect(response).to have_http_status(:success)
    end
  end

end
