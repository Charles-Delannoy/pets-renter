import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr(".datepicker", {});
flatpickr(".datepicker", {
  altInput: true
});


flatpickr("#start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#end"})]
});
