import "bootstrap";
import "../plugins/flatpickr"

// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

initMapbox();

// =======> Show / hide Map

// Toggle showing Restaurants on Map vs Featured on Home page
const mapButtons = document.querySelectorAll(".map-button");
const featuredSection = document.querySelector(".home-featured-section");
const mapSection = document.querySelector(".home-map-section");

mapButtons.forEach((button) => {
  button.addEventListener("click", (event) => {
    mapSection.classList.toggle("show");
    mapSection.classList.toggle("hide");
    featuredSection.classList.toggle("show");
    featuredSection.classList.toggle("hide");
  });
});


// =======> CheckedIn Modal

const checkedinModal = document.querySelector(".checkedin-popup");


// Toggle CheckedIn Modal from NavBar
const checkedinButtons = document.querySelectorAll(".checkin-button");

checkedinButtons.forEach((button) => {
  button.addEventListener("click", (event) => {
    checkedinModal.classList.toggle("show");
    checkedinModal.classList.toggle("hide");
  });
});

// Modal Cancel Button

const checkedinCancelButton = document.querySelector(".button-modal-cancel");

if (checkedinCancelButton) {
  checkedinCancelButton.addEventListener("click", (event) => {
    checkedinModal.classList.toggle("show");
    checkedinModal.classList.toggle("hide");
  });
}


// // =======> Change Order button in menu when submitted

// const orderButtons = document.querySelectorAll(".button-order");

// orderButtons.forEach((button) => {
//   button.addEventListener("click", (event) => {
//     event.preventDefault();
//     console.log(event);
//     console.log("Order placed");
//     button.value = "Done";
//   });
// });




