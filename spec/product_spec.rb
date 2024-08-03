require_relative '../models/product'

RSpec.describe Product do
  let(:product) { Product.new('VOUCHER', 'Voucher', 5.00) }

  describe '#code' do
    it 'returns the product code' do
      expect(product.code).to eq('VOUCHER')
    end
  end

  describe '#name' do
    it 'returns the product name' do
      expect(product.name).to eq('Voucher')
    end
  end

  describe '#price' do
    it 'returns the product price' do
      expect(product.price).to eq(5.00)
    end
  end
end
