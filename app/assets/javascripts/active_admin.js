
//= require jquery
//= require jquery_ujs

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');

    const orders = document.querySelectorAll(".container-bookings");
    const buttons = document.querySelectorAll(".order-button");

    if (buttons) {
    	orders.forEach((order) => {
    		const button = order.querySelector(".order-button");
    		const section = order.querySelector(".container-attendee");
    		button.addEventListener("click", (event) => {
    			section.classList.toggle("show");
    			section.classList.toggle("hide");
    			button.classList.toggle("fa-plus-circle");
    			button.classList.toggle("fa-minus-circle");
    		});
    	});
    }
});

