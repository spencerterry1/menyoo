import "bootstrap";
import "../plugins/flatpickr"

// import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

initMapbox();

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

