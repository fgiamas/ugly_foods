const initIntersectionObserver = () => {
if(document.querySelector(".pages-home")) {

  const intersectionObserver = new IntersectionObserver(function(entries) {
  // If intersectionRatio is 0, the target is out of view
  // and we do not need to do anything.
  if (entries[0].intersectionRatio <= 0) {
    if(entries[0].target.classList.contains('animating')) {
      entries[0].target.classList.remove('animating')
    }
  } else {
      entries[0].target.classList.add('animating')
  };

    //loadItems(10);
  });

  // intersectionObserver.observe(document.querySelector('.tracking-in-contract'));
  intersectionObserver.observe(document.querySelector('.tracking-in-contracts'));
  intersectionObserver.observe(document.querySelector('.tracking-in-contractz'));

  intersectionObserver.observe(document.querySelector('.scale-up-centerz'));


}

};
// start observing



export { initIntersectionObserver };

















