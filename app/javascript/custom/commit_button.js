'use_strict'

{
  const commit_button = document.getElementById('commit_button');
  const answer_button = document.getElementById('answer_button');

  document.addEventListener("turbo:load", () => {
    commit_button.addEventListener("click", () => {
      if (commit_button.textContent === 'コミット') {
        commit_button.textContent = 'コミット解除';
        answer_button.className = 'button1';
      } else {
        commit_button.textContent = 'コミット';
        answer_button.className = 'button4';
      }
      commit_button.classList.toggle('lighten');
    });
  });
}