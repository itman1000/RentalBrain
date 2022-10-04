'use strict'

{
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');
  const eliminate = document.getElementById('eliminate');

  console.log(eliminate);
  
  document.addEventListener("DOMContentLoaded", () => {
    eliminate.addEventListener("click", () => {
      modal.classList.remove('hidden2');
      mask.classList.remove('hidden2');
    });
  });
}