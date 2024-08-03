require_relative '../models/checkout'
require_relative '../models/discount'
require_relative '../models/product'

RSpec.describe Checkout do
  let(:voucher) { Product.new('VOUCHER', 'Voucher', 5.00) }
  let(:tshirt) { Product.new('TSHIRT', 'T-Shirt', 20.00) }
  let(:mug) { Product.new('MUG', 'Coffee Mug', 7.50) }

  let(:voucher_discount) { Discount.new(voucher, :buy_one_get_one_free, 1) }
  let(:tshirt_discount) { Discount.new(tshirt, :bulk_discount, nil, 3, 10) }
  let(:mug_discount) { Discount.new(mug, :reduce_price, 1.00) }

  describe '#scan' do
    it 'increments the quantity of the scanned item' do
      co = Checkout.new([voucher_discount, tshirt_discount])
      co.scan("VOUCHER")
      co.scan("TSHIRT")
      expect(co.instance_variable_get(:@items)).to eq({"VOUCHER" => 1, "TSHIRT" => 1})
    end
  end


  describe '#total' do
    it 'calculates total correctly for scanned items with multiple rules' do
      co = Checkout.new([voucher_discount, tshirt_discount, mug_discount])
      co.scan("VOUCHER")
      co.scan("TSHIRT")
      co.scan("MUG")
      expect(co.total).to eq(11.50)
    end

    it 'applies bulk discount correctly for quantity greater than threshold' do
      co = Checkout.new([tshirt_discount])
      co.scan("TSHIRT")
      co.scan("TSHIRT")
      co.scan("TSHIRT")
      expect(co.total).to eq(54.00)
    end

    it 'applies buy one get one free correctly for quantity greater than threshold' do
      co = Checkout.new([voucher_discount])
      co.scan("VOUCHER")
      co.scan("VOUCHER")
      co.scan("VOUCHER")
      expect(co.total).to eq(10.00)
    end

    it 'returns 0 when no items are scanned' do
      co = Checkout.new([voucher_discount, tshirt_discount])
      expect(co.total).to eq(0)
    end
  end
end
