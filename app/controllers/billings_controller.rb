class BillingsController < ApplicationController
	def pre_pay
		reservations = current_user.reservations.where(payed: nil)
 			total = reservations.size*20
 			items = reservations.map do |reservation|
 				item = {}
 				item[:name] = reservation.photographer.name
 				item[:sku] = reservation.id.to_s
 				item[:price] = 20.to_s
 				item[:currency] = 'USD'
 				item[:quantity] = reservations.size
 				item
 			end

 		@payment = PayPal::SDK::REST::Payment.new({
 			intent: "sale",
 			payer: {
 				payment_method: "paypal" },
 			redirect_urls: {
 					return_url: "http://localhost:3000/billings/execute",
 					cancel_url: "http://localhost:3000/" },
 			transactions: [{
 					item_list: {
 						items: items
 					},
 			amount: {
 					total: total.to_s,
 					currency: "USD" },
 					description: "Pago de reserva" }]
 					})

 		if @payment.create
 			redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
 			redirect_to redirect_url
 		else
 			render json: @payment.error
 		end
 	end
end
