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
 				item[:quantity] = 1
 				item
 			end

 		@payment = PayPal::SDK::REST::Payment.new({
 			intent: "sale",
 			payer: {
 				payment_method: "paypal" },
 			redirect_urls: {
 					return_url: "https://rocky-falls-04812.herokuapp.com/billings/execute",
 					cancel_url: "https://rocky-falls-04812.herokuapp.com/" },
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

 	def execute
 		paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])

 		if paypal_payment.execute(payer_id: params[:PayerID])
 			
 			amount = paypal_payment.transactions.first.amount.total

 			billing = Billing.create(
 				user: current_user,
 				code: paypal_payment.id,
 				payment_method: 'paypal',
 				amount: amount,
 				currency: 'USD'
 				)

 			reservations = current_user.reservations.where(payed: nil)
 			reservations.update_all(payed: true, billing_id: billing.id)

 			redirect_to reservations_path, notice: "La compra se realizó con éxito!" 
 		else
 			render plain: "No se pudo generar el cobro en PayPal:("
 		end

 	end
end
