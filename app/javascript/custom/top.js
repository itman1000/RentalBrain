'use strict';

{
  // トップ画面の表示 /////////////////////////////////////////////////////
  const brain = document.getElementById('brain');
  brain.classList.remove('hidden');

  document.querySelector('h1').classList.remove('hidden');
  document.querySelector('header h3').classList.remove('hidden');
  document.getElementById('header-menu').classList.remove('hidden');

  // サイトの説明の表示 /////////////////////////////////////////////////////
  const targets = document.querySelectorAll(
    '#about-item li, .carousel, .about .container .title'
  );

  const options = {
    threshold: 0.1,
  };

  function autoNext() {
    next.click();           //carousel.jsに中身は記述
  }

  function callback(entries, obs) {
    entries.forEach(entry => {
      if (!entry.isIntersecting) {
        return;
      }
  
      entry.target.classList.add('appear');
      obs.unobserve(entry.target);

      if (document.querySelector('.carousel').classList.contains('appear')) {
        setInterval(autoNext, 5000);
      }
    });
  }


  const observer = new IntersectionObserver(callback, options);

  targets.forEach(target => {
    observer.observe(target);
  })


}