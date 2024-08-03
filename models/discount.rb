class Discount
  attr_reader :product, :rule_type, :value, :threshold, :discount_percent

  def initialize(product, rule_type, value = nil, threshold = nil, discount_percent = nil)
    @product = product
    @rule_type = rule_type
    @value = value
    @threshold = threshold
    @discount_percent = discount_percent
  end
end
