order = Order.from_web 'wwwwwwww'
order.cancel
receipt = order.pay payment, :withETag => order

