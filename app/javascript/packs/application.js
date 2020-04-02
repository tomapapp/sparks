import "bootstrap";

import { initAutocomplete } from '../plugins/init_autocomplete';
initAutocomplete();

import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

import { initToggleMap } from '../components/map';
initToggleMap();

import { avatarUpload } from "../components/upload_avatar"
// Functions for checkboxes to become active
  $(document).ready(function(){
    $(".collection_check_boxes").click(function(){
      $(this).toggleClass("active");
    });
  });

// Functions for first part of radio buttons form in _frequency

  $(document).ready(function(){
    $(".first-form .collection_radio_buttons").click(toggleActive);
  });

  function toggleActive() {
    $(".first-form .collection_radio_buttons").each(function (){
      $(this).toggleClass("active", false);
    })
    $(this).toggleClass("active");
  }

// Functions for second part of radio buttons form in _frequency

  $(document).ready(function(){
    $(".second-form .collection_radio_buttons ").click(toggleActiveSecond);
  });

  function toggleActiveSecond() {
    $(".second-form .collection_radio_buttons").each(function (){
      $(this).toggleClass("active", false);
    })
    $(this).toggleClass("active");
  }

  avatarUpload()
