# Import all the classes required to run the system
require 'json'
require_relative './models/pricing/pricing_rules'
require_relative './models/product'
require_relative './models/checkout'
require_relative './models/discount'

# Load products and pricing rules from JSON file
def load_data(filename)
  json_data = File.read(filename)
  data = JSON.parse(json_data, symbolize_names: true)

  # Create Product objects
  products = data[:products].map do |p|
    Product.new(p[:code], p[:name], p[:price])
  end

  # Use Pricing Rules to apply discounts
  pricing_rules = data[:pricing_rules].map do |pr|
    product = products.find { |p| p.code == pr[:product_code] }
    Discount.new(product, pr[:rule_type], pr[:value])
  end

  [products, pricing_rules]
end

products, pricing_rules = load_data('data.json')

co = Checkout.new(pricing_rules)
co.scan("VOUCHER")
co.scan("TSHIRT")
co.scan("MUG")

price = co.total
puts "Total: #{price}$"
