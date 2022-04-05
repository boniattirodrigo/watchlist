# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
Asset.find_or_create_by(symbol: 'ABEV3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ALPA4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'AZUL4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'BBAS3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'BEEF3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'CASH3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'CIEL3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'DXCO3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ELET3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'FLRY3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'GOLL4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'HAPV3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'HYPE3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ITUB4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'MGLU3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'MULT3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'PETZ3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'RAIL3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'VALE3', currency: 'BRL')
petr3 = Asset.find_or_create_by(symbol: 'PETR3', currency: 'BRL')

quote_petr3_1 = Quote.find_or_create_by(asset: petr3, price: 3_300)
quote_petr3_2 = Quote.find_or_create_by(asset: petr3, price: 3_200)
quote_petr3_3 = Quote.find_or_create_by(asset: petr3, price: 3_500, current: true)

Alert.find_or_create_by(quote: quote_petr3_1, message: "#{petr3.symbol} is going up to #{Money.from_cents(quote_petr3_1.price, petr3.currency).format}")
Alert.find_or_create_by(quote: quote_petr3_2, message: "#{petr3.symbol} is going down to #{Money.from_cents(quote_petr3_2.price, petr3.currency).format}")
Alert.find_or_create_by(quote: quote_petr3_3, message: "#{petr3.symbol} is going up to #{Money.from_cents(quote_petr3_3.price, petr3.currency).format}")

