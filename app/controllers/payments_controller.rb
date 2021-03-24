class PaymentsController < ApplicationController
    def new
        @order = current_user.orders.where(state: 'pending').find(params[:order_id])
        @start = Date.parse(@order.booking.start_date.to_s).strftime("%d/%m/%Y")
        @end = Date.parse(@order.booking.end_date.to_s).strftime("%d/%m/%Y")
    end
end
