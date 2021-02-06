import flatpickr from "flatpickr";

flatpickr(".datepicker", {
  altInput: true
});

document.addEventListener('turbolinks:load', start)