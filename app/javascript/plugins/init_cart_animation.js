const initCartAnim = () => {
  const cartAnimation = document.querySelector("#cart-animation");
  const animationSlide = document.querySelector("#cart-slide");
  const animationCheckOutLink = document.querySelector("#check-out-link");
  const cartDropdown = document.querySelector("#cart-drop");
  cartAnimation.addEventListener("click",(e)=>{
    e.preventDefault();
    cartDropdown.addEventListener("click", (event) => event.stopImmediatePropagation())
    console.log("clicked");
    animationSlide.classList.add("slide-out-right");
    setTimeout(() => {
      console.log("Waited for a while");
      animationCheckOutLink.click()
    }, 700)
  });
};


export { initCartAnim };
