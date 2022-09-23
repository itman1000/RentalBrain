'use strict';

{
  const next = document.getElementById('next');
  const ul = document.getElementById('carouselId');
  const slides = ul.children;
  const dots = [];
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
      updateDots();
      carouselScroll();
    }
  }

  function setupDots() {
    for (let i = 1; i < slides.length - 1; i++) {
      const button = document.createElement('button');
      button.addEventListener('click', () => {
        currentIndex = i;
        updateDots();
        carouselScroll();
      });
      dots.push(button);
      document.querySelector('nav').appendChild(button);
    }

    dots[0].classList.add('current');
  }

  function updateDots() {
    dots.forEach(dot => {
      dot.classList.remove('current');
    });
    dots[currentIndex - 1].classList.add('current');
  }

  setupDots();

  next.addEventListener('click', () => {
    currentIndex++;

    ul.classList.add('ul-transition');
    carouselScroll();
    
    setTimeout(carouselReverse, 300, childCount-1, 1);

    if (currentIndex > 5 ) {
      currentIndex = 5;
    } else {
      updateDots();
    }
  });

  prev.addEventListener('click', () => {
    currentIndex--;

    ul.classList.add('ul-transition');
    carouselScroll();

    setTimeout(carouselReverse, 300, 0, childCount-2);

    if (currentIndex < 0 ) {
      currentIndex = 0;
    } else {
      updateDots(1);
    }
  });

  window.addEventListener('resize', () => {
    carouselScroll();
  });
}