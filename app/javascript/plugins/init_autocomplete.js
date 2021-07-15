import places from 'places.js';

const addAutocompleteTo = (id) => {
  console.log("coucou");
  const newInput = document.getElementById(id);
  if (newInput) {
    places({ container: newInput });
  }
};

const initAutocomplete = () => {
  addAutocompleteTo('pet_address');
};

export { initAutocomplete };
