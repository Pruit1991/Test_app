# frozen_string_literal: true

class Orders::PriceCalculator
  def call(order)
    cargo_size = ((order[:length] * order[:width] * order[:height]) / 1_000_000.0)
    weight = order[:weight]
    url = "https://maps.distancematrixapi.com/maps/api/distancematrix/json?origins=#{order[:origin]}&destinations=#{order[:destination]}&key=AlphaDMA7Ax9fyqkvaseHdH2XR9B6BdQw3GH88KA"
    uri = URI.parse(Addressable::URI.encode(url.strip))

    response = HTTParty.get(uri)
    distance = response['rows'].first['elements'].first['distance'].values[1] / 1000
    order_number = Random.rand(10_000_000)

    if cargo_size < 1
      price = 1 * distance
    elsif cargo_size > 1 && weight <= 10
      price = 2 * distance
    elsif cargo_size > 1 && weight > 10
      price = 3 * distance
    end

    order.update!(
      distance: distance,
      price: price,
      order_number: order_number
    )
  end
end
