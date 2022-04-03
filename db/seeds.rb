# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
btc = Asset.find_or_create_by(symbol: 'BTC', currency: 'USD')
petr4 = Asset.find_or_create_by(symbol: 'PETR4', currency: 'BRL')
aapl = Asset.find_or_create_by(symbol: 'AAPL', currency: 'USD')

quote_btc_1 = Quote.find_or_create_by(asset: btc, price: 4_600_000)
quote_btc_2 = Quote.find_or_create_by(asset: btc, price: 5_000_000)
quote_btc_3 = Quote.find_or_create_by(asset: btc, price: 4_650_000, current: true)

quote_petr4_1 = Quote.find_or_create_by(asset: petr4, price: 3_300)
quote_petr4_2 = Quote.find_or_create_by(asset: petr4, price: 3_200)
quote_petr4_3 = Quote.find_or_create_by(asset: petr4, price: 3_500, current: true)

quote_aapl_1 = Quote.find_or_create_by(asset: aapl, price: 17_400)
quote_aapl_2 = Quote.find_or_create_by(asset: aapl, price: 16_000)
quote_aapl_3 = Quote.find_or_create_by(asset: aapl, price: 15_300, current: true)

Alert.find_or_create_by(quote: quote_btc_1, message: "#{btc.symbol} is going down to #{Money.from_cents(quote_btc_1.price, btc.currency).format}")
Alert.find_or_create_by(quote: quote_btc_2, message: "#{btc.symbol} is going up to #{Money.from_cents(quote_btc_2.price, btc.currency).format}")
Alert.find_or_create_by(quote: quote_btc_3, message: "#{btc.symbol} is going down to #{Money.from_cents(quote_btc_3.price, btc.currency).format}")

Alert.find_or_create_by(quote: quote_petr4_1, message: "#{petr4.symbol} is going up to #{Money.from_cents(quote_petr4_1.price, petr4.currency).format}")
Alert.find_or_create_by(quote: quote_petr4_2, message: "#{petr4.symbol} is going down to #{Money.from_cents(quote_petr4_2.price, petr4.currency).format}")
Alert.find_or_create_by(quote: quote_petr4_3, message: "#{petr4.symbol} is going up to #{Money.from_cents(quote_petr4_3.price, petr4.currency).format}")

Alert.find_or_create_by(quote: quote_aapl_1, message: "#{aapl.symbol} is going down to #{Money.from_cents(quote_aapl_1.price, aapl.currency).format}")
Alert.find_or_create_by(quote: quote_aapl_2, message: "#{aapl.symbol} is going down to #{Money.from_cents(quote_aapl_2.price, aapl.currency).format}")
Alert.find_or_create_by(quote: quote_aapl_3, message: "#{aapl.symbol} is going down to #{Money.from_cents(quote_aapl_3.price, aapl.currency).format}")


