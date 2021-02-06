// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require('select2')


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { multipleSelect } from "../components/select2";
import { profileTabs } from "../components/tabs";
import { initStarRating } from '../plugins/init_star_rating';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
// import { initUpdateNavbarOnScroll } from "../components/navbar";

document.addEventListener('turbolinks:load', () => {
  initStarRating();
  profileTabs();
  multipleSelect();
  // initUpdateNavbarOnScroll();
});

console.log("Hope you're having a great day today.");
