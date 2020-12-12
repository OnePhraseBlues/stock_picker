def stock_picker(price_array)
  prices = {}
  last_buy_date = price_array.length - 2
  last_sell_date = price_array.length - 1
  last_buy_date.times do |current_buy_date|
    last_sell_date.downto(current_buy_date) do |current_sell_date|
      current_date_array = [current_buy_date, current_sell_date]
      prices[current_date_array] = price_array[current_sell_date].to_f - price_array[current_buy_date].to_f
    end
  end
  best_profit_date = []
  best_profit = -1/0.0 #negative infinity to start. Just in case no days are profitable.
  prices.each do |dates, profit|
    if profit > best_profit
      best_profit_date = dates
      best_profit = profit
    end
  end
  return best_profit_date.push(best_profit)
end

puts "Input stock values separated by space or comma: "
stocks = gets.split(/[\s,]+/)
results = stock_picker(stocks)
puts "Buy on day #{results[0]} and sell on day #{results[1]} for a max profit of $#{sprintf("%0.02f", results[2])}!"