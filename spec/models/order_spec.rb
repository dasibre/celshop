require 'rails_helper'

RSpec.describe Order, type: :model do
	subject { Order.new }

  describe '#add_item(id)' do
	  it 'adds to ordered items list' do
		  subject.add_item(1)
		  expect(subject.order_items.size).to eq 1
	  end
  end
end
