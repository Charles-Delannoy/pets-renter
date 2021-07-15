import places from 'places.js';

const initAutocomplete = () => {
  const petAddressInput = document.getElementById('pet_address');
  if (petAddressInput) {
    places({ container: petAddressInput });
  }
};

export { initAutocomplete };
