require_relative '../models/discount'
require_relative '../models/product'
require_relative '../models/pricing/pricing_rules'

RSpec.describe PricingRules do
  let(:product) { Product.new('VOUCHER', 'Voucher', 5.00) }

  describe 'calculate_buy_one_get_one_free' do
    it 'calculates buy one get one free correctly' do
      expect(PricingRules.calculate_buy_one_get_one_free(product, 4, 2, 1)).to eq(10.0)
    end
  end

  describe 'calculate_bulk_discount' do
    it 'calculates bulk discount correctly' do
      expect(PricingRules.calculate_bulk_discount(product, 4, 3, 10)).to eq(18.0)
    end
  end

  describe 'calculate_reduce_price' do
    it 'calculates reduce price correctly' do
      expect(PricingRules.calculate_reduce_price(product, 3, 1.00)).to eq(12.00)
    end
  end
end
