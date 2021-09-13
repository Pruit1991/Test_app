# frozen_string_literal: true

class PriceCalculator
  require 'httparty'

  cargo_params = {}
  distance_params = {}

  puts 'Please enter cargo weight:'
  cargo_params[:weight] = gets.chomp.to_i

  puts 'Please enter cargo length:'
  cargo_params[:length] = gets.chomp.to_i

  puts 'Please enter cargo width:'
  cargo_params[:width] = gets.chomp.to_i

  puts 'Please enter cargo heigth:'
  cargo_params[:heigth] = gets.chomp.to_i

  puts 'Please enter startpoint:'
  distance_params[:start_point] = gets.chomp

  puts 'Please enter endpoint:'
  distance_params[:end_point] = gets.chomp

  weight = cargo_params[:weight]

  cargo_size = ((cargo_params[:length] * cargo_params[:width] * cargo_params[:heigth]) / 1_000_000.0)

  url = "https://maps.distancematrixapi.com/maps/api/distancematrix/json?origins=#{distance_params[:start_point]}&destinations=#{distance_params[:end_point]}&key=AlphaDMA7Ax9fyqkvaseHdH2XR9B6BdQw3GH88KA"
  uri = URI.parse(URI.encode(url.strip))

  response = HTTParty.get(uri)

  distance = response['rows'].first['elements'].first['distance'].values[1] / 1000

  if cargo_size < 1
    trans_price = 1 * distance
  elsif cargo_size > 1 && weight <= 10
    trans_price = 2 * distance
  elsif cargo_size > 1 && weight > 10
    trans_price = 3 * distance
  end

  result = { weight: weight, length: cargo_params[:length], width: cargo_params[:width], heigth: cargo_params[:heigth],
             distance: distance, price: trans_price }

  puts result
end
