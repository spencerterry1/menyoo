
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



// Declare function to assign fade in class to order DIVs - Checked In / Ordered / Paid

function fadeInCheckedInBookings(element) {
    let tagetNode = document.getElementById(element)
    alert(`New checkin - Booking: ${element}`);
    console.log("NEW CHECKINS" + element)
    tagetNode.parentNode.parentNode.classList.add("fade-in-checked-in");
}

function fadeInOrderedBookings(element) {
    let tagetNode = document.getElementById(element)
    alert(`New orders for booking: ${element}`);
    console.log("NEW ORDERS")
    tagetNode.parentNode.parentNode.classList.add("fade-in-ordered");
}

function fadeInPaidBookings(element) {
    let tagetNode = document.getElementById(element)
    alert(`Bill paid - Booking: ${element}`);
    console.log("NEW PAIDS")
    tagetNode.parentNode.parentNode.classList.add("fade-in-paid");
}


// function checkedInOrders() {
//     const CheckedInCountAfterUpdated = $('#container-main').find('.checkedin_bookings').length;
//     const newCheckedInCount = CheckedInCountAfterUpdated - checkedInCountBeforeUpdated
//     console.log(checkedInCountBeforeUpdated + ' checked in bookings');
// }


// Function to send AJAX request every 10 seconds + send alerts if there are new orders / orders paid

function reloadDashboard() {
    $(document).ready(function() {

        // Capture CHECKED IN bookings on 1st page load
        window.checkedInCountBeforeUpdated = document.querySelectorAll('.checkedin-booking-id');
        window.checkedInCountBeforeUpdatedArray = []
        checkedInCountBeforeUpdated.forEach(element => {
            let id = Number(element.id)
            checkedInCountBeforeUpdatedArray.push(id)
        });

        // Capture ORDERED bookings on 1st page load
        window.orderedCountBeforeUpdated = document.querySelectorAll('.ordered-booking-id');
        window.orderedCountBeforeUpdatedArray = []
        orderedCountBeforeUpdated.forEach(element => {
            let id = Number(element.id)
            orderedCountBeforeUpdatedArray.push(id)
        });

        // Capture PAID bookings on 1st page load
        window.paidCountBeforeUpdatedArray = []
        window.paidCountBeforeUpdated = document.querySelectorAll('.paid-booking-id');
        paidCountBeforeUpdated.forEach(element => {
            let id = Number(element.id)
            paidCountBeforeUpdatedArray.push(id)
        });

        // function to check DB for new orders every 10 seconds
        setInterval(function() {
            $("#container-main").load("dashboard/refresh_orders");
            }, 10000);

        // function triggered after AJAX call made to compare orders before + after and calculate difference
        $(document).ajaxComplete(function(event) {


            // Capture ORDERED bookings after 1st page load
            window.checkedInCountAfterUpdated = document.querySelectorAll('.checkedin-booking-id')
            window.checkedInCountAfterUpdatedArray = []
            checkedInCountAfterUpdated.forEach((element) => {
                let id = Number(element.id)
                checkedInCountAfterUpdatedArray.push(id)
            })
            // Compare ORDERED bookings with those in first load - if new ones then call the fadeIn function to apply dynamic styling
            checkedInCountAfterUpdatedArray.forEach((element) => {
                if (checkedInCountBeforeUpdatedArray.includes(element)) {
                    console.log("no new CHECKINS")
                } else {
                    console.log("new CHECKINS")
                    fadeInCheckedInBookings(element)
                }
                // Reset the updated count to be the new starting (before update) count for next page load
                window.checkedInCountBeforeUpdatedArray = window.checkedInCountAfterUpdatedArray
            });
            // console.log("BEFORE: " + checkedInCountBeforeUpdatedArray + " " + " AFTER: " + checkedInCountAfterUpdatedArray)
            // console.log("New BEFORE COUNT: " + checkedInCountAfterUpdatedArray)

            // Capture ORDERED bookings after 1st page load
            window.orderedCountAfterUpdated = document.querySelectorAll('.ordered-booking-id')
            window.orderedCountAfterUpdatedArray = []
            orderedCountAfterUpdated.forEach((element) => {
                let id = Number(element.id)
                orderedCountAfterUpdatedArray.push(id)
            })
            // Compare ORDERED bookings with those in first load - if new ones then call the fadeIn function to apply dynamic styling
            orderedCountAfterUpdatedArray.forEach((element) => {
                if (orderedCountBeforeUpdatedArray.includes(element)) {
                    console.log("no new ORDERS")
                } else {
                    console.log("new ORDERS")
                    fadeInOrderedBookings(element)
                }
                console.log("NEW: " + orderedCountAfterUpdatedArray + "OLD: " + orderedCountBeforeUpdatedArray)
                // Reset the updated count to be the new starting (before update) count for next page load
                window.orderedCountBeforeUpdatedArray = window.orderedCountAfterUpdatedArray
            });

            // Capture PAID bookings after 1st page load
            window.paidCountAfterUpdated = document.querySelectorAll('.paid-booking-id')
            window.paidCountAfterUpdatedArray = []
            paidCountAfterUpdated.forEach((element) => {
                let id = Number(element.id)
                paidCountAfterUpdatedArray.push(id)
            })
            // Compare PAID bookings with those in first load - if new ones then call the fadeIn function to apply dynamic styling
            paidCountAfterUpdatedArray.forEach((element) => {
                if (paidCountBeforeUpdatedArray.includes(element)) {
                    console.log("no new PAIDS")
                } else {
                    console.log("new PAIDS")
                    fadeInPaidBookings(element)
                }
                // Reset the updated count to be the new starting (before update) count for next page load
                window.paidCountBeforeUpdatedArray = window.paidCountAfterUpdatedArray
            });


            showTableOrders(event) 

            });
        });
    }       

        












