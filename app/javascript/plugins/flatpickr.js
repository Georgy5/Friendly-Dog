import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  altInput: true
});

// Initialize Flatpickr with Rails Turbolinks
document.addEventListener('turbolinks:load', start)