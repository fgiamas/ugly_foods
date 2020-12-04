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
}

const handleChangeFlowers = (event) => {
  const currentInput = event.currentTarget.value;
  const allLabels = document.querySelectorAll(".search_flowers label")
  // setting the id of the labels inside .shops_fruits_and_veggies
  const allLabelText = [...document.querySelectorAll(".search_flowers label")].map((label) => {
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
}


const initAutocomplete = () => {
  const input = document.querySelector("#autocomplete")
  if(input) {
    input.addEventListener('keyup', handleChange)
  }
};

const initAutocompleteFlowers = () => {
  const input = document.querySelector("#autocomplete-flowers")
  if(input) {
    input.addEventListener('keyup', handleChangeFlowers)
  }
};


export { initAutocomplete };
export { initAutocompleteFlowers };


