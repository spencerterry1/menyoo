import "bootstrap";
import "../plugins/flatpickr";

// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from "../plugins/init_mapbox";
import { initStarRating } from "../plugins/init_star_rating";

initStarRating();

initMapbox();

// =======> Show / hide Map

// Toggle showing Restaurants on Map vs Featured on Home page
const mapButtons = document.querySelectorAll(".map-button");
const featuredSection = document.querySelector(".home-featured-section");
const mapSection = document.querySelector(".home-map-section");

mapButtons.forEach(button => {
  button.addEventListener("click", event => {
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

checkedinButtons.forEach(button => {
  button.addEventListener("click", event => {
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

// =======> New Review and Intermediary Pay Modal - Call from individual Pay

const newReviewModal = document.querySelector(".newreview-popup");
const newReviewButtons = document.querySelectorAll(".button-new-review");
const newReviewTableButton = document.querySelector("#button-pay-table");
document.addEventListener("DOMContentLoaded", () => {
  let url = window.location.href.split("&");
  let modal = url[url.length - 1];
  if (modal == "modal") {
    newReviewModal.classList.toggle("show");
    newReviewModal.classList.toggle("hide");
  }
})

newReviewButtons.forEach(button => {
  if (button) {
    button.addEventListener("click", event => {
      event.preventDefault();
      newReviewModal.classList.toggle("show");
      newReviewModal.classList.toggle("hide");
    });
  }
});

if (newReviewTableButton) {
  newReviewTableButton.addEventListener("click", event => {
    event.preventDefault();
    window.location.replace(`${event.currentTarget.href}&modal`)
    // newReviewModal.classList.toggle("show");
    // newReviewModal.classList.toggle("hide");
  });
}



