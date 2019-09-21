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


// =======> Create Table Modal

const createTableModal = document.querySelector(".newbooking-popup");
const createTableButton = document.querySelector("#button-create-table");


if (createTableButton) {
  createTableButton.addEventListener("click", (event) => {
      createTableModal.classList.toggle("show");
      createTableModal.classList.toggle("hide");
  });
}


// =======> Table Order vs Your Order

const yourButton = document.querySelector("#summary-button-your");
const tableButton = document.querySelector("#summary-button-table");
const yourSection = document.querySelector("#summary-section-your");
const tableSection = document.querySelector("#summary-section-table");

if (yourButton && tableButton) {

  yourButton.addEventListener("click", (event) => {
    yourSection.classList.toggle("show");
    yourSection.classList.toggle("hide");
    tableSection.classList.toggle("show");
    tableSection.classList.toggle("hide");
    yourButton.classList.toggle("grey-font");
    tableButton.classList.toggle("grey-font");
  });

  tableButton.addEventListener("click", (event) => {
    yourSection.classList.toggle("show");
    yourSection.classList.toggle("hide");
    tableSection.classList.toggle("show");
    tableSection.classList.toggle("hide");
    yourButton.classList.toggle("grey-font");
    tableButton.classList.toggle("grey-font");
  });

}















