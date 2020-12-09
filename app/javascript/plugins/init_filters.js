const initFilters = () => {
    const input = document.getElementById("myFilter");
    if(input) {
      input.addEventListener('keyup', handleKeyUp)
      console.log(input.value);
    }
}
const handleKeyUp = () => {
    var input, filter, cards, cardContainer, h5, title, i;
    input = document.getElementById("myFilter");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems");
    cards = cardContainer.getElementsByClassName("card");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body h5.card-title");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}
const initFiltersTwo = () => {
    const input = document.getElementById("myFilter-2");
    if(input) {
      input.addEventListener('keyup', handleKeyUp2)
      console.log(input.innerText);
    }
}
const handleKeyUp2 = () => {
    var input, filter, cards, cardContainer, h5, title, i;
    input = document.getElementById("myFilter-2");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems-2");
    cards = cardContainer.getElementsByClassName("card");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body h5.card-title-2");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}
const initFiltersThree = () => {
    const input = document.getElementById("myFilter-3");
    if(input) {
      input.addEventListener('keyup', handleKeyUp3)
    }
}
const handleKeyUp3 = () => {
    var input, filter, cards, cardContainer, h5, title, i;
    input = document.getElementById("myFilter-3");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems-3");
    cards = cardContainer.getElementsByClassName("card");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body h5.card-title-3");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

const initFiltersFive = () => {
    const input = document.getElementById("myFilter-5");
    if(input) {
      input.addEventListener('keyup', handleKeyUp5)
    }
}
const handleKeyUp5 = () => {
    var input, filter, cards, cardContainer, p, title, i;
    input = document.getElementById("myFilter-5");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems-5");
    cards = cardContainer.getElementsByClassName("card-5");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body p.card-title-5");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

const initFiltersSix = () => {
    const input = document.getElementById("myFilter-6");
    if(input) {
      input.addEventListener('keyup', handleKeyUp6)
    }
}
const handleKeyUp6 = () => {
    var input, filter, cards, cardContainer, p, title, i;
    input = document.getElementById("myFilter-6");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems-6");
    cards = cardContainer.getElementsByClassName("card-6");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body p.card-title-6");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}

const initFiltersSeven = () => {
    const input = document.getElementById("myFilter-7");
    if(input) {
      input.addEventListener('keyup', handleKeyUp7)
    }
}
const handleKeyUp7 = () => {
    var input, filter, cards, cardContainer, p, title, i;
    input = document.getElementById("myFilter-7");
    filter = input.value.toUpperCase();
    cardContainer = document.getElementById("myItems-7");
    cards = cardContainer.getElementsByClassName("card-7");
    for (i = 0; i < cards.length; i++) {
        title = cards[i].querySelector(".card-body p.card-title-7");
        if (title.innerText.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}


export { initFilters };
export { initFiltersTwo };
export { initFiltersThree };
export { initFiltersFive} ;
export { initFiltersSix} ;
export { initFiltersSeven} ;
