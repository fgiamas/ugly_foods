
const handleChange = (event) => {
  const currentInput = event.currentTarget.value;
  console.log(currentInput);
  const allLabels = document.querySelectorAll(".shops_fruits_and_veggies label")
  console.log(allLabels);
  const allLabelText = [...document.querySelectorAll(".shops_fruits_and_veggies label")].map((label) => {
    // setting the id of the labels inside .shops_fruits_and_veggies
    label.id = label.innerText
    return label.innerText
  })

  const results = allLabelText.filter(item => {
    return item.startsWith(currentInput)
  })

  allLabels.forEach(label => {
    label.classList.add('hidden-label')
  })

  results.forEach(item => {
    document.querySelector(`#${item}`).classList.remove("hidden-label")
  })
}

const initHideSelection = () => {
  const input = document.querySelector("#fruits-and-veg-search")
  console.log(input);
  if(input) {
    input.addEventListener('click', handleChange)
  }
};

const initAutocomplete = () => {
  const input = document.querySelector("#autocomplete")
  console.log(input);
  if(input) {
    input.addEventListener('keyup', handleChange)
  }
};

export { initHideSelection };
export { initAutocomplete };
