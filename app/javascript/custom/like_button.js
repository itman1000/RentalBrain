'use_strict';

{

  const like_button = document.getElementById('like_button');

  document.addEventListener("turbo:load", () => {
    like_button.addEventListener('click', () => {
      like_button.classList.toggle('like-btn');
    });
  });
}