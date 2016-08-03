stock_prices_yesterday = [10, 7, 5, 8, 11, 9, 2]

def get_max_profit(stocks)
  raise "Missing stocks" unless stocks
  raise "Stocks is not an Array" unless stocks.class == Array
  raise "Stocks needs more than one price" unless stocks.size > 1
  stocks.map {|price| raise "Stock prices must be positive Fixnums" unless price.class == Fixnum && price > 0 }

  minimum_value = nil
  minimum_index = stocks.size - 1
  stop_searching_at = stocks.size

  while minimum_index == stocks.size - 1
    minimum_value = stocks.take(stop_searching_at).min
    minimum_index = stocks.index(minimum_value)
    stop_searching_at -= 1
  end

  # puts "[#{minimum_index}]: #{minimum_value}"

  maximum_value = minimum_value
  maximum_index = stocks.size - 1

  maximum_value = stocks[minimum_index, stocks.size - 1].max
  maximum_index = stocks.index(maximum_value)

  # puts "[#{maximum_index}]: #{maximum_value}"

  maximum_value - minimum_value
end

puts get_max_profit(stock_prices_yesterday)

