module PricingRules
  def self.calculate_buy_one_get_one_free(product, quantity, min_products, free_products)
    return (quantity * product.price) unless (quantity / min_products).positive?

    (quantity - ((quantity / min_products) * free_products)) * product.price
  end

  def self.calculate_bulk_discount(product, quantity, threshold, discount_percent)
    return (product.price * quantity) unless quantity >= threshold

    discounted_price = product.price * (1 - discount_percent / 100.0)
    discounted_price * quantity
  end

  def self.calculate_reduce_price(product, quantity, reduction)
    (product.price - reduction) * quantity
  end
end
