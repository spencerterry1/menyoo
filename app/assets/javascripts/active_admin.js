
//= require jquery
//= require jquery_ujs


// JS function to add drop down functionality to Table Order buttons

function showTableOrders(event) {
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
    } else {
        return
    }
}

// ShowTableOrders called after DOM is loaded first time so selectors are found

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');
    showTableOrders(event)
    reloadDashboard();

});


// Function to assign fade in class to order DIVs3

// function fadeIn() {
//     let ordersAfterUpdated = document.getElementsByClassName('container-booking');
//     ordersAfterUpdated = ordersAfterUpdated.item(ordersAfterUpdated.length -1);
//     ordersAfterUpdated.classList.add("fade-in");
//     console.log(ordersAfterUpdated.class);
// }



// Function to send AJAX request every 10 seconds + send alerts if there are new orders / orders paid

function reloadDashboard() {
    $(document).ready(function() {

        // declare a global variable for the count of orders on 1st page load
        window.countBeforeUpdated = $('#container-main').find('.container-bookings').length;
        console.log("count before reload = " + countBeforeUpdated);

        // function to check DB for new orders every 10 seconds
        setInterval(function() {
            $("#container-main").load("dashboard/refresh_orders");
            }, 10000);

        // function triggered after AJAX call made to compare orders before + after and calculate difference
        $(document).ajaxComplete(function(event) {
            
            console.log("count before reload = " + countBeforeUpdated);

            const countAfterUpdated = $('#container-main').find('.container-bookings').length;
            console.log("count after reload = " + countAfterUpdated);

            const newOrderCount = countAfterUpdated - countBeforeUpdated

            // fadeIn()

            // alerts to user based on changes to order counts
            if (newOrderCount == 1) {
                // fadeIn()
                alert(1 + " new order!") 
            } else if (newOrderCount > 1) {
                // fadeIn()
                alert(newOrderCount + " new orders!") 
            } else if (newOrderCount == -1) {
                alert("An order was paid")
            } else if (newOrderCount < -1) {
                alert(newOrderCount + " orders have been paid")
            }

            window.countBeforeUpdated = countAfterUpdated;
            // console.log("count before updated = " + countAfterUpdated)

            // re-trigger function to re-add event Listeners after each AJAX request
            // without these the event listeners are removed by the preceding AJAX call
            showTableOrders(event) 

            });
        });
    }       

        












