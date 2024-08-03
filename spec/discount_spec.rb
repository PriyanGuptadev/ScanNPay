require_relative '../models/discount'

RSpec.describe Discount do
  let(:product) { double('product') }
  let(:discount) { Discount.new(product, :bulk_discount, nil, 3, 10) }

  describe '#product' do
    it 'returns the product associated with the discount' do
      expect(discount.product).to eq(product)
    end
  end

  describe '#rule_type' do
    it 'returns the rule type of the discount' do
      expect(discount.rule_type).to eq(:bulk_discount)
    end
  end

  describe '#value' do
    it 'returns the value of the discount' do
      expect(discount.value).to be_nil
    end
  end

  describe '#threshold' do
    it 'returns the threshold of the discount' do
      expect(discount.threshold).to eq(3)
    end
  end

  describe '#discount_percent' do
    it 'returns the discount percentage of the discount' do
      expect(discount.discount_percent).to eq(10)
    end
  end
end
