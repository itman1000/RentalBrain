'use strict';

{
  const next = document.getElementById('next');
  const ul = document.getElementById('carouselId');
  const slides = ul.children;
  let currentIndex = 1;
  const childCount = ul.childElementCount;

  function carouselScroll() {
    const slidesWidth = slides[0].getBoundingClientRect().width;
    ul.style.transform = `translateX(${-1 * slidesWidth * currentIndex / 10}rem)`;
  }

  function carouselReverse(terms, setVal) {
    if (currentIndex === terms) {
      currentIndex = setVal;
      ul.classList.remove('ul-transition');
      carouselScroll();
    }
  }


  next.addEventListener('click', () => {
    currentIndex++;

    ul.classList.add('ul-transition');
    carouselScroll();
    
    setTimeout(carouselReverse, 300, childCount-1, 1);

    if (currentIndex > 5 ) {
      currentIndex = 5;
    }
  });

  prev.addEventListener('click', () => {
    currentIndex--;

    ul.classList.add('ul-transition');
    carouselScroll();

    setTimeout(carouselReverse, 300, 0, childCount-2);

    if (currentIndex < 0 ) {
      currentIndex = 0;
    }
  });

  window.addEventListener('resize', () => {
    carouselScroll();
  });
}