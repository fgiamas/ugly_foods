const handleChange = (event) => {
  const currentInput = event.currentTarget.value;
  const allLabels = document.querySelectorAll(".search_fruits_and_veggies label")
  // setting the id of the labels inside .shops_fruits_and_veggies
  const allLabelText = [...document.querySelectorAll(".search_fruits_and_veggies label")].map((label) => {
    label.id = label.innerText
    return label.innerText
  })

  console.log(allLabelText)

  const results = allLabelText.filter(item => {
    return item.startsWith(currentInput)
  })

  allLabels.forEach(label => {
    label.parentElement.classList.add('hidden-label')
  })

  results.forEach(item => {
    document.querySelector(`#${item}`).parentElement.classList.remove("hidden-label")
  })

  // const allInputs = document.querySelectorAll(".search_fruits_and_veggies input").forEach(input => {
  //   const collection = document.querySelector('#collection')
  //   collection.innerHTML = ""
  //   if(input.checked) {
  //     collection.insertAdjacentHTML('beforeend', `<li>${input.value}</li>`)
  //   }
  // })
}

// const initHideSelection = () => {
//   const input = document.querySelector("#fruits-and-veg-search")
//   console.log(input);
//   if(input) {
//     input.addEventListener('click', handleChange)
//   }
// };

const initAutocomplete = () => {
  const input = document.querySelector("#autocomplete")
  if(input) {
    input.addEventListener('keyup', handleChange)
  }
};

export { initAutocomplete };
// export { initHideSelection };


// what is this??

// import places from 'places.js';

// const initAutocomplete = () => {
//   const addressInput = document.getElementById('shop_address');
//   if (addressInput) {
//     places({ container: addressInput });
//   }
// };
