'use_strict'

{
  const commit_button = document.getElementById('commit_button');

  document.addEventListener("turbo:load", () => {
    commit_button.addEventListener("click", () => {
      if (commit_button.textContent === 'コミット') {
        commit_button.textContent = 'コミット解除';
        commit_button.classList.remove('lighten');
        console.log('hey1');
      } else {
        commit_button.textContent = 'コミット';
        commit_button.classList.add('lighten');
        console.log('hey2');
      }
    });
  });
}