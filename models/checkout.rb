require_relative 'pricing/pricing_rules'

class Checkout
  def initialize(pricing_rules)
    @pricing_rules = pricing_rules
    @items = Hash.new(0)
  end

  def scan(item)
    @items[item] += 1
  end

  def total
    total_price = 0

    @items.each do |item, quantity|
      product = find_product(item)
      total_price += calculate_item_price(product, quantity)
    end

    total_price
  end

  private

  def find_product(item)
    @pricing_rules.find { |rule| rule.product.code == item }.product
  end

  def calculate_item_price(product, quantity)
    rule = @pricing_rules.find { |rule| rule.product == product }

    case rule.rule_type
    when :buy_one_get_one_free
      PricingRules.calculate_buy_one_get_one_free(product, quantity, rule.threshold, rule.value)
    when :bulk_discount
      PricingRules.calculate_bulk_discount(product, quantity, rule.threshold, rule.discount_percent)
    when :reduce_price
      PricingRules.calculate_reduce_price(product, quantity, rule.value)
    else
      product.price * quantity
    end
  end
end
