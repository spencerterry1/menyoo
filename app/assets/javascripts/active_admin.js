
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

// ShowTableOrders called after DOM is loaded first time

window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');
    showTableOrders(event)
});

// ShowTableOrders called again immediately after Ajax auto-update function on dashboar

$( document ).ajaxComplete(function(event) {
        console.log('Re-called ShowTableOrders');
        showTableOrders(event) 

});





// MUTATION OBSERVER added to Container to alert user of new orders 



// Callback function to execute when mutations are observed
const callback = function(mutationsList, observer) {
    // Use traditional 'for loops' for IE 11
    for (let mutation of mutationsList) {
        if (mutation.type === 'childList') {
            console.log('New order placed');
            console.log(mutation);
            // alert("new order added");
        }
    }
};

// Observes after page load and sets node to watch + what config changes to detect

window.addEventListener('DOMContentLoaded', (event) => {
    const targetNode = document.getElementById('container');
    const config = { childList: true };
    // setObserver(event, targetNode, config)
    const observer = new MutationObserver(callback);
    // Create an observer instance linked to the callback function
    observer.observe(targetNode, config);
});

// Start observing the target node for configured mutations
// function setObserver(event, targetNode, config) {
    
    
// }












