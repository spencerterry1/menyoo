import "bootstrap";
import "../plugins/flatpickr"

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// Toggle showing Restaurants on Map vs Featured on Home page
const mapButton = document.querySelector(".map-button");
const featuredSection = document.querySelector(".home-featured-section");
const mapSection = document.querySelector(".home-map-section");
mapButton.addEventListener("click", (event) => {
  mapSection.classList.toggle("show");
  mapSection.classList.toggle("hide");
  featuredSection.classList.toggle("show");
  featuredSection.classList.toggle("hide");
});
