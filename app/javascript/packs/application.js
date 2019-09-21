import "bootstrap";
import "../plugins/flatpickr"

// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

// initMapbox();

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


// =======> Button to delete typed searches in searchbars
// =======> DeleteButton is the button to erase search in the Restaurant Index search bar
// =======> DeleteButtonTwo is the button to erase search in the Restaurant Show search bar


const searchInput = document.querySelector("#query");
const deleteButton = document.querySelector("#delete-button");
const deleteButtonTwo = document.querySelector("#delete-button-two");

if (searchInput && deleteButton) {
  searchInput.addEventListener("input", (event) => {
    if (event.target.value.length > 0) {
      deleteButton.style.display = "block";
    } else if (event.target.value.length === 0) {
      deleteButton.style.display = "none"
    }
    deleteButton.addEventListener("click", () => {
       searchInput.value = "";
       deleteButton.style.display = "none";
    });
  });
}

if (searchInput && deleteButtonTwo) {
  searchInput.addEventListener("input", (event) => {
    if (event.target.value.length > 0) {
      deleteButtonTwo.style.display = "block";
    } else if (event.target.value.length === 0) {
      deleteButtonTwo.style.display = "none"
    }
    deleteButtonTwo.addEventListener("click", () => {
       searchInput.value = "";
       deleteButtonTwo.style.display = "none";
    });
  });
}


