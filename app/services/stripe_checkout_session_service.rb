class StripeCheckoutSessionService
  def call(event)
    payment = Payment.find_by(checkout_session_id: event.data.object.id)
    if event.data.object.display_items[0].amount / 100 == payment.booking.orders.map(&:price).sum
      payment.booking.attendees.update_all(payment: true)
    else
      payment.attendee.update(payment: true)
    end
  end
end
