module PricingRules
  def self.calculate_buy_one_get_one_free(quantity, value)
    return 0 if value.nil? || value <= 0 || quantity.nil? || quantity <= 0

    num_pairs = quantity / (value + 1)
    num_single = quantity % (value + 1)
    num_pairs + num_single
  end

  def self.calculate_bulk_discount(product, quantity, threshold, discount_percent)
    return 0 unless quantity >= threshold

    discounted_price = product.price * (1 - discount_percent / 100.0)
    discounted_price * quantity
  end

  def self.calculate_reduce_price(product, quantity, reduction)
    (product.price - reduction) * quantity
  end
end
