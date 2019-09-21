class StripeCheckoutSessionService
  def call(event)
    payment = Payment.find_by(checkout_session_id: event.data.object.id)
    attendees_not_paid = payment.booking.attendees.where(payment: false)
    attendees_not_paid_sum = 0
    attendees_not_paid.each do |attendee|
      attendee.orders.where(ordered: true).each do |order|
        attendees_not_paid_sum += order.dish.price
      end
    end

    if event.data.object.display_items[0].amount / 100 == attendees_not_paid_sum
      payment.booking.attendees.update_all(payment: true)
    else
      payment.attendee.update(payment: true)
    end
  end
end
